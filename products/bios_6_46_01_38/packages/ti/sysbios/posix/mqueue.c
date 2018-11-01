/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== mqueue.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Mailbox.h>

#include <ti/sysbios/posix/pthread.h>
#include <ti/sysbios/posix/mqueue.h>
#include <ti/sysbios/posix/_pthread_error.h>

/*
 *  ======== MQueueObj ========
 */
typedef struct MQueueObj {
    struct MQueueObj  *next;
    struct MQueueObj  *prev;
    Mailbox_Handle     mailbox;
    mq_attr            attrs;
    int                refCount;
    char              *name;
} MQueueObj;

typedef struct MQueueDesc {
    MQueueObj         *msgQueue;
    long               flags;
} MQueueDesc;

static MQueueObj *findInList(const char *name);

static MQueueObj *mqList = NULL;

/*
 *  ======== mq_close ========
 */
int mq_close(mqd_t mqdes)
{
    MQueueDesc *mqd = (MQueueDesc *)mqdes;
    MQueueObj  *msgQueue = mqd->msgQueue;
    UInt key;

    Memory_free(Task_Object_heap(), mqd, sizeof(MQueueDesc));

    key = Task_disable();
    msgQueue->refCount--;
    Task_restore(key);

    return (0);
}

/*
 *  ======== mq_getattr ========
 */
int mq_getattr(mqd_t mqdes, struct mq_attr *mqstat)
{
    MQueueDesc *mqd = (MQueueDesc *)mqdes;
    MQueueObj  *msgQueue = mqd->msgQueue;
    UInt        key;

    key = Task_disable();
    *mqstat = msgQueue->attrs;
    mqstat->mq_flags = mqd->flags;
    Task_restore(key);

    return (0);
}

/*
 *  ======== mq_open ========
 */
mqd_t mq_open(const char *name, int oflags, ...)
{
    va_list           va;
    mode_t            mode;
    mq_attr          *attrs = NULL;
    MQueueObj        *msgQueue;
    MQueueDesc       *msgQueueDesc = NULL;
    MQueueDesc       *mqd = (MQueueDesc *)(-1);
    Error_Block       eb;
    UInt              key;


    va_start(va, oflags);

    if (oflags & O_CREAT) {
        mode = va_arg(va, mode_t);
        attrs = va_arg(va, mq_attr*);
    }

    va_end(va);

    Error_init(&eb);

    msgQueue = findInList(name);

    if ((msgQueue != NULL) && (oflags & O_CREAT) && (oflags & O_EXCL)) {
        /* Error: Message queue has alreadey been opened and O_EXCL is set */
        goto done;
    }

    if ((msgQueue == NULL) && !(oflags & O_CREAT)) {
        /* Error: Message has not been opened and O_CREAT is not set */
        goto done;
    }

    mqd = msgQueueDesc =
        (MQueueDesc *)Memory_alloc(Task_Object_heap(), sizeof(MQueueDesc),
        0, &eb);
    if (msgQueueDesc == NULL) {
        mqd = (MQueueDesc *)(-1);
        goto done;
    }

    if (msgQueue == NULL) {
        if ((attrs == NULL) || (attrs->mq_maxmsg <= 0) ||
                (attrs->mq_msgsize <= 0)) {
            mqd = (MQueueDesc *)(-1);
            goto done;
        }

        /* Allocate the MQueueObj */
        msgQueue = (MQueueObj *)Memory_alloc(Task_Object_heap(),
                sizeof(MQueueObj), 0, &eb);
        if (msgQueue == NULL) {
            mqd = (MQueueDesc *)(-1);
            goto done;
        }

        msgQueue->refCount = 1;
        msgQueue->attrs = *attrs;

        msgQueue->name = (char *)Memory_alloc(Task_Object_heap(),
                strlen(name) + 1, 0, &eb);

        if (msgQueue->name == NULL) {
            mqd = (MQueueDesc *)(-1);
            goto done;
        }

        strcpy(msgQueue->name, name);

        msgQueue->mailbox = Mailbox_create(attrs->mq_msgsize,
                attrs->mq_maxmsg, NULL, NULL);

        if (msgQueue->mailbox == NULL) {
            mqd = (MQueueDesc *)(-1);
            goto done;
        }

        /*
         *  Add the message queue to the list now
         */
        msgQueue->prev = NULL;

        key = Task_disable();

        if (mqList != NULL) {
            mqList->prev = msgQueue;
        }

        msgQueue->next = mqList;
        mqList = msgQueue;
    }
    else {
        key = Task_disable();
        msgQueue->refCount++;
    }

    Task_restore(key);

    mqd = msgQueueDesc;
    mqd->msgQueue = msgQueue;

    if (oflags & O_NONBLOCK) {
        mqd->flags = O_NONBLOCK;
    }
    else {
        mqd->flags = 0;
    }

done:
    if (mqd == (MQueueDesc *)(-1)) {
        if (msgQueue != NULL) {
            if (msgQueue->name != NULL) {
                Memory_free(Task_Object_heap(), msgQueue->name,
                    strlen(name) + 1);
            }
            Memory_free(Task_Object_heap(), msgQueue, sizeof(MQueueObj));
        }

        if (msgQueueDesc != NULL) {
            Memory_free(Task_Object_heap(), msgQueueDesc, sizeof(MQueueDesc));
        }
    }

    (void)mode;

    return ((mqd_t)mqd);
}

/*
 *  ======== mq_receive ========
 *  On success, returns the number of bytes in the message.  On failure,
 *  returns -1 and sets errno to the appropriate error.
 */
long mq_receive(mqd_t mqdes, char *msg_ptr, size_t msg_len,
        unsigned int *msg_prio)
{
    MQueueDesc *mqd = (MQueueDesc *)mqdes;
    MQueueObj  *msgQueue = mqd->msgQueue;
    UInt32      timeout;
    int         retVal = -1;

    if (mqd->flags & O_NONBLOCK) {
        timeout = BIOS_NO_WAIT;
    }
    else {
        timeout = BIOS_WAIT_FOREVER;
    }

    /* Receive a message */
    if (Mailbox_pend(msgQueue->mailbox, (Ptr)msg_ptr, timeout)) {
        retVal = (msgQueue->attrs).mq_msgsize;
    }

    return (retVal);
}

/*
 *  ======== mq_send ========
 */
int mq_send(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
        unsigned int msg_prio)
{
    MQueueDesc *mqd = (MQueueDesc *)mqdes;
    MQueueObj  *msgQueue = mqd->msgQueue;
    UInt32 timeout;

    if (mqd->flags & O_NONBLOCK) {
        timeout = BIOS_NO_WAIT;
    }
    else {
        timeout = BIOS_WAIT_FOREVER;
    }

    /* Send a message */
    if (!Mailbox_post(msgQueue->mailbox, (Ptr)msg_ptr, timeout)) {
        return (-1);
    }

    return (0);
}

/*
 *  ======== mq_setattr ========
 */
int mq_setattr(mqd_t mqdes, const struct mq_attr *mqstat,
        struct mq_attr *omqstat)
{
    MQueueDesc *mqd = (MQueueDesc *)mqdes;
    MQueueObj  *msgQueue = mqd->msgQueue;
    UInt        key;

    Assert_isTrue((mqstat->mq_flags == 0) || (mqstat->mq_flags == O_NONBLOCK),
        0);

    /*
     *  The message queue attributes corresponding to the following
     *  members defined in the mq_attr structure shall be set to the
     *  specified values upon successful completion of mq_setattr():
     *  mq_flags
     *        The value of this member is the bitwise-logical OR of
     *        zero or more of O_NONBLOCK and any implementation-defined flags.
     *
     *  The values of the mq_maxmsg, mq_msgsize, and mq_curmsgs members of
     *  the mq_attr structure shall be ignored by mq_setattr().
    */
    key = Task_disable();

    if (omqstat != NULL) {
        *omqstat = msgQueue->attrs;
        omqstat->mq_flags = mqd->flags;
    }

    mqd->flags = mqstat->mq_flags;

    Task_restore(key);

    return (0);
}

/*
 *  ======== mq_timedreceive ========
 */
long mq_timedreceive(mqd_t mqdes, char *msg_ptr, size_t msg_len,
        unsigned int *msg_prio, const struct timespec *abstime)
{
    MQueueDesc         *mqd = (MQueueDesc *)mqdes;
    MQueueObj          *msgQueue = mqd->msgQueue;
    struct timespec     curtime;
    UInt32              timeout;
    long                usecs = 0;
    time_t              secs = 0;
    int                 retVal = -1;

    if (mqd->flags & O_NONBLOCK) {
        timeout = BIOS_NO_WAIT;
    }
    else {
        if ((abstime->tv_nsec < 0) || (1000000000 < abstime->tv_nsec)) {
            return (-1);
        }

        clock_gettime(0, &curtime);
        secs = abstime->tv_sec - curtime.tv_sec;

        if ((abstime->tv_sec < curtime.tv_sec) ||
                ((secs == 0) && (abstime->tv_nsec <= curtime.tv_nsec))) {
            timeout = 0;
        }
        else {
            usecs = (abstime->tv_nsec - curtime.tv_nsec) / 1000;

            if (usecs < 0) {
                usecs += 1000000;
                secs--;
            }
            usecs += secs * 1000000;
            timeout = usecs / Clock_tickPeriod;
        }
    }

    /* Wait forever to receive a message */
    if (Mailbox_pend(msgQueue->mailbox, (Ptr)msg_ptr, timeout)) {
        retVal = (msgQueue->attrs).mq_msgsize;
    }

    return (retVal);
}

/*
 *  ======== mq_timedsend ========
 */
int mq_timedsend(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
        unsigned int msg_prio, const struct timespec *abstime)
{
    MQueueDesc         *mqd = (MQueueDesc *)mqdes;
    MQueueObj          *msgQueue = mqd->msgQueue;
    struct timespec     curtime;
    UInt32              timeout;
    long                usecs = 0;
    time_t              secs = 0;
    int                 retVal = 0;

    if (mqd->flags & O_NONBLOCK) {
        timeout = BIOS_NO_WAIT;
    }
    else {
        if ((abstime->tv_nsec < 0) || (1000000000 < abstime->tv_nsec)) {
            return (-1);
        }

        clock_gettime(0, &curtime);
        secs = abstime->tv_sec - curtime.tv_sec;

        if ((abstime->tv_sec < curtime.tv_sec) ||
                ((secs == 0) && (abstime->tv_nsec <= curtime.tv_nsec))) {
            timeout = 0;
        }
        else {
            usecs = (abstime->tv_nsec - curtime.tv_nsec) / 1000;

            if (usecs < 0) {
                usecs += 1000000;
                secs--;
            }
            usecs += secs * 1000000;
            timeout = usecs / Clock_tickPeriod;
        }
    }

    /* Wait for timeout to send a message */
    if (!Mailbox_post(msgQueue->mailbox, (Ptr)msg_ptr, timeout)) {
        retVal = -1;
    }

    return (retVal);
}

/*
 *  ======== mq_unlink ========
 */
int mq_unlink(const char *name)
{
    MQueueObj  *msgQueue;
    MQueueObj  *nextMQ, *prevMQ;
    UInt        key;

    key = Task_disable();

    msgQueue = findInList(name);

    if ((msgQueue != NULL) && (msgQueue->refCount == 0)) {
        /* If the message queue is in the list, remove it. */
        if (mqList == msgQueue) {
            mqList = msgQueue->next;
        }
        else {
            prevMQ = msgQueue->prev;
            nextMQ = msgQueue->next;

            if (prevMQ) {
                prevMQ->next = nextMQ;
            }
            if (nextMQ) {
                nextMQ->prev = prevMQ;
            }
        }

        msgQueue->next = msgQueue->prev = NULL;

        Task_restore(key);

        if (msgQueue->mailbox != NULL) {
            Mailbox_delete(&msgQueue->mailbox);
        }

        if (msgQueue->name != NULL) {
            Memory_free(Task_Object_heap(), msgQueue->name,
                    strlen(msgQueue->name) + 1);
        }

        Memory_free(Task_Object_heap(), msgQueue, sizeof(MQueueObj));

        return (0);
    }

    Task_restore(key);

    return (-1);
}

/*
 *************************************************************************
 *                      Internal functions
 *************************************************************************
 */

/*
 *  ======== findInList ========
 */
static MQueueObj *findInList(const char *name)
{
    MQueueObj *mq;

    mq = mqList;

    while (mq != NULL) {
        if (strcmp(mq->name, name) == 0) {
            return (mq);
        }
        mq = mq->next;
    }

    return (NULL);
}

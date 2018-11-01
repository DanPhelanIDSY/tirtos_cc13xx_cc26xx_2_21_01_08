/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-B06
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_mw
{
    static final String VERS = "@(#) xdc-B06\n";

    static final Proto.Elm $$T_Bool = Proto.Elm.newBool();
    static final Proto.Elm $$T_Num = Proto.Elm.newNum();
    static final Proto.Elm $$T_Str = Proto.Elm.newStr();
    static final Proto.Elm $$T_Obj = Proto.Elm.newObj();

    static final Proto.Fxn $$T_Met = new Proto.Fxn(null, null, 0, -1, false);
    static final Proto.Map $$T_Map = new Proto.Map($$T_Obj);
    static final Proto.Arr $$T_Vec = new Proto.Arr($$T_Obj);

    static final XScriptO $$DEFAULT = Value.DEFAULT;
    static final Object $$UNDEF = Undefined.instance;

    static final Proto.Obj $$Package = (Proto.Obj)Global.get("$$Package");
    static final Proto.Obj $$Module = (Proto.Obj)Global.get("$$Module");
    static final Proto.Obj $$Instance = (Proto.Obj)Global.get("$$Instance");
    static final Proto.Obj $$Params = (Proto.Obj)Global.get("$$Params");

    static final Object $$objFldGet = Global.get("$$objFldGet");
    static final Object $$objFldSet = Global.get("$$objFldSet");
    static final Object $$proxyGet = Global.get("$$proxyGet");
    static final Object $$proxySet = Global.get("$$proxySet");
    static final Object $$delegGet = Global.get("$$delegGet");
    static final Object $$delegSet = Global.get("$$delegSet");

    Scriptable xdcO;
    Session ses;
    Value.Obj om;

    boolean isROV;
    boolean isCFG;

    Proto.Obj pkgP;
    Value.Obj pkgV;

    ArrayList<Object> imports = new ArrayList<Object>();
    ArrayList<Object> loggables = new ArrayList<Object>();
    ArrayList<Object> mcfgs = new ArrayList<Object>();
    ArrayList<Object> icfgs = new ArrayList<Object>();
    ArrayList<String> inherits = new ArrayList<String>();
    ArrayList<Object> proxies = new ArrayList<Object>();
    ArrayList<Object> sizes = new ArrayList<Object>();
    ArrayList<Object> tdefs = new ArrayList<Object>();

    void $$IMPORTS()
    {
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.mw.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.mw", new Value.Obj("ti.mw", pkgP));
    }

    void Config$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.mw.Config.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.mw.Config", new Value.Obj("ti.mw.Config", po));
        pkgV.bind("Config", vo);
        // decls 
    }

    void Config$$CONSTS()
    {
        // module Config
    }

    void Config$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Config$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Config$$SIZES()
    {
    }

    void Config$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/mw/Config.xs");
        om.bind("ti.mw.Config$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.mw.Config.Module", "ti.mw");
        po.init("ti.mw.Config.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("provideDisplayLib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("provideGrLib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("provideLCDLib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("provideWiFiCC3X00Lib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("supportsDisplayLib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("supportsGrLib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("supportsLCDLib", $$T_Bool, $$UNDEF, "wh");
        po.addFld("supportsWiFiCC3X00Lib", $$T_Bool, $$UNDEF, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.mw.Config$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.mw.Config$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.mw.Config$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Config$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.mw.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.mw"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.mw", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.mw");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.mw.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.mw'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.mw$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.mw$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.mw$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Config$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.mw.Config", "ti.mw");
        po = (Proto.Obj)om.findStrict("ti.mw.Config.Module", "ti.mw");
        vo.init2(po, "ti.mw.Config", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.mw.Config$$capsule", "ti.mw"));
        vo.bind("$package", om.findStrict("ti.mw", "ti.mw"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.mw")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.mw.Config$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Config", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Config");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.mw.Config", "ti.mw"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.mw.Config")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.mw")).add(pkgV);
    }

    public void exec( Scriptable xdcO, Session ses )
    {
        this.xdcO = xdcO;
        this.ses = ses;
        om = (Value.Obj)xdcO.get("om", null);

        Object o = om.geto("$name");
        String s = o instanceof String ? (String)o : null;
        isCFG = s != null && s.equals("cfg");
        isROV = s != null && s.equals("rov");

        $$IMPORTS();
        $$OBJECTS();
        Config$$OBJECTS();
        Config$$CONSTS();
        Config$$CREATES();
        Config$$FUNCTIONS();
        Config$$SIZES();
        Config$$TYPES();
        if (isROV) {
            Config$$ROV();
        }//isROV
        $$SINGLETONS();
        Config$$SINGLETONS();
        $$INITIALIZATION();
    }
}
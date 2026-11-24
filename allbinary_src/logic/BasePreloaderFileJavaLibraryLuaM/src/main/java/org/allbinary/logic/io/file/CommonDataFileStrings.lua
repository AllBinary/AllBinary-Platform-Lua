-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.logic.io.file

local CommonDataFileStrings = {}
package.loaded["org.allbinary.logic.io.file.CommonDataFileStrings"] = CommonDataFileStrings

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CommonDataFileStrings is declared before the requires
CommonDataFileStrings.__index = CommonDataFileStrings
CommonDataFileStrings.className = "CommonDataFileStrings"
CommonDataFileStrings.javaClassName = "org.allbinary.logic.io.file.CommonDataFileStrings"

function CommonDataFileStrings:_init_fields()
    self.XML = "xml"
    self._XML = ".xml"
    self.JSON = "json"
    self._JSON = ".json"
    self.XSL = "xsl"
    self._XSL = ".xsl"
    self.JAVA = "java"
    self._JAVA = ".java"
    self.KT = "kt"
    self._KT = ".kt"
    self.TS = "ts"
    self._TS = ".ts"
    self.JS = "js"
    self._JS = ".js"
    self.CPP = "cpp"
    self._CPP = ".cpp"
    self.H = "h"
    self._H = ".h"
    self.PY = "py"
    self._PY = ".py"
    self.GO = "go"
    self._GO = ".go"
    self.CS = "cs"
    self._CS = ".cs"
    self.ADB = "adb"
    self._ADB = ".adb"
    self.ADS = "ads"
    self._ADS = ".ads"
    self.ADA = "ada"
    self._ADA = ".ada"
    self.RUST = "rs"
    self._RUST = ".rs"
    self.C = "c"
    self._C = ".c"
    self.CSHARP = "cs"
    self._CSHARP = ".cs"
    self.ERL = "erl"
    self._ERL = ".erl"
    self.HS = "hs"
    self._HS = ".hs"
    self.HX = "hx"
    self._HX = ".hx"
    self.LUA = "lua"
    self._LUA = ".lua"
    self.PAS = "pas"
    self._PAS = ".pas"
    self.ML = "ml"
    self._ML = ".ml"
    self.PL = "pl"
    self._PL = ".pl"
    self.RB = "rb"
    self._RB = ".rb"
    self.ZIG = "zig"
    self._ZIG = ".zig"
    self.PM = "pm"
    self._PM = ".pm"
    self.KTS = "kts"
    self._KTS = ".kts"
    self.CBL = "cbl"
    self._CBL = ".cbl"
    self.COB = "cob"
    self._COB = ".cob"
    self.F90 = "f90"
    self._F90 = ".f90"
    self.F = "f"
    self._F = ".f"
    self.DART = "dart"
    self._DART = ".dart"
    self.EX = "ex"
    self._EX = ".ex"
    self.EXS = "exs"
    self._EXS = ".exs"
    self.M = "m"
    self._M = ".m"
    self.SWIFT = "swift"
    self._SWIFT = ".swift"
    self.ASM = "asm"
    self._ASM = ".asm"
    self.S = "s"
    self._S = ".s"
    self.NIM = "nim"
    self._NIM = ".nim"
    self.VALA = "vala"
    self._VALA = ".vala"
    self.LISP = "lisp"
    self._LISP = ".lisp"
    self.RKT = "rkt"
    self._RKT = ".rkt"
    self.SCM = "scm"
    self._SCM = ".scm"
    self.AS = "as"
    self._AS = ".as"
    self.OBX = "obx"
    self._OBX = ".obx"
    self.SCALA = "scala"
    self._SCALA = ".scala"
    self.GROOVY = "groovy"
    self._GROOVY = ".groovy"
    self.JL = "jl"
    self._JL = ".jl"
    self.TCL = "tcl"
    self._TCL = ".tcl"
    self.WREN = "wren"
    self._WREN = ".wren"
    self.JANET = "janet"
    self._JANET = ".janet"
    self.GR = "gr"
    self._GR = ".gr"
    self.ELM = "elm"
    self._ELM = ".elm"
    self.KOTLIN = "kotlin"
    self.TYPESCRIPT = "typescript"
    self.JAVASCRIPT = "javascript"
    self.C_PLUS_PLUS = "c++"
    self.PYTHON = "python"
    self.C_SHARP = "c#"
    self.RUST_NAME = "rust"
    self.RUBY = "ruby"
    self.PERL = "perl"
    self.OBJECT_PASCAL = "objectpascal"
    self.OCAML = "ocaml"
    self.HASKELL = "haskell"
    self.HAXE = "haxe"
    self.ERLANG = "erlang"
    self.COBOL = "cobol"
    self.FORTRAN = "fortran"
    self.ELIXIR = "elixir"
    self.OBJECTIVE_C = "objective-c"
    self.RACKET = "racket"
    self.SCHEME = "scheme"
    self.ACTIONSCRIPT = "actionscript"
    self.OBERON_PLUS = "oberon+"
    self.JULIA = "julia"
    self.GRAIN = "grain"
    self.CPLUSPLUS = "cplusplus"
    self.GOLANG = "golang"
    self.CSHARP_ALIAS = "csharp"
    self.C23 = "c23"
    self.PASCAL = "pascal"
    self.OBJECT_PASCAL_ALIAS = "object pascal"
    self.OBJC = "objc"
    self.OBJECTIVE_C_ALIAS = "objectivec"
    self.ASSEMBLY = "assembly"
    self.COMMON_LISP = "common lisp"
    self.OBERON = "oberon"
    self.OBERON_PLUS_ALIAS = "oberonplus"
    self.KT_SHORT_NAME = "Kt"
    self.TS_SHORT_NAME = "Ts"
    self.JS_SHORT_NAME = "Js"
    self.CPP_SHORT_NAME = "Cpp"
    self.PY_SHORT_NAME = "Py"
    self.GO_SHORT_NAME = "Go"
    self.CS_SHORT_NAME = "Cs"
    self.ADA_SHORT_NAME = "Ada"
    self.RUST_SHORT_NAME = "Rust"
    self.LUA_SHORT_NAME = "Lua"
    self.C_SHORT_NAME = "C"
    self.ZIG_SHORT_NAME = "Zig"
    self.RB_SHORT_NAME = "Rb"
    self.PL_SHORT_NAME = "Pl"
    self.PAS_SHORT_NAME = "Pas"
    self.ML_SHORT_NAME = "Ml"
    self.HS_SHORT_NAME = "Hs"
    self.HX_SHORT_NAME = "Hx"
    self.ERL_SHORT_NAME = "Erl"
    self.CBL_SHORT_NAME = "Cbl"
    self.F90_SHORT_NAME = "F90"
    self.DART_SHORT_NAME = "Dart"
    self.EX_SHORT_NAME = "Ex"
    self.OBJC_SHORT_NAME = "ObjC"
    self.SWIFT_SHORT_NAME = "Swift"
    self.ASM_SHORT_NAME = "Asm"
    self.NIM_SHORT_NAME = "Nim"
    self.VALA_SHORT_NAME = "Vala"
    self.LISP_SHORT_NAME = "Lisp"
    self.RKT_SHORT_NAME = "Rkt"
    self.SCM_SHORT_NAME = "Scm"
    self.AS_SHORT_NAME = "As"
    self.OBX_SHORT_NAME = "Obx"
    self.SCALA_SHORT_NAME = "Scala"
    self.GROOVY_SHORT_NAME = "Groovy"
    self.JL_SHORT_NAME = "Jl"
    self.TCL_SHORT_NAME = "Tcl"
    self.WREN_SHORT_NAME = "Wren"
    self.JANET_SHORT_NAME = "Janet"
    self.GR_SHORT_NAME = "Gr"
    self.ELM_SHORT_NAME = "Elm"
    self.UNCRYPTED_EXTENSION = self.XML
    self.ENCRYPTED_EXTENSION = "abd"
end

function CommonDataFileStrings._jinit(self)
    CommonDataFileStrings._init_fields(self)
    return self
end

function CommonDataFileStrings.new()
    return CommonDataFileStrings._jinit(setmetatable({}, CommonDataFileStrings))
end


function CommonDataFileStrings.getInstance()
        return CommonDataFileStrings.instance_f
end

CommonDataFileStrings.instance_f = CommonDataFileStrings.new()

return CommonDataFileStrings


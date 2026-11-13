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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommonDataFileStrings = {}
CommonDataFileStrings.__index = CommonDataFileStrings
CommonDataFileStrings.className = "CommonDataFileStrings"

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
    self.CPLUSPLUS = "cplusplus"
    self.GOLANG = "golang"
    self.CSHARP_ALIAS = "csharp"
    self.C23 = "c23"
    self.PASCAL = "pascal"
    self.OBJECT_PASCAL_ALIAS = "object pascal"
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
    self.UNCRYPTED_EXTENSION = self.XML
    self.ENCRYPTED_EXTENSION = "abd"
end

function CommonDataFileStrings.new()
    local self = setmetatable({}, CommonDataFileStrings)
    self:_init_fields()
    return self
end


function CommonDataFileStrings.getInstance()
        return CommonDataFileStrings.instance
end

CommonDataFileStrings.instance = CommonDataFileStrings.new()

return CommonDataFileStrings


--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.globals

local FREEBLISKET_PATH_GLOBALS = {}
package.loaded["org.allbinary.globals.FREEBLISKET_PATH_GLOBALS"] = FREEBLISKET_PATH_GLOBALS

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

local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")

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

-- class table FREEBLISKET_PATH_GLOBALS is declared before the requires
FREEBLISKET_PATH_GLOBALS.__index = FREEBLISKET_PATH_GLOBALS
FREEBLISKET_PATH_GLOBALS.className = "FREEBLISKET_PATH_GLOBALS"
FREEBLISKET_PATH_GLOBALS.javaClassName = "org.allbinary.globals.FREEBLISKET_PATH_GLOBALS"

function FREEBLISKET_PATH_GLOBALS:_init_fields()
    if self.INSTALLPATH == nil then self.INSTALLPATH = nil end
    if self.XSLPATH == nil then self.XSLPATH = nil end
    self.TEMPLATEPATH = require("allbinary_java").to_string("template") .. require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR)
    self.STYLEPATH = require("allbinary_java").to_string(require("allbinary_java").to_string(self.TEMPLATEPATH) .. require("allbinary_java").to_string("style")) .. require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR)
    self.THEMEPATH = require("allbinary_java").to_string(require("allbinary_java").to_string(self.STYLEPATH) .. require("allbinary_java").to_string("theme")) .. require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR)
    self.DBINITPATH = require("allbinary_java").to_string(require("allbinary_java").to_string(PATH_GLOBALS.getInstance().INIT_PATH) .. require("allbinary_java").to_string("db")) .. require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR)
    self.LINEDATAPATH = require("allbinary_java").to_string(require("allbinary_java").to_string(PATH_GLOBALS.getInstance().INIT_PATH) .. require("allbinary_java").to_string("lineData")) .. require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR)
    if self.CONFIGURATIONPATH == nil then self.CONFIGURATIONPATH = nil end
    if self.USERCONFIGURATIONPATH == nil then self.USERCONFIGURATIONPATH = nil end
    if self.CONTEXTCONFIGURATIONPATH == nil then self.CONTEXTCONFIGURATIONPATH = nil end
    self.LICENSEERRORPAGE = "LicensingError.jsp"
    self.ERRORPAGE = "Error.jsp"
end


function FREEBLISKET_PATH_GLOBALS.getInstance()
        return FREEBLISKET_PATH_GLOBALS.instance_f
end


function FREEBLISKET_PATH_GLOBALS._jinit(self)
    FREEBLISKET_PATH_GLOBALS._init_fields(self)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("install")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.INSTALLPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(PATH_GLOBALS.getInstance().INIT_PATH)
        stringBuffer:append("views")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.XSLPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.XSLPATH)
        stringBuffer:append("configuration")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.CONFIGURATIONPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.CONFIGURATIONPATH)
        stringBuffer:append("user")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.USERCONFIGURATIONPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.CONFIGURATIONPATH)
        stringBuffer:append("context")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.CONTEXTCONFIGURATIONPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
    return self
end

function FREEBLISKET_PATH_GLOBALS.new(...)
    local self = setmetatable({}, FREEBLISKET_PATH_GLOBALS)
    FREEBLISKET_PATH_GLOBALS._jinit(self, ...)
    return self
end

FREEBLISKET_PATH_GLOBALS.instance_f = FREEBLISKET_PATH_GLOBALS.new()

return FREEBLISKET_PATH_GLOBALS


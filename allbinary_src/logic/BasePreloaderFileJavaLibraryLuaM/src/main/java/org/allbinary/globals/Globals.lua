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

local Globals = {}
package.loaded["org.allbinary.globals.Globals"] = Globals

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local WebappClassLoaderInfo = java_lazy("org.allbinary.logic.system.loader.WebappClassLoaderInfo")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AppUrlGlobals = java_lazy("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")

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

-- class table Globals is declared before the requires
Globals.__index = Globals
Globals.className = "Globals"
Globals.javaClassName = "org.allbinary.globals.Globals"

function Globals:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function Globals.getInstance()
        return Globals.instance_f
end


function Globals._jinit(self)
    Globals._init_fields(self)
    return self
end

function Globals.new(...)
    local self = setmetatable({}, Globals)
    Globals._jinit(self, ...)
    return self
end


function Globals:init(classLoader, pathString)
        local commonStrings = CommonStrings.getInstance()
        local appUrlGlobals = AppUrlGlobals.new()
        appUrlGlobals:setWebappPath(pathString)
        URLGLOBALS.init(appUrlGlobals)
        WebappClassLoaderInfo.setLoader(classLoader)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Setting Up AllBinary System Configuration Args: ")
        stringBuffer:append(pathString)
        stringBuffer:append(" ClassLoader: ")
        stringBuffer:append((getmetatable(classLoader).javaClassName or getmetatable(classLoader).className))
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(pathString) then
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("No Path Provided. Using Process Path: ")
            stringBuffer:append(pathString)
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            stringBuffer:append(CommonSeps.getInstance().EQUALS)
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            stringBuffer:append(URLGLOBALS.getWebappPath())
            self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
        end
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append("Webapp Path Set To: ")
        stringBuffer:append(URLGLOBALS.getWebappPath())
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
end

Globals.instance_f = Globals.new()

return Globals


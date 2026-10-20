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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local WebappClassLoaderInfo = require("org.allbinary.logic.system.loader.WebappClassLoaderInfo")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Globals = {}
Globals.__index = Globals
Globals.className = "Globals"

function Globals:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function Globals.getInstance()
        return Globals.instance
end


function Globals.new()
    local self = setmetatable({}, Globals)
    self:_init_fields()
    return self
end


function Globals:init(classLoader, pathString)
        local commonStrings = CommonStrings.getInstance()
        local appUrlGlobals = AppUrlGlobals.new()
        appUrlGlobals:setWebappPath(pathString)
        self.URLGLOBALS:init(appUrlGlobals)
        WebappClassLoaderInfo.setLoader(classLoader)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Setting Up AllBinary System Configuration Args: ")
        stringBuffer:append(pathString)
        stringBuffer:append(" ClassLoader: ")
        stringBuffer:append(getmetatable(classLoader).className)
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(pathString) then
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("No Path Provided. Using Process Path: ")
            stringBuffer:append(pathString)
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            stringBuffer:append(CommonSeps.getInstance().EQUALS)
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
        end
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append("Webapp Path Set To: ")
        stringBuffer:append(self.URLGLOBALS:getWebappPath())
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
end

Globals.instance = Globals.new()

return Globals


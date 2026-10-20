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
-- package org.allbinary.logic.system.loader

-- local Constructor = require("java.lang.reflect.Constructor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ConstructorUtil = require("org.allbinary.logic.java.anyType.ConstructorUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbKeys = require("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeFactory = {}
AbeFactory.__index = AbeFactory
AbeFactory.className = "AbeFactory"

function AbeFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.useCustomLoader = false
end


function AbeFactory.getInstance()
        return AbeFactory.instance
end


function AbeFactory.new()
    local self = setmetatable({}, AbeFactory)
    self:_init_fields()
    return self
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function AbeFactory:getInstance(abeClientInformation, className)
        local try_ok, try_error = pcall(function()
            return self:getClass(abeClientInformation, className):newInstance()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADERERROR) then
                self.logUtil:put("Failure for: " .. className, self, "getInstance(classname)", e)
            end
            error(e, 0)
        end
end


-- throws LicensingException
-- Java overloaded method: Lua keeps the last definition
function AbeFactory:getInstance(abeClientInformation, className, classes, params)
        local constructor = nil
        local try_ok, try_error = pcall(function()
            local parent = WebappClassLoaderInfo.getLoader()
            if self.useCustomLoader then
                local loader = AbeClassLoader.new(parent, AbKeys.getInstance():getKey(abeClientInformation, className))
                local myClass = loader:loadClass(className)
                constructor = myClass:getConstructor(classes)
                return constructor:newInstance(params)
            else
                local myClass = parent:loadClass(className)
                constructor = myClass:getConstructor(classes)
                return constructor:newInstance(params)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADERERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Failure for: ")
                stringBuffer:append(className)
                stringBuffer:append(CommonSeps.getInstance().SPACE)
                stringBuffer:append(ConstructorUtil.view(constructor, CommonSeps.getInstance().NEW_LINE))
                self.logUtil:put(tostring(stringBuffer), self, "getInstance(className,params)", e)
            end
            error(e, 0)
        end
end


-- throws LicensingException
function AbeFactory:getClass(abeClientInformation, className)
        local try_ok, try_error = pcall(function()
            local parent = WebappClassLoaderInfo.getLoader()
            if self.useCustomLoader then
                local loader = AbeClassLoader.new(parent, AbKeys.getInstance():getKey(abeClientInformation, className))
                local c = loader:loadClass(className)
                return c
            else
                local c = parent:loadClass(className)
                return c
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADERERROR) then
                self.logUtil:put("Failure for: " .. className, self, "getClass(className)", e)
            end
            error(e, 0)
        end
end

AbeFactory.instance = AbeFactory.new()

return AbeFactory


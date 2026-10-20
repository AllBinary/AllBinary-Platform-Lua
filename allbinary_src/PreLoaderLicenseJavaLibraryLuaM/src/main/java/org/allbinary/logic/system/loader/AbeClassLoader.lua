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

-- local FileInputStream = require("java.io.FileInputStream")
-- local IOException = require("java.io.IOException")
-- local Map = require("java.util.Map")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogBuffer = require("org.allbinary.logic.communication.log.LogBuffer")
local LogFactory = require("org.allbinary.logic.communication.log.LogFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbCryptUtil = require("org.allbinary.logic.system.security.AbCryptUtil")
-- java.lang.ClassLoader has no Lua module
local ClassLoader = {}
ClassLoader.__index = ClassLoader
ClassLoader.className = "ClassLoader"
function ClassLoader.new() return setmetatable({}, ClassLoader) end

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeClassLoader = {}
AbeClassLoader.__index = AbeClassLoader
AbeClassLoader.className = "AbeClassLoader"
setmetatable(AbeClassLoader, {__index = ClassLoader})

function AbeClassLoader:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abCryptUtil = AbCryptUtil.getInstance()
    self.LOAD_CLASS = "loadClass"
    self.ENCRYPTED_EXTENSION = tostring(AbPathData.getInstance().EXTENSION_SEP) .. "abc"
    self.key = nil
end


function AbeClassLoader.new(parent, key)
    local self = setmetatable(ClassLoader.new(parent), AbeClassLoader)
    self:_init_fields()
        -- super(...) made self above
        self.key = key
        AbeClassLoader.PATH = tostring(org.allbinary.globals.URLGLOBALS:getWebappPath()) .. "WEB-INF/classes/"
    return self
end


function AbeClassLoader:findLoadedClass1(name)
        return AbeClassLoader.classes:get(name)
end


-- throws ClassNotFoundException
function AbeClassLoader:loadClass(name)
        return self:loadClass(name, false)
end


-- throws ClassNotFoundException
-- Java overloaded method: Lua keeps the last definition
function AbeClassLoader:loadClass(name, resolve)
        local loadedWith = "findLoadedClass1"
        local logBuffer = LogBuffer.new()
        local try_ok, try_error = pcall(function()
            local myClass = self:findLoadedClass1(name)
            if myClass == nil then
                local try_ok, try_error = pcall(function()
                    loadedWith = "super.loadClass"
                    local normalClass = ClassLoader.loadClass(self, name, resolve)
                    if normalClass ~= nil then
                        return normalClass
                    end
                end)
                if not try_ok then
                    local e = try_error
                    logBuffer:add(LogFactory.getInstance("Failed to Load Class: " .. name .. "\nwith: " .. loadedWith, self, self.LOAD_CLASS, e))
                end
                local classBytes = self:loadClassBytesFromFile(name)
                if classBytes == nil then
                    error(java_exception("ClassNotFoundException", "My Bytes not loaded for: " .. name .. "\nwith: " .. "loadClassBytes"), 0)
                end
                myClass = self:defineClass(name, classBytes, 0, (classBytes.n or #classBytes))
                if myClass == nil then
                    error(java_exception("ClassNotFoundException", "My Class Not Defineable for: " .. name .. "\nwith: " .. "loadClassBytes"), 0)
                end
                AbeClassLoader.classes:put(name, myClass)
            else
                logBuffer:add(LogFactory.getInstanceF("Already Loaded: " .. name .. "\nwith: " .. loadedWith, self, self.LOAD_CLASS))
            end
            self:resolveClass(myClass)
            return myClass
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADERERROR) then
                logBuffer:logAll()
                self.logUtil:put("Failure loading: " .. name .. "\nwith: " .. loadedWith, self, self.LOAD_CLASS, e)
            end
            return nil
        end
end


function AbeClassLoader:loadClassBytesFromFile(name)
        local in_ = nil
        local cname = StringUtil.getInstance().EMPTY_STRING
        local try_ok, try_error = pcall(function()
            cname = tostring(AbeClassLoader.PATH) .. name:replace(".", AbPathData.getInstance().SEPARATORCHAR) .. self.ENCRYPTED_EXTENSION
            in_ = FileInputStream.new(cname)
            local decrypted = self.abCryptUtil:decrypt(in_, self.key)
            return decrypted
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADERERROR) then
                self.logUtil:put("(Before LogBuffer Output) Failure loading Encrypted: " .. name .. " File: " .. cname, "AbeClassLoader", "loadClassBytes", e)
            end
            StreamUtil.getInstance():close(in_)
        end
        return nil
end


-- throws ClassNotFoundException
function AbeClassLoader:oldLoadClass(name, resolve)
        local loadedWith = "findLoadedClass1"
        local try_ok, try_error = pcall(function()
            local myClass = self:findLoadedClass1(name)
            if myClass == nil then
                local try_ok, try_error = pcall(function()
                    loadedWith = "super.loadClass"
                    local normalClass = ClassLoader.loadClass(self, name, resolve)
                    if normalClass ~= nil then
                        return normalClass
                    end
                end)
                if not try_ok then
                    local e = try_error
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADER) then
                        self.logUtil:putF("Failed Loaded Class: " .. name .. " with: " .. loadedWith, self, self.LOAD_CLASS)
                    end
                end
                loadedWith = "loadClassBytes"
                local classBytes = self:loadClassBytesFromFile(name)
                if classBytes == nil then
                    error(java_exception("ClassNotFoundException", "Bytes not loaded for: " .. name), 0)
                end
                myClass = self:defineClass(name, classBytes, 0, (classBytes.n or #classBytes))
                if myClass == nil then
                    error(java_exception("ClassNotFoundException", "Class Not Defineable for: " .. name), 0)
                end
                AbeClassLoader.classes:put(name, myClass)
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADER) then
                    self.logUtil:putF("Already Loaded: " .. name .. " with: " .. loadedWith, self, self.LOAD_CLASS)
                end
            end
            self:resolveClass(myClass)
            return myClass
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LOADERERROR) then
                self.logUtil:put("Failure loading: " .. name, "AbeClassLoader", self.LOAD_CLASS, e)
            end
            return nil
        end
end

AbeClassLoader.classes = StdUtil.getInstance():createHashMap()
AbeClassLoader.PATH = nil

return AbeClassLoader


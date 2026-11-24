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
-- package org.allbinary.bundle.logic.preloader

local AllBinaryPreloaderActivator = {}
package.loaded["org.allbinary.bundle.logic.preloader.AllBinaryPreloaderActivator"] = AllBinaryPreloaderActivator

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

local BundleActivator = java_lazy("org.osgi.framework.BundleActivator")
local BundleContext = java_lazy("org.osgi.framework.BundleContext")
local ServiceReference = java_lazy("org.osgi.framework.ServiceReference")
local ServiceRegistration = java_lazy("org.osgi.framework.ServiceRegistration")
local CryptServiceFactory = java_lazy("org.allbinary.bundle.logic.system.loader.CryptServiceFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AllBinaryPreloaderActivator is declared before the requires
AllBinaryPreloaderActivator.__index = AllBinaryPreloaderActivator
AllBinaryPreloaderActivator.className = "AllBinaryPreloaderActivator"
AllBinaryPreloaderActivator.javaClassName = "org.allbinary.bundle.logic.preloader.AllBinaryPreloaderActivator"
AllBinaryPreloaderActivator.java_implements = " BundleActivator "
AllBinaryPreloaderActivator.java_interfaces = function() return {BundleActivator} end

function AllBinaryPreloaderActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function AllBinaryPreloaderActivator._jinit(self)
    AllBinaryPreloaderActivator._init_fields(self)
    return self
end

function AllBinaryPreloaderActivator.new(...)
    local self = setmetatable({}, AllBinaryPreloaderActivator)
    AllBinaryPreloaderActivator._jinit(self, ...)
    return self
end


function AllBinaryPreloaderActivator.getBundleContext()
        return AllBinaryPreloaderActivator.context
end


-- throws Exception
function AllBinaryPreloaderActivator:start(context)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "start")
            AllBinaryPreloaderActivator.context = context
            self:registerAsService()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "start", e)
            error(e, 0)
        end
end


-- throws Exception
function AllBinaryPreloaderActivator:registerAsService()
        local properties = StdUtil.getInstance():createHashtable()
        local serviceRegistration = AllBinaryPreloaderActivator.context:registerService(AllBinaryPreloaderActivator.CRYPT_REGISTRY_NAME, CryptServiceFactory.new(), properties)
        local serviceReference = serviceRegistration:getReference()
        serviceReference = AllBinaryPreloaderActivator.context:getServiceReference(AllBinaryPreloaderActivator.CRYPT_REGISTRY_NAME)
        if serviceReference == nil then
            error(require("java.lang.Exception").new("No Such Service Reference"), 0)
        end
end


-- throws Exception
function AllBinaryPreloaderActivator:stop(context)
        self.logUtil:putF(self.commonStrings.START, self, "stop")
end

AllBinaryPreloaderActivator.context = nil
AllBinaryPreloaderActivator.CRYPT_REGISTRY_NAME = "bundle.abcs.logic.system.loader.CryptService"

return AllBinaryPreloaderActivator


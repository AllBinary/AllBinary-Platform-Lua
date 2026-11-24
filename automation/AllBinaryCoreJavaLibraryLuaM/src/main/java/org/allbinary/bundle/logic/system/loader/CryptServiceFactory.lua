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
-- package org.allbinary.bundle.logic.system.loader

local CryptServiceFactory = {}
package.loaded["org.allbinary.bundle.logic.system.loader.CryptServiceFactory"] = CryptServiceFactory

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

local Bundle = java_lazy("org.osgi.framework.Bundle")
local ServiceFactory = java_lazy("org.osgi.framework.ServiceFactory")
local ServiceRegistration = java_lazy("org.osgi.framework.ServiceRegistration")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local CryptService = java_lazy("org.allbinary.bundle.logic.system.loader.CryptService")

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

-- class table CryptServiceFactory is declared before the requires
CryptServiceFactory.__index = CryptServiceFactory
CryptServiceFactory.className = "CryptServiceFactory"
CryptServiceFactory.javaClassName = "org.allbinary.bundle.logic.system.loader.CryptServiceFactory"
CryptServiceFactory.java_implements = " ServiceFactory "
CryptServiceFactory.java_interfaces = function() return {ServiceFactory} end

function CryptServiceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.cryptService = CryptService.new()
end


function CryptServiceFactory._jinit(self)
    CryptServiceFactory._init_fields(self)
    return self
end

function CryptServiceFactory.new(...)
    local self = setmetatable({}, CryptServiceFactory)
    CryptServiceFactory._jinit(self, ...)
    return self
end


function CryptServiceFactory:getService(bundle, registration)
        self.logUtil:putF(self.commonStrings.START, self, "getService")
        return self.cryptService
end


function CryptServiceFactory:ungetService(bundle, registration, service)
end

return CryptServiceFactory


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
-- package org.allbinary.logic.java.proxy

-- local Method = require("java.lang.reflect.Method")
-- local Proxy = require("java.lang.reflect.Proxy")
local InvocationHandler = require("org.allbinary.logic.java.proxy.InvocationHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InterfaceCastProxy = {}
InterfaceCastProxy.__index = InterfaceCastProxy
InterfaceCastProxy.className = "InterfaceCastProxy"

function InterfaceCastProxy:_init_fields()
    self.anyType = nil
end


function InterfaceCastProxy.new(anyType)
    local self = setmetatable({}, InterfaceCastProxy)
    self:_init_fields()
        self.anyType = anyType
    return self
end


function InterfaceCastProxy.newInstance(anyType)
        return Proxy.newProxyInstance(getmetatable(anyType):getClassLoader(), getmetatable(anyType):getInterfaces(), InterfaceCastProxy.new(anyType))
end


-- throws Throwable
function InterfaceCastProxy:invoke(proxyObject, proxyMethod, proxyArgs)
        local methodName = proxyMethod:getName()
        local realMethod = getmetatable(self.anyType):getMethod(methodName, proxyMethod:getParameterTypes())
        if not realMethod:isAccessible() then
            realMethod:setAccessible(true)
        end
        return proxyMethod:invoke(self.anyType, proxyArgs)
end

return InterfaceCastProxy


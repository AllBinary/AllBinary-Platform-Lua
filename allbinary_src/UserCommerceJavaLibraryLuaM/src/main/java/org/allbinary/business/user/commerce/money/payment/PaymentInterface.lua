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
-- package org.allbinary.business.user.commerce.money.payment

local PaymentInterface = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.PaymentInterface"] = PaymentInterface

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

-- Java interface
-- class table PaymentInterface is declared before the requires
PaymentInterface.__index = PaymentInterface
PaymentInterface.className = "PaymentInterface"
PaymentInterface.javaClassName = "org.allbinary.business.user.commerce.money.payment.PaymentInterface"


function PaymentInterface:setName(value)
    error("abstract method setName")
end


function PaymentInterface:setType(value)
    error("abstract method setType")
end


function PaymentInterface:setExpiration(value)
    error("abstract method setExpiration")
end


function PaymentInterface:setNumber(value)
    error("abstract method setNumber")
end


function PaymentInterface:getId()
    error("abstract method getId")
end


function PaymentInterface:getName()
    error("abstract method getName")
end


function PaymentInterface:getType()
    error("abstract method getType")
end


function PaymentInterface:getExpiration()
    error("abstract method getExpiration")
end


function PaymentInterface:getEncryption()
    error("abstract method getEncryption")
end


function PaymentInterface:getNumber()
    error("abstract method getNumber")
end


function PaymentInterface:getLastFour()
    error("abstract method getLastFour")
end


function PaymentInterface:isDefault()
    error("abstract method isDefault")
end

return PaymentInterface


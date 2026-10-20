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
-- package org.allbinary.data.tables.user.commerce.money.payment

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PaymentInterface = require("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local PaymentEntityInterface = {}
PaymentEntityInterface.__index = PaymentEntityInterface
PaymentEntityInterface.className = "PaymentEntityInterface"
setmetatable(PaymentEntityInterface, {__index = BasicDataTableInterface})


function PaymentEntityInterface:getLastId(userName)
    error("abstract method getLastId")
end


function PaymentEntityInterface:setDefault(userName, index)
    error("abstract method setDefault")
end


function PaymentEntityInterface:getDefault(userName)
    error("abstract method getDefault")
end


function PaymentEntityInterface:get(userName)
    error("abstract method get")
end


function PaymentEntityInterface:add(userName, paymentInterface)
    error("abstract method add")
end


function PaymentEntityInterface:remove(userName, index)
    error("abstract method remove")
end


function PaymentEntityInterface:insert(values)
    error("abstract method insert")
end

return PaymentEntityInterface


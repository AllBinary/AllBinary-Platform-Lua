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
-- package org.allbinary.data.tables.user.commerce.money.payment.transaction

local TransactionResultInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface")
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
local TransactionResultEntityInterface = {}
TransactionResultEntityInterface.__index = TransactionResultEntityInterface
TransactionResultEntityInterface.className = "TransactionResultEntityInterface"
setmetatable(TransactionResultEntityInterface, {__index = BasicDataTableInterface})


function TransactionResultEntityInterface:getTransactionResultInterface(orderNumber)
    error("abstract method getTransactionResultInterface")
end


function TransactionResultEntityInterface:remove(userName, orderNumber)
    error("abstract method remove")
end


function TransactionResultEntityInterface:add(userName, orderNumber, resultInterface)
    error("abstract method add")
end

return TransactionResultEntityInterface


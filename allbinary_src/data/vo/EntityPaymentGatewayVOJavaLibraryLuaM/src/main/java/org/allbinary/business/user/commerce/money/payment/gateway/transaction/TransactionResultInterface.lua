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
-- package org.allbinary.business.user.commerce.money.payment.gateway.transaction

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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
local TransactionResultInterface = {}
TransactionResultInterface.__index = TransactionResultInterface
TransactionResultInterface.className = "TransactionResultInterface"


function TransactionResultInterface:toString()
    error("abstract method toString")
end
TransactionResultInterface.__tostring = function(self) return self:toString() end


function TransactionResultInterface:getValues()
    error("abstract method getValues")
end


function TransactionResultInterface:getResult()
    error("abstract method getResult")
end


function TransactionResultInterface:getPnRef()
    error("abstract method getPnRef")
end


function TransactionResultInterface:getRespMsg()
    error("abstract method getRespMsg")
end


function TransactionResultInterface:getAvsAddr()
    error("abstract method getAvsAddr")
end


function TransactionResultInterface:getAvsZip()
    error("abstract method getAvsZip")
end


function TransactionResultInterface:getOrigResult()
    error("abstract method getOrigResult")
end


function TransactionResultInterface:getStatus()
    error("abstract method getStatus")
end


function TransactionResultInterface:getFraudCode()
    error("abstract method getFraudCode")
end


function TransactionResultInterface:getFraudMsg()
    error("abstract method getFraudMsg")
end


function TransactionResultInterface:getErrCode()
    error("abstract method getErrCode")
end


function TransactionResultInterface:getScore()
    error("abstract method getScore")
end


function TransactionResultInterface:getReason1()
    error("abstract method getReason1")
end


function TransactionResultInterface:getReason2()
    error("abstract method getReason2")
end


function TransactionResultInterface:getReason3()
    error("abstract method getReason3")
end


function TransactionResultInterface:getException1()
    error("abstract method getException1")
end


function TransactionResultInterface:getException2()
    error("abstract method getException2")
end


function TransactionResultInterface:getException3()
    error("abstract method getException3")
end


function TransactionResultInterface:getException4()
    error("abstract method getException4")
end


function TransactionResultInterface:getException5()
    error("abstract method getException5")
end


function TransactionResultInterface:getException6()
    error("abstract method getException6")
end


function TransactionResultInterface:getException7()
    error("abstract method getException7")
end

return TransactionResultInterface


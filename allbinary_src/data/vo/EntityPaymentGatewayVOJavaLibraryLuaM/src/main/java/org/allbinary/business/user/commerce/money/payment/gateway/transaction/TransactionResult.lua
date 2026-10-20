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

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Tokenizer = require("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TransactionResultInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransactionResult = {}
TransactionResult.__index = TransactionResult
TransactionResult.className = "TransactionResult"

function TransactionResult:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.keyValuePairs = nil
    self.result = nil
end

function TransactionResult.new(...)
    local count = select("#", ...)
    if count == 1 then return TransactionResult._new1(...)
    elseif count == 1 then return TransactionResult._new1(...)
    end
end


function TransactionResult._new1(result)
    local self = setmetatable({}, TransactionResult)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.result = result
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().AMPERSAND)
            local tokens = tokenizer:getTokensFromString(result, BasicArrayListD.new())
            local tokenizer2 = Tokenizer.new(CommonSeps.getInstance().EQUALS)
            local hashtable = tokenizer2:getTokens(tokens)
            self.keyValuePairs:putAll(hashtable)
        end)
        if not try_ok then
            local e = try_error
            local exceptionMessage = "TransactionResult Constructor Failed"
            self.logUtil:putF(exceptionMessage, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TransactionResult._new1(keyValuePairs)
    local self = setmetatable({}, TransactionResult)
    self:_init_fields()
        keyValuePairs = keyValuePairs
        self.result = "Needs to have the hashmap converted to string for other constructor"
    return self
end


function TransactionResult:toString()
        return self.result
end
TransactionResult.__tostring = function(self) return self:toString() end


function TransactionResult:toHashMap()
        return self.keyValuePairs
end


function TransactionResult:getAllPossibleKeys()
        local paymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance()
        local verisignResponseKeys = BasicArrayListD.new()
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.RESULT))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.PNREF))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.RESPMSG))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.AUTHCODE))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.AVSADDR))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.AVSZIP))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.ORIGRESULT))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.STATUS))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.FRAUDCODE))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.FRAUDMSG))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.ERRCODE))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.SCORE))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.REASON1))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.REASON2))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.REASON3))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION1))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION2))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION3))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION4))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION5))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION6))
        verisignResponseKeys:add(tostring(paymentTransactionKeysFactory.EXCEPTION7))
        return verisignResponseKeys
end


function TransactionResult:getValues()
        local keyVector = self:getAllPossibleKeys()
        local valueVector = BasicArrayListD.new()
        local size = keyVector:size()
        for i = 0, size - 1 do
            local key = keyVector:get(i)
            if self.keyValuePairs:containsKey(key) then
                valueVector:add(self.keyValuePairs:get(key))
            else
                local stringUtil = StringUtil.getInstance()
                valueVector:add(stringUtil.EMPTY_STRING)
            end
        end
        return valueVector
end


function TransactionResult:getPnRef()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().PNREF))
end


function TransactionResult:getRespMsg()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().RESPMSG))
end


function TransactionResult:getResult()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().RESULT))
end


function TransactionResult:getScore()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().SCORE))
end


function TransactionResult:getStatus()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().STATUS))
end


function TransactionResult:getFraudCode()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().FRAUDCODE))
end


function TransactionResult:getFraudMsg()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().FRAUDMSG))
end


function TransactionResult:getOrigResult()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().ORIGRESULT))
end


function TransactionResult:getAvsAddr()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().AVSADDR))
end


function TransactionResult:getAvsZip()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().AVSZIP))
end


function TransactionResult:getErrCode()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().ERRCODE))
end


function TransactionResult:getException1()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION1))
end


function TransactionResult:getException2()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION2))
end


function TransactionResult:getException3()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION3))
end


function TransactionResult:getException4()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION4))
end


function TransactionResult:getException5()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION5))
end


function TransactionResult:getException6()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION6))
end


function TransactionResult:getException7()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().EXCEPTION7))
end


function TransactionResult:getReason1()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().REASON1))
end


function TransactionResult:getReason2()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().REASON2))
end


function TransactionResult:getReason3()
        return self.keyValuePairs:get(tostring(PaymentTransactionKeysFactory.getInstance().REASON3))
end

return TransactionResult


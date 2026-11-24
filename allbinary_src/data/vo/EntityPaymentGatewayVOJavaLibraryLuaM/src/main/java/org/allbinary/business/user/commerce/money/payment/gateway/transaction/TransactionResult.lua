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

local TransactionResult = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResult"] = TransactionResult

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

local HashMap = java_lazy("java.util.HashMap")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Tokenizer = java_lazy("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TransactionResultInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface")
local PaymentTransactionKeysFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table TransactionResult is declared before the requires
TransactionResult.__index = TransactionResult
TransactionResult.className = "TransactionResult"
TransactionResult.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResult"
TransactionResult.java_implements = " TransactionResultInterface "
TransactionResult.java_interfaces = function() return {TransactionResultInterface} end

function TransactionResult:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.keyValuePairs == nil then self.keyValuePairs = nil end
    if self.result == nil then self.result = nil end
end

function TransactionResult._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return TransactionResult._new1(self, ...)
    end
    error("No constructor of TransactionResult takes " .. count .. " arguments")
end

function TransactionResult.new(...)
    local self = setmetatable({}, TransactionResult)
    TransactionResult._jinit(self, ...)
    return self
end

function TransactionResult._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") then return TransactionResult._new1_1(self, ...) end
    return TransactionResult._new1_2(self, ...)
end


function TransactionResult._new1_1(self, result)
    TransactionResult._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.result = result
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().AMPERSAND)
            local tokens = tokenizer:getTokensFromString(result, BasicArrayListD.new())
            local tokenizer2 = Tokenizer.new(CommonSeps.getInstance().EQUALS)
            local hashtable = tokenizer2:getTokens(tokens)
            self.keyValuePairs:putAll(hashtable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local exceptionMessage = "TransactionResult Constructor Failed"
            self.logUtil:putF(exceptionMessage, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TransactionResult._new1_2(self, keyValuePairs)
    TransactionResult._init_fields(self)
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


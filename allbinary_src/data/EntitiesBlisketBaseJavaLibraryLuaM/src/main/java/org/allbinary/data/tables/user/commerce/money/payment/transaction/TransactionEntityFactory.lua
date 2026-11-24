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

local TransactionEntityFactory = {}
package.loaded["org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityFactory"] = TransactionEntityFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransactionEntity = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntity")

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

-- class table TransactionEntityFactory is declared before the requires
TransactionEntityFactory.__index = TransactionEntityFactory
TransactionEntityFactory.className = "TransactionEntityFactory"
TransactionEntityFactory.javaClassName = "org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityFactory"

function TransactionEntityFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransactionEntityFactory.getInstance()
        return TransactionEntityFactory.instance_f
end


function TransactionEntityFactory._jinit(self)
    TransactionEntityFactory._init_fields(self)
    return self
end

function TransactionEntityFactory.new(...)
    local self = setmetatable({}, TransactionEntityFactory)
    TransactionEntityFactory._jinit(self, ...)
    return self
end


function TransactionEntityFactory:getTransactionEntityInstance()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", TransactionEntity.new() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

TransactionEntityFactory.instance_f = TransactionEntityFactory.new()

return TransactionEntityFactory


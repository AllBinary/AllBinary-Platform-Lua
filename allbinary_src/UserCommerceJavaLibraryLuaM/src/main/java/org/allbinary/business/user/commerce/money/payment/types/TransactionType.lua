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
-- package org.allbinary.business.user.commerce.money.payment.types


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransactionType = {}
TransactionType.__index = TransactionType
TransactionType.className = "TransactionType"

function TransactionType:_init_fields()
    self.name = nil
end


function TransactionType.new(name)
    local self = setmetatable({}, TransactionType)
    self:_init_fields()
        self.name = name
    return self
end


function TransactionType:isEqual(transactionType)
        if ((tostring(self) < tostring(transactionType) and -1) or (tostring(self) > tostring(transactionType) and 1) or 0) == 0 then
            return true
        else
            return false
        end
end


function TransactionType:toString()
        return self.name
end
TransactionType.__tostring = function(self) return self:toString() end

return TransactionType


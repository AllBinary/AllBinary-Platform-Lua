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
-- package org.allbinary.business.user.commerce.money

local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Money = {}
Money.__index = Money
Money.className = "Money"

function Money:_init_fields()
    self.units = nil
    self.DEFAULT_CURRENCY = "USD"
end

function Money.new(...)
    local count = select("#", ...)
    if count == 1 then return Money._new1(...)
    elseif count == 0 then return Money._new0(...)
    elseif count == 1 then return Money._new1(...)
    elseif count == 1 then return Money._new1(...)
    end
end


function Money._new1(money)
    local self = setmetatable({}, Money)
    self:_init_fields()
        self.units = money:getUnits()
    return self
end


function Money._new0()
    local self = setmetatable({}, Money)
    self:_init_fields()
        self.units = 0
    return self
end


function Money._new1(usDollarStr)
    local self = setmetatable({}, Money)
    self:_init_fields()
        if usDollarStr ~= nil and StringValidationUtil.getInstance():isNumber(usDollarStr) then
            self.units = self:convertUsdToUnits(usDollarStr)
        end
    return self
end


function Money._new1(units)
    local self = setmetatable({}, Money)
    self:_init_fields()
        self.units = units
    return self
end


function Money:isValid()
        if self.units ~= nil and math.tointeger(self.units // 1) > 0 and math.tointeger(self.units // 1) < Long.MAX_VALUE then
            return true
        else
            return false
        end
end


function Money:add(moreMoney)
        self:add(tostring(moreMoney))
end


-- Java overloaded method: Lua keeps the last definition
function Money:add(usDollarStr)
        self.units = math.tointeger(self.units // 1) + self:convertUsdToUnits(usDollarStr)
end


function Money:subtract(usDollarStr)
        self.units = math.tointeger(self.units // 1) - self:convertUsdToUnits(usDollarStr)
end


function Money:multiply(multiplier)
        self.units = math.tointeger(math.tointeger(self.units // 1) * (multiplier + 0.0) // 1)
end


-- Java overloaded method: Lua keeps the last definition
function Money:multiply(multiplier)
        self.units = math.tointeger(self.units // 1) * multiplier
end


function Money:convertUnitsTo(currency)
        local stringBuffer = StringMaker.new()
        if ((currency < self.DEFAULT_CURRENCY and -1) or (currency > self.DEFAULT_CURRENCY and 1) or 0) == 0 then
            local dollar = math.tointeger(self.units // 1) / 100
            local cents = math.tointeger(self.units // 1) - (dollar * 100)
            stringBuffer:append(tostring(dollar))
            stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
            if cents < 10 then
                stringBuffer:append(CommonPhoneStrings.getInstance().ZERO)
            end
            stringBuffer:append(tostring(cents))
        end
        return tostring(stringBuffer)
end


function Money:convertUsdToUnits(usDollarStr)
        local localUnit = 0
        local index = ((string.find(usDollarStr, AbPathData.getInstance().EXTENSION_SEP, 1, true) or 0) - 1)
        local stringUtil = StringUtil.getInstance()
        local dollarStr = stringUtil.EMPTY_STRING
        local centsStr = stringUtil.EMPTY_STRING
        if index < 1 then
            dollarStr = tostring(usDollarStr)
            centsStr = "00"
        else
            dollarStr = tostring(string.sub(usDollarStr, (0) + 1, index))
            centsStr = tostring(string.sub(usDollarStr, (index + 1) + 1))
        end
        localUnit = math.tointeger(math.tointeger(dollarStr // 1) * 100 // 1)
        localUnit = localUnit + (math.tointeger(centsStr // 1))
        return localUnit
end


function Money:getUnits()
        return math.tointeger(self.units // 1)
end


function Money:getUnitsLong()
        return self.units
end


function Money:toString()
        return tostring(self:convertUnitsTo(self.DEFAULT_CURRENCY))
end
Money.__tostring = function(self) return self:toString() end

return Money


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
-- package org.allbinary.logic.math

local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PrimitiveLongUtil = {}
PrimitiveLongUtil.__index = PrimitiveLongUtil
PrimitiveLongUtil.className = "PrimitiveLongUtil"

function PrimitiveLongUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.powerOfTen = nil
    self.maxValue = nil
    self.maxDigits = nil
    self.charArray = nil
    self.currentTotalDigits = 0
    self.primitiveLongSingleton = PrimitiveLongSingleton.getInstance()
end


function PrimitiveLongUtil.createPowerOfTen(powerOfTen)
        local primitiveLongUtil = PrimitiveLongUtil.new(powerOfTen, NullUtil.getInstance().NULL_OBJECT)
        if math.fmod(powerOfTen, 10) ~= 0 then
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, primitiveLongUtil, commonStrings.CONSTRUCTOR, java_exception("Exception", "Max must be power of 10"))
        end
        return primitiveLongUtil
end


function PrimitiveLongUtil.new(powerOfTen, unused)
    local self = setmetatable({}, PrimitiveLongUtil)
    self:_init_fields()
        self.maxDigits = MathUtil.getInstance():getTotalDigits(powerOfTen)
        self.powerOfTen = powerOfTen
        self.maxValue = (powerOfTen * 10) - 1
        self.charArray = java_new_array("\0", self.maxDigits)
    return self
end


function PrimitiveLongUtil:getCharArray(value)
        if value < 10 then
            self:setCurrentTotalDigits(1)
            return self.primitiveLongSingleton.NUMBER_CHAR_ARRAYS[value + 1]
        end
        if value > self.maxValue then
            self:setCurrentTotalDigits(3)
            return self.primitiveLongSingleton.UNK
        end
        local index = 0
        local div = self.powerOfTen
        local lastValue = 0
        while div >= 1 do
            local digit = java_idiv((value - lastValue), div)
            if digit >= 0 and digit < 10 then
                if digit == 0 and index == 0 then
                else
                    self.charArray[(function() local value = index index = value + 1 return value end)() + 1] = self.primitiveLongSingleton.NUMBER_CHAR_ARRAY[digit + 1]
                end
                lastValue = lastValue + (digit * div)
            end
            div = java_idiv(div, 10)
        end
        self:setCurrentTotalDigits(index)
        return self.charArray
end


function PrimitiveLongUtil:setCurrentTotalDigits(currentTotalDigits)
        self.currentTotalDigits = currentTotalDigits
end


function PrimitiveLongUtil:getCurrentTotalDigits()
        return self.currentTotalDigits
end


function PrimitiveLongUtil:getMaxDigits()
        return self.maxDigits
end

return PrimitiveLongUtil


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

local PrimitiveLongUtil = {}
package.loaded["org.allbinary.logic.math.PrimitiveLongUtil"] = PrimitiveLongUtil

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local PrimitiveLongSingleton = java_lazy("org.allbinary.logic.math.PrimitiveLongSingleton")

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

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table PrimitiveLongUtil is declared before the requires
PrimitiveLongUtil.__index = PrimitiveLongUtil
PrimitiveLongUtil.className = "PrimitiveLongUtil"
PrimitiveLongUtil.javaClassName = "org.allbinary.logic.math.PrimitiveLongUtil"

function PrimitiveLongUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.powerOfTen == nil then self.powerOfTen = 0 end
    if self.maxValue == nil then self.maxValue = 0 end
    if self.maxDigits == nil then self.maxDigits = 0 end
    if self.charArray == nil then self.charArray = nil end
    if self.currentTotalDigits == nil then self.currentTotalDigits = 0 end
    self.primitiveLongSingleton = PrimitiveLongSingleton.getInstance()
end


function PrimitiveLongUtil.createPowerOfTen(powerOfTen)
        local primitiveLongUtil = PrimitiveLongUtil.new(powerOfTen, NullUtil.getInstance().NULL_OBJECT)
        if not rawequal(math.fmod(powerOfTen, 10), 0) then
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, primitiveLongUtil, commonStrings.CONSTRUCTOR, require("java.lang.Exception").new("Max must be power of 10"))
        end
        return primitiveLongUtil
end


function PrimitiveLongUtil._jinit(self, powerOfTen, unused)
    PrimitiveLongUtil._init_fields(self)
        self.maxDigits = MathUtil.getInstance():getTotalDigits(powerOfTen)
        self.powerOfTen = powerOfTen
        self.maxValue = (powerOfTen * 10) - 1
        self.charArray = java_new_array("\0", self.maxDigits)
    return self
end

function PrimitiveLongUtil.new(...)
    local self = setmetatable({}, PrimitiveLongUtil)
    PrimitiveLongUtil._jinit(self, ...)
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
                if rawequal(digit, 0) and rawequal(index, 0) then
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


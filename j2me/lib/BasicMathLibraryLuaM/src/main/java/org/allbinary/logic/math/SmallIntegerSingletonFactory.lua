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

local AndroidUtil = require("org.allbinary.AndroidUtil")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

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

local SmallIntegerSingletonFactory = {}
SmallIntegerSingletonFactory.__index = SmallIntegerSingletonFactory
SmallIntegerSingletonFactory.className = "SmallIntegerSingletonFactory"

function SmallIntegerSingletonFactory:_init_fields()
    self.NEGATIVE_MAX = 500
    self.POSITIVE_MAX = 0x2D1
    self.INTEGER_ARRAY = java_new_array(nil, self.NEGATIVE_MAX + self.POSITIVE_MAX)
    self.STRING_ARRAY = java_new_array(nil, self.NEGATIVE_MAX + self.POSITIVE_MAX)
    self.MIN = 0
    self.lastMin = 0
    self.lastNegativeMin = 0
end


function SmallIntegerSingletonFactory.getInstance()
        return SmallIntegerSingletonFactory.instance
end


function SmallIntegerSingletonFactory:getMin()
        local minAllowed = self:getMinAllowed()
        if self.MIN <= minAllowed then
            if J2MEUtil.isJ2ME() then
            elseif AndroidUtil.isAndroid() then
                local logUtil = LogUtil.getInstance()
                logUtil:putF(tostring(StringMaker.new():append("Android InputFactory was initialized before GameMidlet: "):appendint(self.MIN)), self, "getMin")
                self:initWithRange(0x291, 6)
            else
                local logUtil = LogUtil.getInstance()
                logUtil:putF(tostring(StringMaker.new():append("InputFactory was initialized before GameMidlet or KeyFactoryInitializer - Currently this is occurs on JS build by TouchMotionGestureFactory constructor: "):appendint(self.MIN)), self, "getMin")
                self:initWithRange(0x2D0, 6)
            end
        end
        if self.MIN <= minAllowed then
            local logUtil = LogUtil.getInstance()
            logUtil:put("This means you loaded the InputFactory before determining the platform input size requirements.", self, "getMin", java_exception("Exception"))
        end
        return self.MIN
end


function SmallIntegerSingletonFactory:getMinAllowed()
        if J2MEUtil.isJ2ME() then
            return 0
        else
            if AndroidUtil.isAndroid() then
                return 0x101
            else
                return 23
            end
        end
end


function SmallIntegerSingletonFactory:initWithRange(value, negativeValue)
        for index = value - 1, self.lastMin, -1 do
            self.INTEGER_ARRAY[index + self.NEGATIVE_MAX + 1] = index
        end
        for index = negativeValue - 1, self.lastNegativeMin, -1 do
            self.INTEGER_ARRAY[index + 1] = -index
        end
        if self.lastMin < value then
            self.lastMin = value
            self.MIN = value
        end
        if self.lastNegativeMin < negativeValue then
            self.lastNegativeMin = negativeValue
        end
end


function SmallIntegerSingletonFactory:init()
        if self.lastMin < self.POSITIVE_MAX or self.lastNegativeMin < self.NEGATIVE_MAX then
            for index = self.POSITIVE_MAX - 1, self.lastMin, -1 do
                self.INTEGER_ARRAY[index + self.NEGATIVE_MAX + 1] = index
            end
            for index = self.NEGATIVE_MAX - 1, self.lastNegativeMin, -1 do
                self.INTEGER_ARRAY[index + 1] = -index
            end
            self.lastMin = self.POSITIVE_MAX
            self.MIN = self.lastMin
            self.lastNegativeMin = self.NEGATIVE_MAX
        end
end


function SmallIntegerSingletonFactory.new()
    local self = setmetatable({}, SmallIntegerSingletonFactory)
    self:_init_fields()
        self:initWithRange(23, 0)
    return self
end


function SmallIntegerSingletonFactory:getAt(index)
        return self.INTEGER_ARRAY[index + self.NEGATIVE_MAX + 1]
end


function SmallIntegerSingletonFactory:getAtNoThrow(index)
        if index + self.NEGATIVE_MAX > (self.INTEGER_ARRAY.n or #self.INTEGER_ARRAY) - 1 then
            return self.INTEGER_ARRAY[-1 + self.NEGATIVE_MAX + 1]
        end
        return self.INTEGER_ARRAY[index + self.NEGATIVE_MAX + 1]
end


function SmallIntegerSingletonFactory:createInstance(index)
        local integer = self:getAt(index)
        if integer == nil then
            integer = index
        end
        return integer
end


function SmallIntegerSingletonFactory:getString(index)
        local i = index + self.NEGATIVE_MAX
        if self.STRING_ARRAY[i + 1] == nil then
            self.STRING_ARRAY[i + 1] = tostring(self.INTEGER_ARRAY[i + 1])
        end
        return self.STRING_ARRAY[i + 1]
end

SmallIntegerSingletonFactory.instance = SmallIntegerSingletonFactory.new()

return SmallIntegerSingletonFactory


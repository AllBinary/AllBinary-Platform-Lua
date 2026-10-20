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
-- package org.allbinary.game.ag.ai

local StdUtil = require("org.allbinary.logic.StdUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputProbability = {}
InputProbability.__index = InputProbability
InputProbability.className = "InputProbability"

function InputProbability:_init_fields()
    self.likelyhoodIntegerArray = nil
    self.repeatLikelyhoodIntegerArray = nil
    self.max = nil
    self.timeDelayHelper = nil
end


function InputProbability.new(likelyhoodIntegerArray, repeatLikelyhoodIntegerArray, max, timeDelayHelper)
    local self = setmetatable({}, InputProbability)
    self:_init_fields()
        self.likelyhoodIntegerArray = likelyhoodIntegerArray
        self.repeatLikelyhoodIntegerArray = repeatLikelyhoodIntegerArray
        self.max = max
        self.timeDelayHelper = timeDelayHelper
    return self
end


function InputProbability:getLikelyhoodIntegerArray()
        return self.likelyhoodIntegerArray
end


function InputProbability:getRepeatLikelyhoodIntegerArray()
        return self.repeatLikelyhoodIntegerArray
end


function InputProbability:getMax()
        return self.max
end


function InputProbability:getTimeDelayHelper()
        return self.timeDelayHelper
end


function InputProbability:toHashtable()
        local hashtable = StdUtil.getInstance():createHashtable()
        hashtable:put(InputProbability.INPUT_PROBABILITY, self)
        return hashtable
end

InputProbability.INPUT_PROBABILITY = SmallIntegerSingletonFactory.getInstance():getAt(0)

return InputProbability


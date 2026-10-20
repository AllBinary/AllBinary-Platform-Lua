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

local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")

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

local NumberInSameGroupSequence = {}
NumberInSameGroupSequence.__index = NumberInSameGroupSequence
NumberInSameGroupSequence.className = "NumberInSameGroupSequence"

function NumberInSameGroupSequence:_init_fields()
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_TWO = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE = nil
    self.NUMBER_ON_SAME_TEAM_SEQUENCE = nil
end


function NumberInSameGroupSequence.getInstance()
        return NumberInSameGroupSequence.new()
end


function NumberInSameGroupSequence.new()
    local self = setmetatable({}, NumberInSameGroupSequence)
    self:_init_fields()
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO = smallIntegerSingletonFactory:getAt(100)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE = smallIntegerSingletonFactory:getAt(101)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_TWO = smallIntegerSingletonFactory:getAt(102)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE = smallIntegerSingletonFactory:getAt(103)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR = smallIntegerSingletonFactory:getAt(104)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE = smallIntegerSingletonFactory:getAt(105)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX = smallIntegerSingletonFactory:getAt(106)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN = smallIntegerSingletonFactory:getAt(107)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT = smallIntegerSingletonFactory:getAt(108)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE = smallIntegerSingletonFactory:getAt(109)
        self.NUMBER_ON_SAME_TEAM_SEQUENCE = {self.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO, self.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE, self.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE, self.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR, self.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE, self.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX, self.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN, self.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT, self.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE}
    return self
end

return NumberInSameGroupSequence


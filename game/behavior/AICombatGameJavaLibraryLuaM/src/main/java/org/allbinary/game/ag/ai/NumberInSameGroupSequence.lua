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

local NumberInSameGroupSequence = {}
package.loaded["org.allbinary.game.ag.ai.NumberInSameGroupSequence"] = NumberInSameGroupSequence

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

local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")

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

-- class table NumberInSameGroupSequence is declared before the requires
NumberInSameGroupSequence.__index = NumberInSameGroupSequence
NumberInSameGroupSequence.className = "NumberInSameGroupSequence"
NumberInSameGroupSequence.javaClassName = "org.allbinary.game.ag.ai.NumberInSameGroupSequence"

function NumberInSameGroupSequence:_init_fields()
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_TWO == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_TWO = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE = nil end
    if self.NUMBER_ON_SAME_TEAM_SEQUENCE == nil then self.NUMBER_ON_SAME_TEAM_SEQUENCE = nil end
end


function NumberInSameGroupSequence.getInstance()
        return NumberInSameGroupSequence.new()
end


function NumberInSameGroupSequence._jinit(self)
    NumberInSameGroupSequence._init_fields(self)
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

function NumberInSameGroupSequence.new(...)
    local self = setmetatable({}, NumberInSameGroupSequence)
    NumberInSameGroupSequence._jinit(self, ...)
    return self
end

return NumberInSameGroupSequence


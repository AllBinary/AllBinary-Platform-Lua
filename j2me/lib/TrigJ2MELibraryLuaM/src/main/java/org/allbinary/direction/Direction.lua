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
-- package org.allbinary.direction

local StringMaker = require("org.allbinary.logic.string.StringMaker")

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

local Direction = {}
Direction.__index = Direction
Direction.className = "Direction"

function Direction:_init_fields()
    self.name = nil
    self.otherName = nil
    self.value = nil
    self.frameFactor = nil
end


function Direction.new(name, otherName, value, frameFactor)
    local self = setmetatable({}, Direction)
    self:_init_fields()
        self.name = name
        self.otherName = otherName
        self.value = value
        self.frameFactor = frameFactor
        Direction.directionArray[value + 1] = self
    return self
end


function Direction.getInstance(direction)
        return Direction.directionArray[direction + 1]
end


function Direction:getValue()
        return self.value
end


function Direction:getFrameFactor()
        return self.frameFactor
end


function Direction:getOtherName()
        return self.otherName
end


function Direction:getName()
        return self.name
end


function Direction:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Direction: ")
        stringBuffer:append(self:getName())
        stringBuffer:append(" Or: ")
        stringBuffer:append(self:getOtherName())
        stringBuffer:append(" Value: ")
        stringBuffer:appendint(self.value)
        return tostring(stringBuffer)
end
Direction.__tostring = function(self) return self:toString() end

Direction.directionArray = java_new_array(nil, 13)

return Direction


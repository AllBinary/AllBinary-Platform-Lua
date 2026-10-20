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

local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")

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

local DirectionUtil = {}
DirectionUtil.__index = DirectionUtil
DirectionUtil.className = "DirectionUtil"

function DirectionUtil:_init_fields()
    self.directionArray = java_new_array(nil, 10)
    self.directionArray2 = java_new_array(nil, 10)
end


function DirectionUtil.getInstance()
        return DirectionUtil.instance
end


function DirectionUtil.new()
    local self = setmetatable({}, DirectionUtil)
    self:_init_fields()
        local angleFactory = AngleFactory.getInstance()
        local directionFactory = DirectionFactory.getInstance()
        self.directionArray[directionFactory.LEFT:getValue() + 1] = angleFactory.LEFT
        self.directionArray[directionFactory.RIGHT:getValue() + 1] = angleFactory.RIGHT
        self.directionArray[directionFactory.UP:getValue() + 1] = angleFactory.UP
        self.directionArray[directionFactory.DOWN:getValue() + 1] = angleFactory.DOWN
        self.directionArray2[directionFactory.LEFT:getValue() + 1] = angleFactory.LEFT
        self.directionArray2[directionFactory.RIGHT:getValue() + 1] = angleFactory.RIGHT
        self.directionArray2[directionFactory.UP:getValue() + 1] = angleFactory.UP
        self.directionArray2[directionFactory.DOWN:getValue() + 1] = angleFactory.DOWN
    return self
end


function DirectionUtil:getAngle(direction)
        return self.directionArray2[direction:getValue() + 1]
end


function DirectionUtil:getFrameAngle(direction)
        return self.directionArray[direction:getValue() + 1]
end

DirectionUtil.instance = DirectionUtil.new()

return DirectionUtil


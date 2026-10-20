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
-- package org.allbinary.input.gyro

local InputFactory = require("org.allbinary.game.input.InputFactory")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrientationMotionGestureFactory = {}
OrientationMotionGestureFactory.__index = OrientationMotionGestureFactory
OrientationMotionGestureFactory.className = "OrientationMotionGestureFactory"

function OrientationMotionGestureFactory:_init_fields()
    self.LEFT = nil
    self.RIGHT = nil
    self.UP = nil
    self.DOWN = nil
    self.ROLL_LEFT = nil
    self.ROLL_RIGHT = nil
end


function OrientationMotionGestureFactory.getInstance()
        if OrientationMotionGestureFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            OrientationMotionGestureFactory.instance = OrientationMotionGestureFactory.new()
        end
        return OrientationMotionGestureFactory.instance
end


function OrientationMotionGestureFactory.new()
    local self = setmetatable({}, OrientationMotionGestureFactory)
    self:_init_fields()
        local MAX = InputFactory.getInstance().MAX
        self.LEFT = MotionGestureInput.new(MAX - 20, "Left Orient")
        self.RIGHT = MotionGestureInput.new(MAX - 21, "Right Orient")
        self.UP = MotionGestureInput.new(MAX - 22, "Up Orient")
        self.DOWN = MotionGestureInput.new(MAX - 23, "Down Orient")
        self.ROLL_LEFT = MotionGestureInput.new(MAX - 24, "Roll Left")
        self.ROLL_RIGHT = MotionGestureInput.new(MAX - 25, "Roll Right")
    return self
end

OrientationMotionGestureFactory.instance = NullUtil.getInstance().NULL_OBJECT

return OrientationMotionGestureFactory


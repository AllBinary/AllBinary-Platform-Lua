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
-- package org.allbinary.input.motion.gesture

local InputFactory = require("org.allbinary.game.input.InputFactory")
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

local TrackballMotionGestureFactory = {}
TrackballMotionGestureFactory.__index = TrackballMotionGestureFactory
TrackballMotionGestureFactory.className = "TrackballMotionGestureFactory"

function TrackballMotionGestureFactory:_init_fields()
    self.LEFT = nil
    self.RIGHT = nil
    self.UP = nil
    self.DOWN = nil
end


function TrackballMotionGestureFactory.getInstance()
        if TrackballMotionGestureFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            TrackballMotionGestureFactory.instance = TrackballMotionGestureFactory.new()
        end
        return TrackballMotionGestureFactory.instance
end


function TrackballMotionGestureFactory.new()
    local self = setmetatable({}, TrackballMotionGestureFactory)
    self:_init_fields()
        local MAX = InputFactory.getInstance().MAX
        self.LEFT = MotionGestureInput.new(MAX - 26, "L Trackball")
        self.RIGHT = MotionGestureInput.new(MAX - 27, "R Trackball")
        self.UP = MotionGestureInput.new(MAX - 28, "Up Trackball")
        self.DOWN = MotionGestureInput.new(MAX - 29, "D Trackball")
    return self
end

TrackballMotionGestureFactory.instance = NullUtil.getInstance().NULL_OBJECT

return TrackballMotionGestureFactory


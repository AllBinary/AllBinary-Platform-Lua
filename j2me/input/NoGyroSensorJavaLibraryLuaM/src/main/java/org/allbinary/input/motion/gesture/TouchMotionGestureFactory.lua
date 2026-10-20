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

local TouchMotionGestureFactory = {}
TouchMotionGestureFactory.__index = TouchMotionGestureFactory
TouchMotionGestureFactory.className = "TouchMotionGestureFactory"

function TouchMotionGestureFactory:_init_fields()
    self.LEFT = nil
    self.RIGHT = nil
    self.UP = nil
    self.DOWN = nil
    self.PRESSED = nil
    self.RELEASED = nil
    self.DIAGONAL_DOWN_RIGHT = nil
    self.DIAGONAL_DOWN_LEFT = nil
    self.DIAGONAL_UP_RIGHT = nil
    self.DIAGONAL_UP_LEFT = nil
    self.SCROLL_UP = nil
    self.SCROLL_DOWN = nil
    self.NO_MOTION = nil
    self.LAST_MOTION = nil
end


function TouchMotionGestureFactory.getInstance()
        if TouchMotionGestureFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            TouchMotionGestureFactory.instance = TouchMotionGestureFactory.new()
        end
        return TouchMotionGestureFactory.instance
end


function TouchMotionGestureFactory.new()
    local self = setmetatable({}, TouchMotionGestureFactory)
    self:_init_fields()
        local MAX = InputFactory.getInstance().MAX
        self.LEFT = MotionGestureInput.new(MAX - 3, "Left Touch")
        self.RIGHT = MotionGestureInput.new(MAX - 4, "Right Touch")
        self.UP = MotionGestureInput.new(MAX - 5, "Up Touch")
        self.DOWN = MotionGestureInput.new(MAX - 6, "Down Touch")
        self.PRESSED = MotionGestureInput.new(MAX - 7, "Screen Press")
        self.RELEASED = MotionGestureInput.new(MAX - 8, "Released")
        self.DIAGONAL_DOWN_RIGHT = MotionGestureInput.new(MAX - 9, "Diagonal Dn R")
        self.DIAGONAL_DOWN_LEFT = MotionGestureInput.new(MAX - 10, "Diagonal Dn L")
        self.DIAGONAL_UP_RIGHT = MotionGestureInput.new(MAX - 11, "Diagonal Up R")
        self.DIAGONAL_UP_LEFT = MotionGestureInput.new(MAX - 12, "Diagonal Up L")
        self.SCROLL_UP = MotionGestureInput.new(MAX - 13, "Scroll Up")
        self.SCROLL_DOWN = MotionGestureInput.new(MAX - 14, "Scroll Down")
        self.NO_MOTION = MotionGestureInput.new(MAX - 2, "No Motion")
        self.LAST_MOTION = MotionGestureInput.new(MAX - 19, "Last Motion")
    return self
end

TouchMotionGestureFactory.instance = NullUtil.getInstance().NULL_OBJECT

return TouchMotionGestureFactory


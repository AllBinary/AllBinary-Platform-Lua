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
-- package org.allbinary.input.motion.gesture.observer

local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local AllBinaryEventObjectFactoryInterface = require("org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionEventFactory = {}
MotionEventFactory.__index = MotionEventFactory
MotionEventFactory.className = "MotionEventFactory"

function MotionEventFactory:_init_fields()
    self.source = nil
    self.id = nil
end


function MotionEventFactory.new(source, id)
    local self = setmetatable({}, MotionEventFactory)
    self:_init_fields()
        self.source = source
        self.id = id
        MotionEventFactory.index = TouchMotionGestureFactory.getInstance().LAST_MOTION:getId()
    return self
end


function MotionEventFactory:getInstance()
        local inputFactory = InputFactory.getInstance()
        local input = inputFactory:getInstanceById((function() local value = MotionEventFactory.index MotionEventFactory.index = value + 1 return value end)())
        if input == inputFactory.NO_INPUT then
            return MotionGestureEvent.new(self.source, self.id, TouchMotionGestureFactory.getInstance().NO_MOTION)
        else
            return MotionGestureEvent.new(self.source, self.id, input)
        end
end

MotionEventFactory.index = 0

return MotionEventFactory


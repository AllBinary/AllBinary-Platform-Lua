--
-- AllBinary Open License Version 1
-- Copyright (c) 2009 AllBinary
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
-- package org.allbinary.android.input.motion

local MotionEvent = require("android.view.MotionEvent")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local GameMotionGestureListener = require("org.allbinary.input.motion.gesture.observer.GameMotionGestureListener")
local MotionGestureReceiveInterfaceFactory = require("org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local MotionEventProcessor = require("org.allbinary.android.input.motion.MotionEventProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseGameInputMotionEventProcessor = {}
BaseGameInputMotionEventProcessor.__index = BaseGameInputMotionEventProcessor
BaseGameInputMotionEventProcessor.className = "BaseGameInputMotionEventProcessor"
setmetatable(BaseGameInputMotionEventProcessor, {__index = MotionEventProcessor})

function BaseGameInputMotionEventProcessor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.gameMotionGestureListener = nil
end


function BaseGameInputMotionEventProcessor.new()
    local self = setmetatable(MotionEventProcessor.new(), BaseGameInputMotionEventProcessor)
    self:_init_fields()
        self.gameMotionGestureListener = GameMotionGestureListener.new(MotionGestureReceiveInterfaceFactory.getInstance())
        self:addListener()
    return self
end


function BaseGameInputMotionEventProcessor:process(motionEvent)
end


function BaseGameInputMotionEventProcessor:addListener()
        local motionGesturesHandler = BasicMotionGesturesHandler.getInstance()
        motionGesturesHandler:addListenerInterface(self.gameMotionGestureListener)
end

return BaseGameInputMotionEventProcessor


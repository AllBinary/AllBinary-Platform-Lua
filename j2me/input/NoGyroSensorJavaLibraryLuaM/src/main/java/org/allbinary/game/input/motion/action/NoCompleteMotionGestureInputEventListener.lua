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
-- package org.allbinary.game.input.motion.action

local CompleteMotionGestureInputEvent = require("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local CompleteMotionGestureInputEventListenerInterface = require("org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoCompleteMotionGestureInputEventListener = {}
NoCompleteMotionGestureInputEventListener.__index = NoCompleteMotionGestureInputEventListener
NoCompleteMotionGestureInputEventListener.className = "NoCompleteMotionGestureInputEventListener"


function NoCompleteMotionGestureInputEventListener.new()
    local self = setmetatable({}, NoCompleteMotionGestureInputEventListener)
    return self
end


function NoCompleteMotionGestureInputEventListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function NoCompleteMotionGestureInputEventListener:onCompleteMotionGestureInputEvent(completeMotionGestureInputEvent)
end


function NoCompleteMotionGestureInputEventListener.getInstance()
        return NoCompleteMotionGestureInputEventListener.instance
end

NoCompleteMotionGestureInputEventListener.instance = NoCompleteMotionGestureInputEventListener.new()

return NoCompleteMotionGestureInputEventListener


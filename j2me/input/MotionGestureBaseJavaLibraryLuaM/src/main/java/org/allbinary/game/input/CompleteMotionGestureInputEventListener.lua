-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CompleteMotionGestureInputEventListenerInterface = require("org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompleteMotionGestureInputEventListener = {}
CompleteMotionGestureInputEventListener.__index = CompleteMotionGestureInputEventListener
CompleteMotionGestureInputEventListener.className = "CompleteMotionGestureInputEventListener"

function CompleteMotionGestureInputEventListener.new()
    local self = setmetatable({}, CompleteMotionGestureInputEventListener)
    return self
end


function CompleteMotionGestureInputEventListener:onEvent(eventObject)
end


function CompleteMotionGestureInputEventListener:onCompleteMotionGestureInputEvent(completeMotionGestureInputEvent)
end

return CompleteMotionGestureInputEventListener


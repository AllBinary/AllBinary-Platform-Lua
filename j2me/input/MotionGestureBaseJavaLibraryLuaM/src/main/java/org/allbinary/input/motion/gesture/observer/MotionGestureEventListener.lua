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

local BaseMotionGestureEventListener = require("org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local MotionGestureEventListener = {}
MotionGestureEventListener.__index = MotionGestureEventListener
MotionGestureEventListener.className = "MotionGestureEventListener"
setmetatable(MotionGestureEventListener, {__index = BaseMotionGestureEventListener})


function MotionGestureEventListener:onPressedMotionGestureEvent(ev)
    error("abstract method onPressedMotionGestureEvent")
end


function MotionGestureEventListener:onUpMotionGestureEvent(ev)
    error("abstract method onUpMotionGestureEvent")
end


function MotionGestureEventListener:onDownMotionGestureEvent(ev)
    error("abstract method onDownMotionGestureEvent")
end


function MotionGestureEventListener:onLeftMotionGestureEvent(ev)
    error("abstract method onLeftMotionGestureEvent")
end


function MotionGestureEventListener:onRightMotionGestureEvent(ev)
    error("abstract method onRightMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalDownRightMotionGestureEvent(ev)
    error("abstract method onDiagonalDownRightMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalDownLeftMotionGestureEvent(ev)
    error("abstract method onDiagonalDownLeftMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalUpRightMotionGestureEvent(ev)
    error("abstract method onDiagonalUpRightMotionGestureEvent")
end


function MotionGestureEventListener:onDiagonalUpLeftMotionGestureEvent(ev)
    error("abstract method onDiagonalUpLeftMotionGestureEvent")
end


-- throws Exception
function MotionGestureEventListener:released(ev)
    error("abstract method released")
end

return MotionGestureEventListener


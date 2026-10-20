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

local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local TsUtil = require("org.allbinary.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionGestureEvent = {}
MotionGestureEvent.__index = MotionGestureEvent
MotionGestureEvent.className = "MotionGestureEvent"
setmetatable(MotionGestureEvent, {__index = AllBinaryEventObject})

function MotionGestureEvent:_init_fields()
    self.motionGesture = TouchMotionGestureFactory.getInstance().NO_MOTION
    self.id = nil
    self.previousPoint = PointFactory.getInstance().ZERO_ZERO
    self.currentPoint = PointFactory.getInstance().ZERO_ZERO
    self.commonLabels = CommonLabels.getInstance()
end


function MotionGestureEvent.new(source, id, motionGesture)
    local self = setmetatable(AllBinaryEventObject.new(source), MotionGestureEvent)
    self:_init_fields()
        -- super(...) made self above
        self.id = id
        self:setMotionGesture(motionGesture)
    return self
end


function MotionGestureEvent:getMotionGesture()
        return self.motionGesture
end


function MotionGestureEvent:setMotionGesture(motionGesture)
        self.motionGesture = motionGesture
end


function MotionGestureEvent:getPreviousPoint()
        return self.previousPoint
end


function MotionGestureEvent:setPreviousPoint(previousPoint)
        self.previousPoint = previousPoint
end


function MotionGestureEvent:getCurrentPoint()
        return self.currentPoint
end


function MotionGestureEvent:setCurrentPoint(currentPoint)
        self.currentPoint = currentPoint
end


function MotionGestureEvent:toString()
        local stringBuffer = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        stringBuffer:append(stringUtil:toString(self.motionGesture))
        stringBuffer:append(self.commonLabels.CURRENT)
        stringBuffer:append(stringUtil:toString(self.currentPoint))
        stringBuffer:append(MotionGestureEvent.PREVIOUS)
        stringBuffer:append(stringUtil:toString(self.previousPoint))
        stringBuffer:append(MotionGestureEvent.HASHCODE)
        stringBuffer:appendint(java_int(TsUtil.getInstance():hashCode(self)))
        return tostring(stringBuffer)
end
MotionGestureEvent.__tostring = function(self) return self:toString() end


function MotionGestureEvent:getId()
        return self.id
end

MotionGestureEvent.PREVIOUS = " Previous: "
MotionGestureEvent.HASHCODE = " hashcode: "

return MotionGestureEvent


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

local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local MotionEventCircularPool = require("org.allbinary.input.motion.gesture.observer.MotionEventCircularPool")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MirrorMotionGestureEventUtil = {}
MirrorMotionGestureEventUtil.__index = MirrorMotionGestureEventUtil
MirrorMotionGestureEventUtil.className = "MirrorMotionGestureEventUtil"

function MirrorMotionGestureEventUtil:_init_fields()
    self.motionEventCircularPool = nil
end


function MirrorMotionGestureEventUtil.new()
    local self = setmetatable({}, MirrorMotionGestureEventUtil)
    self:_init_fields()
        self.motionEventCircularPool = MotionEventCircularPool.createPool(Integer.MAX_VALUE)
    return self
end


-- throws Exception
function MirrorMotionGestureEventUtil:mirrorVerticle(motionGestureEvent, halfWidth)
        local event = self.motionEventCircularPool:getInstance(motionGestureEvent:getMotionGesture())
        local previousNewX = self:getNewX(motionGestureEvent:getPreviousPoint():getX(), halfWidth)
        local currentNewX = self:getNewX(motionGestureEvent:getCurrentPoint():getX(), halfWidth)
        local pointFactory = PointFactory.getInstance()
        local mirroredPreviousPoint = pointFactory:createXY(previousNewX, motionGestureEvent:getPreviousPoint():getY())
        local mirroredCurrentPoint = pointFactory:createXY(currentNewX, motionGestureEvent:getCurrentPoint():getY())
        event:setPreviousPoint(mirroredPreviousPoint)
        event:setCurrentPoint(mirroredCurrentPoint)
        return event
end


function MirrorMotionGestureEventUtil:getNewX(x, halfWidth)
        local newX = 0
        if x > halfWidth then
            newX = halfWidth - (x - halfWidth)
        else
            newX = halfWidth + (halfWidth - x)
        end
        return newX
end


function MirrorMotionGestureEventUtil.getInstance()
        return MirrorMotionGestureEventUtil.instance
end

MirrorMotionGestureEventUtil.instance = MirrorMotionGestureEventUtil.new()

return MirrorMotionGestureEventUtil


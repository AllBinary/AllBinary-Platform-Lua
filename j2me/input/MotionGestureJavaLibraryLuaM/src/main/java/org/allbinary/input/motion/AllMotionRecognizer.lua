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
-- package org.allbinary.input.motion

local CustomGPoint = require("org.allbinary.graphics.CustomGPoint")
local GPointCircularPool = require("org.allbinary.graphics.GPointCircularPool")
local TouchButtonRecognizer = require("org.allbinary.input.motion.button.TouchButtonRecognizer")
local MotionGestureRecognizer = require("org.allbinary.input.motion.gesture.MotionGestureRecognizer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local MotionRecognizer = require("org.allbinary.input.motion.MotionRecognizer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllMotionRecognizer = {}
AllMotionRecognizer.__index = AllMotionRecognizer
AllMotionRecognizer.className = "AllMotionRecognizer"
setmetatable(AllMotionRecognizer, {__index = MotionRecognizer})

function AllMotionRecognizer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.motionGestureRecognizer = nil
    self.touchButtonProcessing = false
    self.touchButtonRecognizer = nil
    self.id = nil
    self.lastX = 0
    self.lastY = 0
end


function AllMotionRecognizer.new()
    local self = setmetatable(MotionRecognizer.new(), AllMotionRecognizer)
    self:_init_fields()
        self.id = (function() local value = AllMotionRecognizer.index AllMotionRecognizer.index = value + 1 return value end)()
        self.motionGestureRecognizer = MotionGestureRecognizer.new(self.id)
        self.touchButtonRecognizer = TouchButtonRecognizer.new()
    return self
end


-- throws Exception
function AllMotionRecognizer:processStartMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonRecognizer:pressTouchButtonInput(x, y, deviceId) then
            self.touchButtonProcessing = true
        end
        if not self.touchButtonProcessing then
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processPressedMotionEvent(point, deviceId, modifiers)
        end
end


-- throws Exception
function AllMotionRecognizer:processEndMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonRecognizer:releaseTouchButtonInput(x, y, deviceId) then
        end
        if not self.touchButtonProcessing then
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processReleasedMotionEvent(point, deviceId, modifiers)
        end
        if self.touchButtonProcessing then
            self.touchButtonProcessing = false
        end
end


-- throws Exception
function AllMotionRecognizer:processDraggedMotionEvent(x, y, deviceId, modifiers)
        if self.touchButtonProcessing then
            self.touchButtonRecognizer:pressTouchButtonInput(x, y, deviceId)
        end
        if not self.touchButtonProcessing then
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processDraggedMotionEvent(point, deviceId, modifiers)
        end
end


-- throws Exception
function AllMotionRecognizer:processMovedMotionEvent(x, y, deviceId, modifiers)
        if x ~= self.lastX or y ~= self.lastY then
            self.lastX = x
            self.lastY = y
            local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
            point:setX(x)
            point:setY(y)
            self.motionGestureRecognizer:processMovedMotionEvent(point, deviceId, modifiers)
        end
end


-- throws Exception
function AllMotionRecognizer:processScrolledMotionEvent(x, y, deviceId, modifiers)
        local point = AllMotionRecognizer.pointCircularPool:getNextInstance()
        point:setX(x)
        point:setY(y)
        self.motionGestureRecognizer:processScrolledMotionEvent(point, deviceId, modifiers)
end


function AllMotionRecognizer:getMotionGestureRecognizer()
        return self.motionGestureRecognizer
end

AllMotionRecognizer.index = 0
AllMotionRecognizer.pointCircularPool = GPointCircularPool.new(40)

return AllMotionRecognizer


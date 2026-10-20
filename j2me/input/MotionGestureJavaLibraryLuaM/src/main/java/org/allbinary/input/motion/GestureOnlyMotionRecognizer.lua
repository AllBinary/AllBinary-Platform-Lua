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
local MotionGestureRecognizer = require("org.allbinary.input.motion.gesture.MotionGestureRecognizer")
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

local GestureOnlyMotionRecognizer = {}
GestureOnlyMotionRecognizer.__index = GestureOnlyMotionRecognizer
GestureOnlyMotionRecognizer.className = "GestureOnlyMotionRecognizer"
setmetatable(GestureOnlyMotionRecognizer, {__index = MotionRecognizer})

function GestureOnlyMotionRecognizer:_init_fields()
    self.motionGestureRecognizer = nil
    self.id = nil
end


function GestureOnlyMotionRecognizer.new()
    local self = setmetatable(MotionRecognizer.new(), GestureOnlyMotionRecognizer)
    self:_init_fields()
        self.id = (function() local value = GestureOnlyMotionRecognizer.index GestureOnlyMotionRecognizer.index = value + 1 return value end)()
        self.motionGestureRecognizer = MotionGestureRecognizer.new(self.id)
    return self
end


-- throws Exception
function GestureOnlyMotionRecognizer:processStartMotionEvent(x, y, deviceId, modifiers)
        local point = GestureOnlyMotionRecognizer.pointCircularPool:getNextInstance()
        point:setX(x)
        point:setY(y)
        self.motionGestureRecognizer:processPressedMotionEvent(point, deviceId, modifiers)
end


-- throws Exception
function GestureOnlyMotionRecognizer:processEndMotionEvent(x, y, deviceId, modifiers)
        local point = GestureOnlyMotionRecognizer.pointCircularPool:getNextInstance()
        point:setX(x)
        point:setY(y)
        self.motionGestureRecognizer:processReleasedMotionEvent(point, deviceId, modifiers)
end


-- throws Exception
function GestureOnlyMotionRecognizer:processDraggedMotionEvent(x, y, deviceId, modifiers)
        local point = GestureOnlyMotionRecognizer.pointCircularPool:getNextInstance()
        point:setX(x)
        point:setY(y)
        self.motionGestureRecognizer:processDraggedMotionEvent(point, deviceId, modifiers)
end

GestureOnlyMotionRecognizer.index = 0
GestureOnlyMotionRecognizer.pointCircularPool = GPointCircularPool.new(40)

return GestureOnlyMotionRecognizer


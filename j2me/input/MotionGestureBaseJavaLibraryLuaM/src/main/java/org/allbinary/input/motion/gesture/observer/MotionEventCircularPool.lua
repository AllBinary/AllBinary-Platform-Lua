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

local InputFactory = require("org.allbinary.game.input.InputFactory")
local MotionGestureInput = require("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local AllBinaryEventCircularPool = require("org.allbinary.logic.util.event.AllBinaryEventCircularPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionEventCircularPool = {}
MotionEventCircularPool.__index = MotionEventCircularPool
MotionEventCircularPool.className = "MotionEventCircularPool"

function MotionEventCircularPool:_init_fields()
    self.MIN = TouchMotionGestureFactory.getInstance().LAST_MOTION:getId()
    self.eventPool = AllBinaryEventCircularPool.new((InputFactory.getInstance().MAX - 1) - self.MIN)
end


function MotionEventCircularPool.createPool(id)
        return MotionEventCircularPool.new(id)
end


function MotionEventCircularPool.new(id)
    local self = setmetatable({}, MotionEventCircularPool)
    self:_init_fields()
        self.eventPool:initAllBinaryEventCircularPool(MotionEventFactory.new(self.eventPool, id))
    return self
end


-- throws Exception
function MotionEventCircularPool:getInstance(motionGestureInput)
        return self.eventPool:getInstance(motionGestureInput:getId() - self.MIN)
end

return MotionEventCircularPool


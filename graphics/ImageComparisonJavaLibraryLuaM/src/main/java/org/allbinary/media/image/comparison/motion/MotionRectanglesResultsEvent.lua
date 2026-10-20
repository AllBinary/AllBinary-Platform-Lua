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
-- package org.allbinary.media.image.comparison.motion

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionRectanglesResultsEvent = {}
MotionRectanglesResultsEvent.__index = MotionRectanglesResultsEvent
MotionRectanglesResultsEvent.className = "MotionRectanglesResultsEvent"
setmetatable(MotionRectanglesResultsEvent, {__index = AllBinaryEventObject})

function MotionRectanglesResultsEvent:_init_fields()
    self.frame = nil
    self.motionRectangles = nil
end


function MotionRectanglesResultsEvent.new(anyType, frame, motionRectangles)
    local self = setmetatable(AllBinaryEventObject.new(anyType), MotionRectanglesResultsEvent)
    self:_init_fields()
        -- super(...) made self above
        self.frame = frame
        self:setMotionRectangles(motionRectangles)
    return self
end


function MotionRectanglesResultsEvent:getMotionRectangles()
        return self.motionRectangles
end


function MotionRectanglesResultsEvent:setMotionRectangles(motionRectangles)
        self.motionRectangles = motionRectangles
end


function MotionRectanglesResultsEvent:getFrame()
        return self.frame
end

return MotionRectanglesResultsEvent


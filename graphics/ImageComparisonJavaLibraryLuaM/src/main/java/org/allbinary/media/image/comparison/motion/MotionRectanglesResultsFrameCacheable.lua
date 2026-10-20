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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionRectanglesResultsFrameCacheable = {}
MotionRectanglesResultsFrameCacheable.__index = MotionRectanglesResultsFrameCacheable
MotionRectanglesResultsFrameCacheable.className = "MotionRectanglesResultsFrameCacheable"

function MotionRectanglesResultsFrameCacheable:_init_fields()
    self.motionRectangles = nil
    self.frame = nil
end


function MotionRectanglesResultsFrameCacheable.new(motionRectangles, frame)
    local self = setmetatable({}, MotionRectanglesResultsFrameCacheable)
    self:_init_fields()
        self.frame = frame
        self:setMotionRectangles(motionRectangles)
    return self
end


function MotionRectanglesResultsFrameCacheable:getKey()
        return self.frame
end


function MotionRectanglesResultsFrameCacheable:getMotionRectangles()
        return self.motionRectangles
end


function MotionRectanglesResultsFrameCacheable:setMotionRectangles(motionRectangles)
        self.motionRectangles = motionRectangles
end


function MotionRectanglesResultsFrameCacheable:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(" Frame: ")
        stringBuffer:append(tostring(self:getKey()))
        return tostring(stringBuffer)
end
MotionRectanglesResultsFrameCacheable.__tostring = function(self) return self:toString() end

return MotionRectanglesResultsFrameCacheable


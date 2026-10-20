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
-- package org.allbinary.input.automation.module

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local MotionRectangleConstraintsInterface = require("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionRectangleConstraints = {}
MotionRectangleConstraints.__index = MotionRectangleConstraints
MotionRectangleConstraints.className = "MotionRectangleConstraints"

function MotionRectangleConstraints:_init_fields()
    self.minDimension = nil
    self.maxDimension = nil
    self.maxMotionRectangles = 0
    self.minArea = 0
end


function MotionRectangleConstraints.new()
    local self = setmetatable({}, MotionRectangleConstraints)
    self:_init_fields()
    return self
end


function MotionRectangleConstraints:getMinDimension()
        return self.minDimension
end


function MotionRectangleConstraints:getMaxDimension()
        return self.maxDimension
end


function MotionRectangleConstraints:isTooSmall(rectangle)
        if rectangle.width < self:getMinDimension().width or rectangle.height < self:getMinDimension().height then
            return true
        else
            return false
        end
end


function MotionRectangleConstraints:isAreaTooSmall(rectangle)
        if rectangle.width * rectangle.height < self:getMinArea() then
            return true
        else
            return false
        end
end


function MotionRectangleConstraints:isTooBig(rectangle)
        if rectangle.width > self:getMaxDimension().width or rectangle.height > self:getMaxDimension().height then
            return true
        else
            return false
        end
end


-- throws Exception
function MotionRectangleConstraints:isValid(frame, bufferedImage, rectangle)
        error(java_exception("RuntimeException"), 0)
end


function MotionRectangleConstraints:setMinDimension(minDimension)
        self.minDimension = minDimension
end


function MotionRectangleConstraints:setMaxDimension(maxDimension)
        self.maxDimension = maxDimension
end


function MotionRectangleConstraints:getMaxMotionRectangles()
        return self.maxMotionRectangles
end


function MotionRectangleConstraints:setMaxMotionRectangles(maxMotionRectangles)
        self.maxMotionRectangles = maxMotionRectangles
end


function MotionRectangleConstraints:getMinArea()
        return self.minArea
end


function MotionRectangleConstraints:setMinArea(minArea)
        self.minArea = minArea
end

return MotionRectangleConstraints


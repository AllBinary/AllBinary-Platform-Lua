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

-- local Rectangle = require("java.awt.Rectangle")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local MotionRectangles = require("org.allbinary.media.image.comparison.motion.MotionRectangles")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ConstrainedMotionRectangles = {}
ConstrainedMotionRectangles.__index = ConstrainedMotionRectangles
ConstrainedMotionRectangles.className = "ConstrainedMotionRectangles"
setmetatable(ConstrainedMotionRectangles, {__index = MotionRectangles})

function ConstrainedMotionRectangles:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.motionRectangleConstraintsInterface = nil
end


function ConstrainedMotionRectangles.new(motionRectangleConstraintsInterface, motionRectangles)
    local self = setmetatable(MotionRectangles.new(ConstrainedMotionRectangles.NAME, motionRectangles:getImageComparisonResult()), ConstrainedMotionRectangles)
    self:_init_fields()
        -- super(...) made self above
        self:setMotionRectangleConstraintsInterface(motionRectangleConstraintsInterface)
    return self
end


-- throws Exception
function ConstrainedMotionRectangles:applyMotionRectangleConstraints(motionRectangles)
        self.logUtil:putF("Start - Size Before: " .. tostring(motionRectangles:getVector():size()), self, "applyMotionRectangleConstraints")
        local bufferedImageArray = motionRectangles:getImageComparisonResult():getBufferedImages()
        local bufferedImage = bufferedImageArray[2]
        local vector = BasicArrayListD.new()
        local vector2 = motionRectangles:getVector()
        local size = vector2:size()
        for index = 0, size - 1 do
            local motionRectangle = vector2:get(index)
            local rectangle = motionRectangle:getRectangle()
            local isTooSmall = self:getMotionRectangleConstraintsInterface():isTooSmall(rectangle)
            if isTooSmall then
                goto continue_N66349
            end
            local isAreaTooSmall = self:getMotionRectangleConstraintsInterface():isAreaTooSmall(rectangle)
            if isAreaTooSmall then
                goto continue_N66349
            end
            local isTooBig = self:getMotionRectangleConstraintsInterface():isTooBig(rectangle)
            if isTooBig then
                goto continue_N66349
            end
            local isValid = self:getMotionRectangleConstraintsInterface():isValid(self:getImageComparisonResult():getFrameTwo(), bufferedImage, motionRectangle:getRectangle())
            if not isValid then
                goto continue_N66349
            end
            if not isTooSmall and not isAreaTooSmall and not isTooBig and isValid then
                vector:add(motionRectangle)
            end
            ::continue_N66349::
        end
        self:setVector(vector)
end


function ConstrainedMotionRectangles:getMotionRectangleConstraintsInterface()
        return self.motionRectangleConstraintsInterface
end


function ConstrainedMotionRectangles:setMotionRectangleConstraintsInterface(motionRectangleConstraintsInterface)
        self.motionRectangleConstraintsInterface = motionRectangleConstraintsInterface
end

ConstrainedMotionRectangles.NAME = "constrainedMotionRectangles_"

return ConstrainedMotionRectangles


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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ImageComparisonResult = require("org.allbinary.media.image.comparison.ImageComparisonResult")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionRectangles = {}
MotionRectangles.__index = MotionRectangles
MotionRectangles.className = "MotionRectangles"

function MotionRectangles:_init_fields()
    self.name = nil
    self.rectangleVector = nil
    self.imageComparisonResult = nil
    self.MAX_PIXEL_DISTANCE_THRESHOLD = 2
end


function MotionRectangles.new(name, imageComparisonResult)
    local self = setmetatable({}, MotionRectangles)
    self:_init_fields()
        self.name = name
        self:setImageComparisonResult(imageComparisonResult)
        self:setVector(BasicArrayListD.new())
    return self
end


function MotionRectangles:getVector()
        return self.rectangleVector
end


function MotionRectangles:setVector(rectangleVector)
        self.rectangleVector = rectangleVector
end


function MotionRectangles:getName()
        return self.name
end


function MotionRectangles:getImageComparisonResult()
        return self.imageComparisonResult
end


function MotionRectangles:setImageComparisonResult(imageComparisonResult)
        self.imageComparisonResult = imageComparisonResult
end

return MotionRectangles


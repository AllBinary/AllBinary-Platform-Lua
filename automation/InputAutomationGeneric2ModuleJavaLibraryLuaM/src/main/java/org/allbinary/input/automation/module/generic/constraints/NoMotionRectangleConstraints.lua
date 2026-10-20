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
-- package org.allbinary.input.automation.module.generic.constraints

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local MotionRectangleConstraints = require("org.allbinary.input.automation.module.MotionRectangleConstraints")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoMotionRectangleConstraints = {}
NoMotionRectangleConstraints.__index = NoMotionRectangleConstraints
NoMotionRectangleConstraints.className = "NoMotionRectangleConstraints"
setmetatable(NoMotionRectangleConstraints, {__index = MotionRectangleConstraints})


function NoMotionRectangleConstraints.new()
    local self = setmetatable(MotionRectangleConstraints.new(), NoMotionRectangleConstraints)
        self:setMinDimension(Dimension.new(0, 0))
        self:setMinArea(0)
        self:setMaxDimension(Dimension.new(Integer.MAX_VALUE, Integer.MAX_VALUE))
        self:setMaxMotionRectangles(Integer.MAX_VALUE)
    return self
end


function NoMotionRectangleConstraints:isValid(frame, bufferedImage, rectangle)
        return true
end

return NoMotionRectangleConstraints


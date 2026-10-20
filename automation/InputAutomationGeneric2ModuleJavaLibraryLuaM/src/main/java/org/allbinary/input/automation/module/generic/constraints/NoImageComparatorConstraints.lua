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
local GPoint = require("org.allbinary.graphics.GPoint")
local ImageComparatorConstraints = require("org.allbinary.input.automation.module.ImageComparatorConstraints")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoImageComparatorConstraints = {}
NoImageComparatorConstraints.__index = NoImageComparatorConstraints
NoImageComparatorConstraints.className = "NoImageComparatorConstraints"
setmetatable(NoImageComparatorConstraints, {__index = ImageComparatorConstraints})


function NoImageComparatorConstraints.new()
    local self = setmetatable(ImageComparatorConstraints.new(1), NoImageComparatorConstraints)
        -- super(...) made self above
        self:setMaxNonMatchingPixelDeltas(Integer.MAX_VALUE)
    return self
end


function NoImageComparatorConstraints:isColorAllowed(frame, point, color)
        return true
end


function NoImageComparatorConstraints:isImageValid(bufferedImage)
        return true
end

return NoImageComparatorConstraints


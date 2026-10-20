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
-- local Vector = require("java.util.Vector")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- java.lang.Cloneable has no Lua module
local Cloneable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionRectangle = {}
MotionRectangle.__index = MotionRectangle
MotionRectangle.className = "MotionRectangle"

function MotionRectangle:_init_fields()
    self.rectangle = nil
    self.pixelDeltaVector = nil
end


function MotionRectangle.new(rectangle)
    local self = setmetatable({}, MotionRectangle)
    self:_init_fields()
        self:setRectangle(rectangle)
        self:setPixelDeltaVector(BasicArrayListD.new())
    return self
end


function MotionRectangle:getRectangle()
        return self.rectangle
end


function MotionRectangle:setRectangle(rectangle)
        self.rectangle = rectangle
end


function MotionRectangle:getPixelDeltaVector()
        return self.pixelDeltaVector
end


function MotionRectangle:setPixelDeltaVector(pixelDeltaVector)
        self.pixelDeltaVector = pixelDeltaVector
end


function MotionRectangle:clone()
        local motionRectangle = MotionRectangle.new(self:getRectangle():clone())
        motionRectangle:setPixelDeltaVector(self:getPixelDeltaVector():clone())
        return motionRectangle
end

return MotionRectangle


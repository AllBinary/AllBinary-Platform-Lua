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
-- package org.allbinary.animation.image

-- local Image = require("javax.microedition.lcdui.Image")
local AngleInfo = require("org.allbinary.math.AngleInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArrayRotationAnimationInfo = {}
ImageArrayRotationAnimationInfo.__index = ImageArrayRotationAnimationInfo
ImageArrayRotationAnimationInfo.className = "ImageArrayRotationAnimationInfo"

function ImageArrayRotationAnimationInfo:_init_fields()
    self.imageArray = nil
    self.angleIncrement = nil
    self.totalAngle = nil
    self.dx = nil
    self.dy = nil
end


function ImageArrayRotationAnimationInfo.new(imageArray, angleIncrement, totalAngle, dx, dy)
    local self = setmetatable({}, ImageArrayRotationAnimationInfo)
    self:_init_fields()
        self.imageArray = imageArray
        self.angleIncrement = angleIncrement
        self.totalAngle = totalAngle
        self.dx = dx
        self.dy = dy
    return self
end


function ImageArrayRotationAnimationInfo:setImageArray(imageArray)
        self.imageArray = imageArray
end


function ImageArrayRotationAnimationInfo:getImageArray()
        return self.imageArray
end


function ImageArrayRotationAnimationInfo:getAngleInfoP()
        return AngleInfo.getInstance(self.angleIncrement)
end


function ImageArrayRotationAnimationInfo:setTotalAngle(totalAngle)
        self.totalAngle = totalAngle
end


function ImageArrayRotationAnimationInfo:getTotalAngle()
        return self.totalAngle
end


function ImageArrayRotationAnimationInfo:setDx(dx)
        self.dx = dx
end


function ImageArrayRotationAnimationInfo:getDx()
        return self.dx
end


function ImageArrayRotationAnimationInfo:setDy(dy)
        self.dy = dy
end


function ImageArrayRotationAnimationInfo:getDy()
        return self.dy
end

return ImageArrayRotationAnimationInfo


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

local ImageArrayRotationAnimationInfo = {}
package.loaded["org.allbinary.animation.image.ImageArrayRotationAnimationInfo"] = ImageArrayRotationAnimationInfo

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Image = require("javax.microedition.lcdui.Image")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ImageArrayRotationAnimationInfo is declared before the requires
ImageArrayRotationAnimationInfo.__index = ImageArrayRotationAnimationInfo
ImageArrayRotationAnimationInfo.className = "ImageArrayRotationAnimationInfo"
ImageArrayRotationAnimationInfo.javaClassName = "org.allbinary.animation.image.ImageArrayRotationAnimationInfo"

function ImageArrayRotationAnimationInfo:_init_fields()
    if self.imageArray == nil then self.imageArray = nil end
    if self.angleIncrement == nil then self.angleIncrement = nil end
    if self.totalAngle == nil then self.totalAngle = nil end
    if self.dx == nil then self.dx = nil end
    if self.dy == nil then self.dy = nil end
end


function ImageArrayRotationAnimationInfo._jinit(self, imageArray, angleIncrement, totalAngle, dx, dy)
    ImageArrayRotationAnimationInfo._init_fields(self)
        self.imageArray = imageArray
        self.angleIncrement = angleIncrement
        self.totalAngle = totalAngle
        self.dx = dx
        self.dy = dy
    return self
end

function ImageArrayRotationAnimationInfo.new(...)
    local self = setmetatable({}, ImageArrayRotationAnimationInfo)
    ImageArrayRotationAnimationInfo._jinit(self, ...)
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


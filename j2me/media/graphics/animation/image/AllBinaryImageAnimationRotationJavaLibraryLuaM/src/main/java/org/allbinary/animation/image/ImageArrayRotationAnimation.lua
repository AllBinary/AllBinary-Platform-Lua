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
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageArrayBaseRotationAnimation = require("org.allbinary.animation.image.ImageArrayBaseRotationAnimation")

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

local ImageArrayRotationAnimation = {}
ImageArrayRotationAnimation.__index = ImageArrayRotationAnimation
ImageArrayRotationAnimation.className = "ImageArrayRotationAnimation"
setmetatable(ImageArrayRotationAnimation, {__index = ImageArrayBaseRotationAnimation})

function ImageArrayRotationAnimation:_init_fields()
    self.expectedTotalFrames = 0
end


-- throws Exception
function ImageArrayRotationAnimation.createAnimation(anyType, animationBehavior)
        local imageRotationAnimationInfo = anyType
        return ImageArrayRotationAnimation.new(imageRotationAnimationInfo:getImageArray(), imageRotationAnimationInfo:getAngleInfoP(), imageRotationAnimationInfo:getTotalAngle(), animationBehavior)
end


function ImageArrayRotationAnimation.new(imageArray, angleInfo, totalAngle, animationBehavior)
    local self = setmetatable(ImageArrayBaseRotationAnimation.new(imageArray, angleInfo, animationBehavior), ImageArrayRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(imageArray, angleInfo, totalAngle)
    return self
end


-- throws Exception
function ImageArrayRotationAnimation:init(imageArray, angleInfo, totalAngle)
        self.expectedTotalFrames = totalAngle / self.angleInfo:getAngleIncrementInfo():getAngleIncrement()
        self.angleInfo:adjustAngle(0)
        if self.expectedTotalFrames ~= self:getSize() then
            error(java_exception("Exception", "Wrong Number of Frames"), 0)
        end
end


function ImageArrayRotationAnimation:setImageArray(imageArray)
        ImageArrayBaseRotationAnimation.setImageArray(self, imageArray)
        self.angleInfo:adjustAngle(0)
end

return ImageArrayRotationAnimation


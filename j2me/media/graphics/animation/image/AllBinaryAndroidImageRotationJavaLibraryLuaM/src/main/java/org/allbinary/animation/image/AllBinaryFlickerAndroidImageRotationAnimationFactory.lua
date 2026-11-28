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

local AllBinaryFlickerAndroidImageRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.image.AllBinaryFlickerAndroidImageRotationAnimationFactory"] = AllBinaryFlickerAndroidImageRotationAnimationFactory

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ImageCopyUtil = java_lazy("org.allbinary.media.image.ImageCopyUtil")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AllBinaryFlickerAndroidImageRotationAnimation = java_lazy("org.allbinary.animation.image.AllBinaryFlickerAndroidImageRotationAnimation")

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

-- class table AllBinaryFlickerAndroidImageRotationAnimationFactory is declared before the requires
AllBinaryFlickerAndroidImageRotationAnimationFactory.__index = AllBinaryFlickerAndroidImageRotationAnimationFactory
AllBinaryFlickerAndroidImageRotationAnimationFactory.className = "AllBinaryFlickerAndroidImageRotationAnimationFactory"
AllBinaryFlickerAndroidImageRotationAnimationFactory.javaClassName = "org.allbinary.animation.image.AllBinaryFlickerAndroidImageRotationAnimationFactory"
AllBinaryFlickerAndroidImageRotationAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
AllBinaryFlickerAndroidImageRotationAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function AllBinaryFlickerAndroidImageRotationAnimationFactory:_init_fields()
    self.image = NullImage.NULL_IMAGE
    if self.angleIncrement == nil then self.angleIncrement = 0 end
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory._jinit(self, image, width, height, angleIncrement, animationBehaviorFactory)
    AllBinaryFlickerAndroidImageRotationAnimationFactory._init_fields(self)
        self:setImage(image)
        self.angleIncrement = angleIncrement
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end

function AllBinaryFlickerAndroidImageRotationAnimationFactory.new(...)
    local self = setmetatable({}, AllBinaryFlickerAndroidImageRotationAnimationFactory)
    AllBinaryFlickerAndroidImageRotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function AllBinaryFlickerAndroidImageRotationAnimationFactory:getInstance(instanceId)
        local image = ImageCopyUtil.getInstance():createImage(self:getImage())
        return AllBinaryFlickerAndroidImageRotationAnimation.new(self:getImage(), image, AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrement
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:setImage(image)
        self.image = image
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:getImage()
        return self.image
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:setInitialScale(scaleProperties)
end

return AllBinaryFlickerAndroidImageRotationAnimationFactory


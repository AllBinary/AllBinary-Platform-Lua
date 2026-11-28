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

local PooledImageArrayRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.image.PooledImageArrayRotationAnimationFactory"] = PooledImageArrayRotationAnimationFactory

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
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local ImageToRotationImageArrayUtil = java_lazy("org.allbinary.media.image.ImageToRotationImageArrayUtil")
local AdjustedImageArrayRotationAnimation = java_lazy("org.allbinary.animation.image.AdjustedImageArrayRotationAnimation")
local ImageArrayRotationAnimationInfo = java_lazy("org.allbinary.animation.image.ImageArrayRotationAnimationInfo")

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

--TWB - Adjustments should be done in the resource creation and not at the animation level
-- class table PooledImageArrayRotationAnimationFactory is declared before the requires
PooledImageArrayRotationAnimationFactory.__index = PooledImageArrayRotationAnimationFactory
PooledImageArrayRotationAnimationFactory.className = "PooledImageArrayRotationAnimationFactory"
PooledImageArrayRotationAnimationFactory.javaClassName = "org.allbinary.animation.image.PooledImageArrayRotationAnimationFactory"
PooledImageArrayRotationAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
PooledImageArrayRotationAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function PooledImageArrayRotationAnimationFactory:_init_fields()
    self.allBinaryImageRotationAnimationInfo = NullUtil.getInstance().NULL_OBJECT
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


-- throws Exception
function PooledImageArrayRotationAnimationFactory.createFactory(image, animationBehaviorFactory)
        local totalAngle = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
        local angleIncrement = (totalAngle / GameConfigurationCentral.getInstance():getGameControlFidelity())
        return PooledImageArrayRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), -((image:getWidth()) // (1 << (2))), -((image:getHeight()) // (1 << (2))), angleIncrement, animationBehaviorFactory)
end


-- throws Exception
function PooledImageArrayRotationAnimationFactory.createDXY(image, dx, dy, animationBehaviorFactory)
        local totalAngle = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
        local angleIncrement = (totalAngle / GameConfigurationCentral.getInstance():getGameControlFidelity())
        return PooledImageArrayRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), dx, dy, angleIncrement, animationBehaviorFactory)
end


function PooledImageArrayRotationAnimationFactory._jinit(self, image, width, height, dx, dy, angleIncrement, animationBehaviorFactory)
    PooledImageArrayRotationAnimationFactory._init_fields(self)
        self.animationBehaviorFactory = animationBehaviorFactory
        local totalAngle = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
        local imageArray = ImageToRotationImageArrayUtil.getInstance():generate(image, angleIncrement, totalAngle)
        self.allBinaryImageRotationAnimationInfo = ImageArrayRotationAnimationInfo.new(imageArray, angleIncrement, totalAngle, dx, dy)
    return self
end

function PooledImageArrayRotationAnimationFactory.new(...)
    local self = setmetatable({}, PooledImageArrayRotationAnimationFactory)
    PooledImageArrayRotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function PooledImageArrayRotationAnimationFactory:getInstance(instanceId)
        return AdjustedImageArrayRotationAnimation.createAdjustedImageArrayRotationAnimationInfo(self.allBinaryImageRotationAnimationInfo, self.animationBehaviorFactory:getOrCreateInstance())
end


function PooledImageArrayRotationAnimationFactory:setInitialScale(scaleProperties)
end

return PooledImageArrayRotationAnimationFactory


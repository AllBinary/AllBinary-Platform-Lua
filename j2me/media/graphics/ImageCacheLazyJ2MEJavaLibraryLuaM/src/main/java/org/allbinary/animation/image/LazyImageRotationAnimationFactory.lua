-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local LazyImageRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.image.LazyImageRotationAnimationFactory"] = LazyImageRotationAnimationFactory

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

local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ImageCacheFactory = java_lazy("org.allbinary.image.ImageCacheFactory")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local BaseImageAnimationFactory = java_lazy("org.allbinary.animation.image.BaseImageAnimationFactory")
local LazyImageRotationAnimation = java_lazy("org.allbinary.animation.image.LazyImageRotationAnimation")

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

-- class table LazyImageRotationAnimationFactory is declared before the requires
LazyImageRotationAnimationFactory.__index = LazyImageRotationAnimationFactory
LazyImageRotationAnimationFactory.className = "LazyImageRotationAnimationFactory"
LazyImageRotationAnimationFactory.javaClassName = "org.allbinary.animation.image.LazyImageRotationAnimationFactory"
LazyImageRotationAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
LazyImageRotationAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function LazyImageRotationAnimationFactory:_init_fields()
    if self.layoutIndex == nil then self.layoutIndex = 0 end
    if self.animationInterfaceFactoryInterface == nil then self.animationInterfaceFactoryInterface = nil end
    self.scaleProperties = ScaleProperties.instance_f
end


function LazyImageRotationAnimationFactory._jinit(self, layoutIndex, associatedLazyAnimationId, animationInterfaceFactoryInterface)
    LazyImageRotationAnimationFactory._init_fields(self)
        self.layoutIndex = layoutIndex
        self.animationInterfaceFactoryInterface = animationInterfaceFactoryInterface
        ImageCacheFactory.getInstance().hasAnyLazyAnimationFactories = true
        if rawequal(self.animationInterfaceFactoryInterface.animationBehaviorFactory, AnimationBehaviorFactory.getInstance()) then
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", self)
        end
    return self
end

function LazyImageRotationAnimationFactory.new(...)
    local self = setmetatable({}, LazyImageRotationAnimationFactory)
    LazyImageRotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function LazyImageRotationAnimationFactory:getInstance(instanceId)
        if self.animationInterfaceFactoryInterface:getImage():isReady() then
            self.animationInterfaceFactoryInterface:setInitialScale(self.scaleProperties)
            return self.animationInterfaceFactoryInterface:getInstance(instanceId)
        else
            return LazyImageRotationAnimation.new(self.layoutIndex, instanceId, self.scaleProperties, self.animationInterfaceFactoryInterface, self.animationInterfaceFactoryInterface.animationBehaviorFactory:getOrCreateInstance())
        end
end


function LazyImageRotationAnimationFactory:setInitialScale(scaleProperties)
        self.scaleProperties = scaleProperties
end

return LazyImageRotationAnimationFactory


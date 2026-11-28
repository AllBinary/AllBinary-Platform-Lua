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

local ImageArrayAnimationFactory = {}
package.loaded["org.allbinary.animation.image.ImageArrayAnimationFactory"] = ImageArrayAnimationFactory

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
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AdjustedImageArrayAnimation = java_lazy("org.allbinary.animation.image.AdjustedImageArrayAnimation")
local ImageArrayAnimation = java_lazy("org.allbinary.animation.image.ImageArrayAnimation")

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

-- class table ImageArrayAnimationFactory is declared before the requires
ImageArrayAnimationFactory.__index = ImageArrayAnimationFactory
ImageArrayAnimationFactory.className = "ImageArrayAnimationFactory"
ImageArrayAnimationFactory.javaClassName = "org.allbinary.animation.image.ImageArrayAnimationFactory"
ImageArrayAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
ImageArrayAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function ImageArrayAnimationFactory:_init_fields()
    self.dx = 0
    self.dy = 0
    if self.imageArray == nil then self.imageArray = nil end
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function ImageArrayAnimationFactory._jinit(self, imageArray, dx, dy, animationBehaviorFactory)
    ImageArrayAnimationFactory._init_fields(self)
        self.imageArray = imageArray
        self.animationBehaviorFactory = animationBehaviorFactory
        self.dx = dx
        self.dy = dy
    return self
end

function ImageArrayAnimationFactory.new(...)
    local self = setmetatable({}, ImageArrayAnimationFactory)
    ImageArrayAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function ImageArrayAnimationFactory:getInstance(instanceId)
        if not rawequal(self.dx, 0) or not rawequal(self.dy, 0) then
            return AdjustedImageArrayAnimation.new(self.imageArray, self.dx, self.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return ImageArrayAnimation.new(self.imageArray, AnimationBehavior.getInstance())
        end
end


function ImageArrayAnimationFactory:setInitialScale(scaleProperties)
end

return ImageArrayAnimationFactory


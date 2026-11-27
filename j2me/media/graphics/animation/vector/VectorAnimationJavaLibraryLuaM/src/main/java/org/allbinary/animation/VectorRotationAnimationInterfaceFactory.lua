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
-- package org.allbinary.animation

local VectorRotationAnimationInterfaceFactory = {}
package.loaded["org.allbinary.animation.VectorRotationAnimationInterfaceFactory"] = VectorRotationAnimationInterfaceFactory

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

local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local VectorRotationAnimation = java_lazy("org.allbinary.animation.VectorRotationAnimation")

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

-- class table VectorRotationAnimationInterfaceFactory is declared before the requires
VectorRotationAnimationInterfaceFactory.__index = VectorRotationAnimationInterfaceFactory
VectorRotationAnimationInterfaceFactory.className = "VectorRotationAnimationInterfaceFactory"
VectorRotationAnimationInterfaceFactory.javaClassName = "org.allbinary.animation.VectorRotationAnimationInterfaceFactory"
VectorRotationAnimationInterfaceFactory.java_implements = " AnimationInterfaceFactoryInterface "
VectorRotationAnimationInterfaceFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function VectorRotationAnimationInterfaceFactory:_init_fields()
    self.currentPoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
    self.basicColor = BasicColorFactory.getInstance().WHITE
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function VectorRotationAnimationInterfaceFactory._jinit(self, currentPoints, basicColor, animationBehaviorFactory)
    VectorRotationAnimationInterfaceFactory._init_fields(self)
        self.currentPoints = currentPoints
        self:setBasicColorP(basicColor)
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end

function VectorRotationAnimationInterfaceFactory.new(...)
    local self = setmetatable({}, VectorRotationAnimationInterfaceFactory)
    VectorRotationAnimationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function VectorRotationAnimationInterfaceFactory:getInstance(instanceId)
        return VectorRotationAnimation.new(self.currentPoints, self:getBasicColorP(), self.animationBehaviorFactory:getOrCreateInstance())
end


function VectorRotationAnimationInterfaceFactory:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function VectorRotationAnimationInterfaceFactory:getBasicColorP()
        return self.basicColor
end


function VectorRotationAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return VectorRotationAnimationInterfaceFactory


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

local RotationAnimationFactory = {}
package.loaded["org.allbinary.animation.RotationAnimationFactory"] = RotationAnimationFactory

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

local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local NullRotationAnimation = java_lazy("org.allbinary.animation.NullRotationAnimation")

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

-- class table RotationAnimationFactory is declared before the requires
RotationAnimationFactory.__index = RotationAnimationFactory
RotationAnimationFactory.className = "RotationAnimationFactory"
RotationAnimationFactory.javaClassName = "org.allbinary.animation.RotationAnimationFactory"
RotationAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface ProceduralAnimationInterfaceFactoryInterface "
RotationAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface} end

function RotationAnimationFactory:_init_fields()
    if self.totalAngle == nil then self.totalAngle = nil end
    if self.angleIncrement == nil then self.angleIncrement = nil end
end


function RotationAnimationFactory.createFactory()
        local totalAngle = AngleFactory.getInstance().TOTAL_ANGLE
        return RotationAnimationFactory.new(totalAngle, java_int((totalAngle / GameConfigurationCentral.getInstance():getGameControlFidelity())))
end


function RotationAnimationFactory._jinit(self, totalAngle, angleIncrement)
    RotationAnimationFactory._init_fields(self)
        self.totalAngle = totalAngle
        self.angleIncrement = angleIncrement
    return self
end

function RotationAnimationFactory.new(...)
    local self = setmetatable({}, RotationAnimationFactory)
    RotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function RotationAnimationFactory:getInstance(instanceId)
        return NullRotationAnimation.createTotalAngle(AngleInfo.getInstance(self.angleIncrement), self.totalAngle, AnimationBehavior.getInstance())
end


-- throws Exception
function RotationAnimationFactory:getInstanceAnimation(animationInterface)
        return NullRotationAnimation.createTotalAngle(AngleInfo.getInstance(self.angleIncrement), self.totalAngle, AnimationBehavior.getInstance())
end


function RotationAnimationFactory:setInitialScale(scaleProperties)
end

return RotationAnimationFactory


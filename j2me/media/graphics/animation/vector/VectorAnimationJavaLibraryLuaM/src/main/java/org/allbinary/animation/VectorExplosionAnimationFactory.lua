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

local VectorExplosionAnimationFactory = {}
package.loaded["org.allbinary.animation.VectorExplosionAnimationFactory"] = VectorExplosionAnimationFactory

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
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local VectorAnimationInterface = java_lazy("org.allbinary.animation.VectorAnimationInterface")
local VectorExplosionGenerator = java_lazy("org.allbinary.animation.VectorExplosionGenerator")
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

-- class table VectorExplosionAnimationFactory is declared before the requires
VectorExplosionAnimationFactory.__index = VectorExplosionAnimationFactory
VectorExplosionAnimationFactory.className = "VectorExplosionAnimationFactory"
VectorExplosionAnimationFactory.javaClassName = "org.allbinary.animation.VectorExplosionAnimationFactory"
VectorExplosionAnimationFactory.java_implements = " ProceduralAnimationInterfaceFactoryInterface "
VectorExplosionAnimationFactory.java_interfaces = function() return {ProceduralAnimationInterfaceFactoryInterface} end

function VectorExplosionAnimationFactory:_init_fields()
    self.vectorExplosionGenerator = VectorExplosionGenerator.getInstance()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function VectorExplosionAnimationFactory._jinit(self, basicColor, animationBehaviorFactory)
    VectorExplosionAnimationFactory._init_fields(self)
        self.animationBehaviorFactory = animationBehaviorFactory
        self:setBasicColorP(basicColor)
    return self
end

function VectorExplosionAnimationFactory.new(...)
    local self = setmetatable({}, VectorExplosionAnimationFactory)
    VectorExplosionAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function VectorExplosionAnimationFactory:getInstanceAnimation(animationInterface)
        local vectorRotationAnimationInterface = animationInterface
        local frame = vectorRotationAnimationInterface:getFrame()
        local framePoints = vectorRotationAnimationInterface:getPoints(frame)
        local points = self.vectorExplosionGenerator:getInstance(framePoints, 6, self.vectorExplosionGenerator.ROTATION)
        return VectorRotationAnimation.new(points, self:getBasicColorP(), self.animationBehaviorFactory:getOrCreateInstance())
end


function VectorExplosionAnimationFactory:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function VectorExplosionAnimationFactory:getBasicColorP()
        return self.basicColor
end

return VectorExplosionAnimationFactory


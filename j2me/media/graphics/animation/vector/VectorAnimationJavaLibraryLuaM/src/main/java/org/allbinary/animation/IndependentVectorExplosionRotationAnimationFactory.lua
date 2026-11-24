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

local IndependentVectorExplosionRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.IndependentVectorExplosionRotationAnimationFactory"] = IndependentVectorExplosionRotationAnimationFactory

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
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local VectorInfo = java_lazy("org.allbinary.vector.VectorInfo")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local VectorAnimationFactoryInterface = java_lazy("org.allbinary.animation.VectorAnimationFactoryInterface")
local VectorExplosionGenerator = java_lazy("org.allbinary.animation.VectorExplosionGenerator")
local VectorRotationGenerator = java_lazy("org.allbinary.animation.VectorRotationGenerator")

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

-- class table IndependentVectorExplosionRotationAnimationFactory is declared before the requires
IndependentVectorExplosionRotationAnimationFactory.__index = IndependentVectorExplosionRotationAnimationFactory
IndependentVectorExplosionRotationAnimationFactory.className = "IndependentVectorExplosionRotationAnimationFactory"
IndependentVectorExplosionRotationAnimationFactory.javaClassName = "org.allbinary.animation.IndependentVectorExplosionRotationAnimationFactory"
IndependentVectorExplosionRotationAnimationFactory.java_implements = " ProceduralAnimationInterfaceFactoryInterface "
IndependentVectorExplosionRotationAnimationFactory.java_interfaces = function() return {ProceduralAnimationInterfaceFactoryInterface} end

function IndependentVectorExplosionRotationAnimationFactory:_init_fields()
    self.framePoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
    if self.vectorInfo == nil then self.vectorInfo = nil end
    if self.basicColor == nil then self.basicColor = nil end
    if self.vectorAnimationFactoryInterface == nil then self.vectorAnimationFactoryInterface = nil end
    self.vectorExplosionGenerator = VectorExplosionGenerator.getInstance()
end


function IndependentVectorExplosionRotationAnimationFactory._jinit(self, vectorInfo, basicColor, vectorAnimationFactoryInterface)
    IndependentVectorExplosionRotationAnimationFactory._init_fields(self)
        self.vectorInfo = vectorInfo
        self.basicColor = basicColor
        self.vectorAnimationFactoryInterface = vectorAnimationFactoryInterface
        self:init()
    return self
end

function IndependentVectorExplosionRotationAnimationFactory.new(...)
    local self = setmetatable({}, IndependentVectorExplosionRotationAnimationFactory)
    IndependentVectorExplosionRotationAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function IndependentVectorExplosionRotationAnimationFactory:init()
        self.framePoints = VectorRotationGenerator.getInstance():getInstance(self.vectorInfo)
end


-- throws Exception
function IndependentVectorExplosionRotationAnimationFactory:getInstanceAnimation(animationInterface)
        local frame = 0
        if animationInterface ~= nil then
            local rotationAnimationInterface = animationInterface
            frame = rotationAnimationInterface:getFrame()
        end
        local points = self.vectorExplosionGenerator:getInstance(self.framePoints[frame + 1], 6, self.vectorExplosionGenerator.ROTATION)
        return self.vectorAnimationFactoryInterface:getInstance(points, self.basicColor)
end

return IndependentVectorExplosionRotationAnimationFactory


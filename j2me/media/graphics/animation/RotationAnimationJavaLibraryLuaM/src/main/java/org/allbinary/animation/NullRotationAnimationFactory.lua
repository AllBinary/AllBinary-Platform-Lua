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

local NullRotationAnimationFactory = {}
package.loaded["org.allbinary.animation.NullRotationAnimationFactory"] = NullRotationAnimationFactory

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

local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullRotationAnimation2 = java_lazy("org.allbinary.animation.NullRotationAnimation2")
local RotationAnimation = java_lazy("org.allbinary.animation.RotationAnimation")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table NullRotationAnimationFactory is declared before the requires
NullRotationAnimationFactory.__index = NullRotationAnimationFactory
NullRotationAnimationFactory.className = "NullRotationAnimationFactory"
NullRotationAnimationFactory.javaClassName = "org.allbinary.animation.NullRotationAnimationFactory"
NullRotationAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface ProceduralAnimationInterfaceFactoryInterface "
NullRotationAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface} end

function NullRotationAnimationFactory:_init_fields()
    self.NULL_ROTATION_ANIMATION_ARRAY = java_new_array(nil, 0)
    self.NULL_ANIMATION = NullRotationAnimation2.new()
end


function NullRotationAnimationFactory._jinit(self)
    NullRotationAnimationFactory._init_fields(self)
    return self
end

function NullRotationAnimationFactory.new(...)
    local self = setmetatable({}, NullRotationAnimationFactory)
    NullRotationAnimationFactory._jinit(self, ...)
    return self
end


function NullRotationAnimationFactory.getFactoryInstance()
        return NullRotationAnimationFactory.NULL_ROTATION_ANIMATION_FACTORY
end


function NullRotationAnimationFactory:getInstance(instanceId)
        return self.NULL_ANIMATION
end


-- throws Exception
function NullRotationAnimationFactory:getInstanceAnimation(animationInterface)
        return self.NULL_ANIMATION
end


function NullRotationAnimationFactory:setInitialScale(scaleProperties)
end

NullRotationAnimationFactory.NULL_ROTATION_ANIMATION_FACTORY = NullRotationAnimationFactory.new()

return NullRotationAnimationFactory


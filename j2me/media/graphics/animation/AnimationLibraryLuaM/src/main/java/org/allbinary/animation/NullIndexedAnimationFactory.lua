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

local NullIndexedAnimationFactory = {}
package.loaded["org.allbinary.animation.NullIndexedAnimationFactory"] = NullIndexedAnimationFactory

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
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local NullIndexedAnimationInner = java_lazy("org.allbinary.animation.NullIndexedAnimationInner")

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

-- class table NullIndexedAnimationFactory is declared before the requires
NullIndexedAnimationFactory.__index = NullIndexedAnimationFactory
NullIndexedAnimationFactory.className = "NullIndexedAnimationFactory"
NullIndexedAnimationFactory.javaClassName = "org.allbinary.animation.NullIndexedAnimationFactory"
NullIndexedAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface ProceduralAnimationInterfaceFactoryInterface "
NullIndexedAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface} end

function NullIndexedAnimationFactory:_init_fields()
    self.NULL_ANIMATION = NullIndexedAnimationInner.new()
end


function NullIndexedAnimationFactory._jinit(self)
    NullIndexedAnimationFactory._init_fields(self)
    return self
end

function NullIndexedAnimationFactory.new(...)
    local self = setmetatable({}, NullIndexedAnimationFactory)
    NullIndexedAnimationFactory._jinit(self, ...)
    return self
end


function NullIndexedAnimationFactory.getFactoryInstance()
        return NullIndexedAnimationFactory.NULL_INDEXED_ANIMATION_FACTORY
end


-- throws Exception
function NullIndexedAnimationFactory:getInstance(instanceId)
        return self.NULL_ANIMATION
end


-- throws Exception
function NullIndexedAnimationFactory:getInstanceAnimation(animationInterface)
        return self.NULL_ANIMATION
end


function NullIndexedAnimationFactory:setInitialScale(scaleProperties)
end

NullIndexedAnimationFactory.NULL_INDEXED_ANIMATION_ARRAY = java_new_array(nil, 0)
NullIndexedAnimationFactory.NULL_INDEXED_ANIMATION_FACTORY = NullIndexedAnimationFactory.new()

return NullIndexedAnimationFactory


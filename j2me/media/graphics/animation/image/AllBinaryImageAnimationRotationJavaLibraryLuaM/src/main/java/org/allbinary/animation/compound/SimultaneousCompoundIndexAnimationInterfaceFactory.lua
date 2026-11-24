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
-- package org.allbinary.animation.compound

local SimultaneousCompoundIndexAnimationInterfaceFactory = {}
package.loaded["org.allbinary.animation.compound.SimultaneousCompoundIndexAnimationInterfaceFactory"] = SimultaneousCompoundIndexAnimationInterfaceFactory

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
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local SimultaneousCompoundIndexAnimation = java_lazy("org.allbinary.animation.compound.SimultaneousCompoundIndexAnimation")

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

-- class table SimultaneousCompoundIndexAnimationInterfaceFactory is declared before the requires
SimultaneousCompoundIndexAnimationInterfaceFactory.__index = SimultaneousCompoundIndexAnimationInterfaceFactory
SimultaneousCompoundIndexAnimationInterfaceFactory.className = "SimultaneousCompoundIndexAnimationInterfaceFactory"
SimultaneousCompoundIndexAnimationInterfaceFactory.javaClassName = "org.allbinary.animation.compound.SimultaneousCompoundIndexAnimationInterfaceFactory"
SimultaneousCompoundIndexAnimationInterfaceFactory.java_implements = " AnimationInterfaceFactoryInterface "
SimultaneousCompoundIndexAnimationInterfaceFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function SimultaneousCompoundIndexAnimationInterfaceFactory:_init_fields()
    if self.basicAnimationInterfaceFactoryInterfaceArray == nil then self.basicAnimationInterfaceFactoryInterfaceArray = nil end
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function SimultaneousCompoundIndexAnimationInterfaceFactory._jinit(self, basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory)
    SimultaneousCompoundIndexAnimationInterfaceFactory._init_fields(self)
        self.basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end

function SimultaneousCompoundIndexAnimationInterfaceFactory.new(...)
    local self = setmetatable({}, SimultaneousCompoundIndexAnimationInterfaceFactory)
    SimultaneousCompoundIndexAnimationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function SimultaneousCompoundIndexAnimationInterfaceFactory:getInstance(instanceId)
        local size = (self.basicAnimationInterfaceFactoryInterfaceArray.n or #self.basicAnimationInterfaceFactoryInterfaceArray)
        local animationInterfaceArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            animationInterfaceArray[index + 1] = self.basicAnimationInterfaceFactoryInterfaceArray[index + 1]:getInstance(instanceId)
        end
        return self:getOrCreate(animationInterfaceArray)
end


function SimultaneousCompoundIndexAnimationInterfaceFactory:getOrCreate(animationInterfaceArray)
        return SimultaneousCompoundIndexAnimation.new(animationInterfaceArray, self.animationBehaviorFactory:getOrCreateInstance())
end


function SimultaneousCompoundIndexAnimationInterfaceFactory:getBasicAnimationInterfaceFactoryInterfaceArray()
        return self.basicAnimationInterfaceFactoryInterfaceArray
end


function SimultaneousCompoundIndexAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return SimultaneousCompoundIndexAnimationInterfaceFactory


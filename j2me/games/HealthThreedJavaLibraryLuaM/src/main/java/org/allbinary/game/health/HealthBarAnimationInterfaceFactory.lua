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
-- package org.allbinary.game.health

local HealthBarAnimationInterfaceFactory = {}
package.loaded["org.allbinary.game.health.HealthBarAnimationInterfaceFactory"] = HealthBarAnimationInterfaceFactory

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
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local HealthBarAnimation = java_lazy("org.allbinary.game.health.HealthBarAnimation")
local HealthBarThreedAnimation = java_lazy("org.allbinary.game.health.HealthBarThreedAnimation")

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

-- class table HealthBarAnimationInterfaceFactory is declared before the requires
HealthBarAnimationInterfaceFactory.__index = HealthBarAnimationInterfaceFactory
HealthBarAnimationInterfaceFactory.className = "HealthBarAnimationInterfaceFactory"
HealthBarAnimationInterfaceFactory.javaClassName = "org.allbinary.game.health.HealthBarAnimationInterfaceFactory"
HealthBarAnimationInterfaceFactory.java_implements = " AnimationInterfaceFactoryInterface ProceduralAnimationInterfaceFactoryInterface "
HealthBarAnimationInterfaceFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface} end


function HealthBarAnimationInterfaceFactory._jinit(self)
    return self
end

function HealthBarAnimationInterfaceFactory.new(...)
    local self = setmetatable({}, HealthBarAnimationInterfaceFactory)
    HealthBarAnimationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function HealthBarAnimationInterfaceFactory:getInstanceByLocation(layerInterface, location)
        return HealthBarThreedAnimation.new(layerInterface, location)
end


-- throws Exception
function HealthBarAnimationInterfaceFactory:getInstance(instanceId)
        return nil
end


-- throws Exception
function HealthBarAnimationInterfaceFactory:getInstanceAnimation(animationInterface)
        return nil
end


function HealthBarAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return HealthBarAnimationInterfaceFactory


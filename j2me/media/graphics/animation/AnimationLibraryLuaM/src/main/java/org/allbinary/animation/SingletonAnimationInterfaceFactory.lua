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

local SingletonAnimationInterfaceFactory = {}
package.loaded["org.allbinary.animation.SingletonAnimationInterfaceFactory"] = SingletonAnimationInterfaceFactory

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

-- class table SingletonAnimationInterfaceFactory is declared before the requires
SingletonAnimationInterfaceFactory.__index = SingletonAnimationInterfaceFactory
SingletonAnimationInterfaceFactory.className = "SingletonAnimationInterfaceFactory"
SingletonAnimationInterfaceFactory.javaClassName = "org.allbinary.animation.SingletonAnimationInterfaceFactory"
SingletonAnimationInterfaceFactory.java_implements = " AnimationInterfaceFactoryInterface ProceduralAnimationInterfaceFactoryInterface "
SingletonAnimationInterfaceFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface} end

function SingletonAnimationInterfaceFactory:_init_fields()
    if self.animationInterface == nil then self.animationInterface = nil end
end


function SingletonAnimationInterfaceFactory._jinit(self, animationInterface)
    SingletonAnimationInterfaceFactory._init_fields(self)
        self.animationInterface = animationInterface
    return self
end

function SingletonAnimationInterfaceFactory.new(...)
    local self = setmetatable({}, SingletonAnimationInterfaceFactory)
    SingletonAnimationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function SingletonAnimationInterfaceFactory:getInstance(instanceId)
        return self.animationInterface
end


-- throws Exception
function SingletonAnimationInterfaceFactory:getInstanceAnimation(animationInterface)
        return self.animationInterface
end


function SingletonAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return SingletonAnimationInterfaceFactory


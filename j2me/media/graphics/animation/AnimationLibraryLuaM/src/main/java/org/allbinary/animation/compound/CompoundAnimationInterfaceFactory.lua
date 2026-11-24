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

local CompoundAnimationInterfaceFactory = {}
package.loaded["org.allbinary.animation.compound.CompoundAnimationInterfaceFactory"] = CompoundAnimationInterfaceFactory

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
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")

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

-- class table CompoundAnimationInterfaceFactory is declared before the requires
CompoundAnimationInterfaceFactory.__index = CompoundAnimationInterfaceFactory
CompoundAnimationInterfaceFactory.className = "CompoundAnimationInterfaceFactory"
CompoundAnimationInterfaceFactory.javaClassName = "org.allbinary.animation.compound.CompoundAnimationInterfaceFactory"
CompoundAnimationInterfaceFactory.java_implements = " AnimationInterfaceFactoryInterface "
CompoundAnimationInterfaceFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function CompoundAnimationInterfaceFactory:_init_fields()
    if self.basicAnimationInterfaceFactoryInterfaceArrayP == nil then self.basicAnimationInterfaceFactoryInterfaceArrayP = nil end
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function CompoundAnimationInterfaceFactory._jinit(self, basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory)
    CompoundAnimationInterfaceFactory._init_fields(self)
        self.basicAnimationInterfaceFactoryInterfaceArrayP = basicAnimationInterfaceFactoryInterfaceArray
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end

function CompoundAnimationInterfaceFactory.new(...)
    local self = setmetatable({}, CompoundAnimationInterfaceFactory)
    CompoundAnimationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function CompoundAnimationInterfaceFactory:getInstance(instanceId)
        local size = (self.basicAnimationInterfaceFactoryInterfaceArrayP.n or #self.basicAnimationInterfaceFactoryInterfaceArrayP)
        local animationInterfaceArray = self:createArray(size)
        for index = 0, size - 1 do
            animationInterfaceArray[index + 1] = self.basicAnimationInterfaceFactoryInterfaceArrayP[index + 1]:getInstance(instanceId)
        end
        return self:createAnimation(animationInterfaceArray)
end


function CompoundAnimationInterfaceFactory:createArray(size)
        return NullAnimationFactory.getFactoryInstance().EMPTY_ARRAY
end


function CompoundAnimationInterfaceFactory:createAnimation(animationInterfaceArray)
        return NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function CompoundAnimationInterfaceFactory:getBasicAnimationInterfaceFactoryInterfaceArray()
        return self.basicAnimationInterfaceFactoryInterfaceArrayP
end


function CompoundAnimationInterfaceFactory:setInitialScale(scaleProperties)
        local size = (self.basicAnimationInterfaceFactoryInterfaceArrayP.n or #self.basicAnimationInterfaceFactoryInterfaceArrayP)
        for index = 0, size - 1 do
            self.basicAnimationInterfaceFactoryInterfaceArrayP[index + 1]:setInitialScale(scaleProperties)
        end
end

return CompoundAnimationInterfaceFactory


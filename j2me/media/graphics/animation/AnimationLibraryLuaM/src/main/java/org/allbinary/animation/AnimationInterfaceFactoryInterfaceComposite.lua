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

local AnimationInterfaceFactoryInterfaceComposite = {}
package.loaded["org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite"] = AnimationInterfaceFactoryInterfaceComposite

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
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")

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

-- class table AnimationInterfaceFactoryInterfaceComposite is declared before the requires
AnimationInterfaceFactoryInterfaceComposite.__index = AnimationInterfaceFactoryInterfaceComposite
AnimationInterfaceFactoryInterfaceComposite.className = "AnimationInterfaceFactoryInterfaceComposite"
AnimationInterfaceFactoryInterfaceComposite.javaClassName = "org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite"
AnimationInterfaceFactoryInterfaceComposite.java_implements = " AnimationInterfaceFactoryInterface "
AnimationInterfaceFactoryInterfaceComposite.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function AnimationInterfaceFactoryInterfaceComposite:_init_fields()
    if self.animationInterfaceFactoryInterfaceArray == nil then self.animationInterfaceFactoryInterfaceArray = nil end
end


function AnimationInterfaceFactoryInterfaceComposite._jinit(self, basicAnimationInterfaceFactoryInterfaceArray)
    AnimationInterfaceFactoryInterfaceComposite._init_fields(self)
        self.animationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray
    return self
end

function AnimationInterfaceFactoryInterfaceComposite.new(...)
    local self = setmetatable({}, AnimationInterfaceFactoryInterfaceComposite)
    AnimationInterfaceFactoryInterfaceComposite._jinit(self, ...)
    return self
end


-- throws Exception
function AnimationInterfaceFactoryInterfaceComposite:getInstance(instanceId)
        return NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function AnimationInterfaceFactoryInterfaceComposite:getAnimationInterfaceFactoryInterfaceArray()
        return self.animationInterfaceFactoryInterfaceArray
end


function AnimationInterfaceFactoryInterfaceComposite:setInitialScale(scaleProperties)
end

return AnimationInterfaceFactoryInterfaceComposite


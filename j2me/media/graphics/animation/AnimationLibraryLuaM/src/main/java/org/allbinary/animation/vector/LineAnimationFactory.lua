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
-- package org.allbinary.animation.vector

local LineAnimationFactory = {}
package.loaded["org.allbinary.animation.vector.LineAnimationFactory"] = LineAnimationFactory

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
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local LineAnimation = java_lazy("org.allbinary.animation.vector.LineAnimation")

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

-- class table LineAnimationFactory is declared before the requires
LineAnimationFactory.__index = LineAnimationFactory
LineAnimationFactory.className = "LineAnimationFactory"
LineAnimationFactory.javaClassName = "org.allbinary.animation.vector.LineAnimationFactory"
LineAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
LineAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function LineAnimationFactory:_init_fields()
    if self.basicColor == nil then self.basicColor = nil end
end


function LineAnimationFactory._jinit(self, basicColor)
    LineAnimationFactory._init_fields(self)
        self.basicColor = basicColor
    return self
end

function LineAnimationFactory.new(...)
    local self = setmetatable({}, LineAnimationFactory)
    LineAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function LineAnimationFactory:getInstance(instanceId)
        return LineAnimation.new(self.basicColor)
end


function LineAnimationFactory:setInitialScale(scaleProperties)
end

return LineAnimationFactory


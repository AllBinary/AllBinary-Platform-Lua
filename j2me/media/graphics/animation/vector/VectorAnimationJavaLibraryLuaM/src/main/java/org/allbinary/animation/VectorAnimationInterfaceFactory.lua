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

local VectorAnimationInterfaceFactory = {}
package.loaded["org.allbinary.animation.VectorAnimationInterfaceFactory"] = VectorAnimationInterfaceFactory

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
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")

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

-- class table VectorAnimationInterfaceFactory is declared before the requires
VectorAnimationInterfaceFactory.__index = VectorAnimationInterfaceFactory
VectorAnimationInterfaceFactory.className = "VectorAnimationInterfaceFactory"
VectorAnimationInterfaceFactory.javaClassName = "org.allbinary.animation.VectorAnimationInterfaceFactory"
VectorAnimationInterfaceFactory.java_implements = " AnimationInterfaceFactoryInterface "
VectorAnimationInterfaceFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function VectorAnimationInterfaceFactory:_init_fields()
    if self.currentPoints == nil then self.currentPoints = nil end
    self.basicColor = BasicColorFactory.getInstance().WHITE
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function VectorAnimationInterfaceFactory._jinit(self, currentPoints, basicColor, animationBehaviorFactory)
    VectorAnimationInterfaceFactory._init_fields(self)
        self.currentPoints = currentPoints
        self:setBasicColorP(basicColor)
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end

function VectorAnimationInterfaceFactory.new(...)
    local self = setmetatable({}, VectorAnimationInterfaceFactory)
    VectorAnimationInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function VectorAnimationInterfaceFactory:getInstance(instanceId)
        return VectorAnimation.new(self.currentPoints, self:getBasicColorP(), self.animationBehaviorFactory:getOrCreateInstance())
end


function VectorAnimationInterfaceFactory:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function VectorAnimationInterfaceFactory:getBasicColorP()
        return self.basicColor
end


function VectorAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return VectorAnimationInterfaceFactory


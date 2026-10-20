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

local Animation = require("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LineAnimationFactory = {}
LineAnimationFactory.__index = LineAnimationFactory
LineAnimationFactory.className = "LineAnimationFactory"

function LineAnimationFactory:_init_fields()
    self.basicColor = nil
end


function LineAnimationFactory.new(basicColor)
    local self = setmetatable({}, LineAnimationFactory)
    self:_init_fields()
        self.basicColor = basicColor
    return self
end


-- throws Exception
function LineAnimationFactory:getInstance(instanceId)
        return LineAnimation.new(self.basicColor)
end


function LineAnimationFactory:setInitialScale(scaleProperties)
end

return LineAnimationFactory


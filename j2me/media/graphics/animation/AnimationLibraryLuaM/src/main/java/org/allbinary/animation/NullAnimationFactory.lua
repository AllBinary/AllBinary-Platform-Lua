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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullAnimationFactory = {}
NullAnimationFactory.__index = NullAnimationFactory
NullAnimationFactory.className = "NullAnimationFactory"

function NullAnimationFactory:_init_fields()
    self.NULL_ANIMATION = (function()
        local o = Animation.new and Animation.new() or setmetatable({}, {__index = Animation})
        

        function o:paintXY(graphics, x, y)
        end
        return o
    end)()
    self.EMPTY_ARRAY = java_new_array(nil, 0)
end


function NullAnimationFactory.new()
    local self = setmetatable({}, NullAnimationFactory)
    self:_init_fields()
    return self
end


function NullAnimationFactory.getFactoryInstance()
        return NullAnimationFactory.NULL_ANIMATION_FACTORY
end


function NullAnimationFactory:getInstance(instanceId)
        return self.NULL_ANIMATION
end


-- throws Exception
function NullAnimationFactory:getInstanceAnimation(animationInterface)
        return self.NULL_ANIMATION
end


function NullAnimationFactory:setInitialScale(scaleProperties)
end

NullAnimationFactory.NULL_NOT_FOR_USE_ANIMATION_FACTORY = NullAnimationFactory.new()
NullAnimationFactory.NULL_ANIMATION_FACTORY = NullAnimationFactory.new()

return NullAnimationFactory


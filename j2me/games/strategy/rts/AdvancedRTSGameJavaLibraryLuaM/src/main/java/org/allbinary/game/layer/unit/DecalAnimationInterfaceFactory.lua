-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.unit

local BasicGameResources = require("org.allbinary.game.layer.resources.BasicGameResources")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local NullRotationAnimationFactory = require("org.allbinary.animation.NullRotationAnimationFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DecalAnimationInterfaceFactory = {}
DecalAnimationInterfaceFactory.__index = DecalAnimationInterfaceFactory
DecalAnimationInterfaceFactory.className = "DecalAnimationInterfaceFactory"

function DecalAnimationInterfaceFactory.new()
    local self = setmetatable({}, DecalAnimationInterfaceFactory)
    return self
end


function DecalAnimationInterfaceFactory.getInstance()
        return DecalAnimationInterfaceFactory.instance
end


-- throws Exception
function DecalAnimationInterfaceFactory:getAnimationFactory(basicGameResources, basicColor)
        local animationInterfaceFactoryInterface = nil
        if basicColor == BasicColorFactory.getInstance().RED then
            animationInterfaceFactoryInterface = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(basicGameResources.RESOURCE)
        else
            animationInterfaceFactoryInterface = NullRotationAnimationFactory.getFactoryInstance()
        end
        return animationInterfaceFactoryInterface
end

DecalAnimationInterfaceFactory.instance = DecalAnimationInterfaceFactory.new()

return DecalAnimationInterfaceFactory


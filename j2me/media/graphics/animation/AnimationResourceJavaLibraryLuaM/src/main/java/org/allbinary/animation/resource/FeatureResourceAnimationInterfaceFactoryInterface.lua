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
-- package org.allbinary.animation.resource

local GameFeatureControlledInterface = require("org.allbinary.game.configuration.feature.GameFeatureControlledInterface")
local RectangleResourceFactoryInterface = require("org.allbinary.game.resource.RectangleResourceFactoryInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local ResourceAnimationInterfaceFactoryInterface = require("org.allbinary.animation.resource.ResourceAnimationInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local FeatureResourceAnimationInterfaceFactoryInterface = {}
FeatureResourceAnimationInterfaceFactoryInterface.__index = FeatureResourceAnimationInterfaceFactoryInterface
FeatureResourceAnimationInterfaceFactoryInterface.className = "FeatureResourceAnimationInterfaceFactoryInterface"
setmetatable(FeatureResourceAnimationInterfaceFactoryInterface, {__index = ResourceAnimationInterfaceFactoryInterface})


function FeatureResourceAnimationInterfaceFactoryInterface:getHashtable()
    error("abstract method getHashtable")
end

return FeatureResourceAnimationInterfaceFactoryInterface


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

local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local BasicAnimationInterfaceFactoryInterface = require("org.allbinary.animation.BasicAnimationInterfaceFactoryInterface")

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
local AnimationInterfaceFactoryInterface = {}
AnimationInterfaceFactoryInterface.__index = AnimationInterfaceFactoryInterface
AnimationInterfaceFactoryInterface.className = "AnimationInterfaceFactoryInterface"
setmetatable(AnimationInterfaceFactoryInterface, {__index = BasicAnimationInterfaceFactoryInterface})


-- throws Exception
function AnimationInterfaceFactoryInterface:getInstance(instanceId)
    error("abstract method getInstance")
end


function AnimationInterfaceFactoryInterface:setInitialScale(scaleProperties)
    error("abstract method setInitialScale")
end

return AnimationInterfaceFactoryInterface


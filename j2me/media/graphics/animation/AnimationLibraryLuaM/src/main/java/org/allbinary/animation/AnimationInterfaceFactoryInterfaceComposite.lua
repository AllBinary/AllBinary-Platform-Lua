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
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnimationInterfaceFactoryInterfaceComposite = {}
AnimationInterfaceFactoryInterfaceComposite.__index = AnimationInterfaceFactoryInterfaceComposite
AnimationInterfaceFactoryInterfaceComposite.className = "AnimationInterfaceFactoryInterfaceComposite"

function AnimationInterfaceFactoryInterfaceComposite:_init_fields()
    self.animationInterfaceFactoryInterfaceArray = nil
end


function AnimationInterfaceFactoryInterfaceComposite.new(basicAnimationInterfaceFactoryInterfaceArray)
    local self = setmetatable({}, AnimationInterfaceFactoryInterfaceComposite)
    self:_init_fields()
        self.animationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray
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


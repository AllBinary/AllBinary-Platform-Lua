-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.animation.image

-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AllBinaryJ2SEImageRotationAnimationFactory = require("org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimationFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryPlatformImageRotationAnimationFactory = {}
AllBinaryPlatformImageRotationAnimationFactory.__index = AllBinaryPlatformImageRotationAnimationFactory
AllBinaryPlatformImageRotationAnimationFactory.className = "AllBinaryPlatformImageRotationAnimationFactory"
setmetatable(AllBinaryPlatformImageRotationAnimationFactory, {__index = AllBinaryJ2SEImageRotationAnimationFactory})


function AllBinaryPlatformImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
    local self = setmetatable(AllBinaryJ2SEImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation), AllBinaryPlatformImageRotationAnimationFactory)
        -- super(...) made self above
    return self
end

return AllBinaryPlatformImageRotationAnimationFactory


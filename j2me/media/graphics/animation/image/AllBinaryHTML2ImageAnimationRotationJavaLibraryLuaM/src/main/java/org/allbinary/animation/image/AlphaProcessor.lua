-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local AlphaBaseProcessor = require("org.allbinary.animation.image.AlphaBaseProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AlphaProcessor = {}
AlphaProcessor.__index = AlphaProcessor
AlphaProcessor.className = "AlphaProcessor"
setmetatable(AlphaProcessor, {__index = AlphaBaseProcessor})

function AlphaProcessor.new()
    local self = setmetatable(AlphaBaseProcessor.new(), AlphaProcessor)
    return self
end


function AlphaProcessor.getInstance()
        return AlphaProcessor.instanceC
end


function AlphaProcessor:setAlpha(imageModifierUtil, originalImage, imageToShow, alpha)
        imageModifierUtil:setAlpha3(imageToShow, alpha)
end

AlphaProcessor.instanceC = AlphaProcessor.new()

return AlphaProcessor


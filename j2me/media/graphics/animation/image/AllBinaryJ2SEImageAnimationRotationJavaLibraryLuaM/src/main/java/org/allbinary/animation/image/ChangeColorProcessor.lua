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
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local ModifierBaseProcessor = require("org.allbinary.animation.image.ModifierBaseProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ChangeColorProcessor = {}
ChangeColorProcessor.__index = ChangeColorProcessor
ChangeColorProcessor.className = "ChangeColorProcessor"
setmetatable(ChangeColorProcessor, {__index = ModifierBaseProcessor})

function ChangeColorProcessor.new()
    local self = setmetatable(ModifierBaseProcessor.new(), ChangeColorProcessor)
    return self
end


function ChangeColorProcessor.getInstance()
        return ChangeColorProcessor.instanceC
end


function ChangeColorProcessor:updateColor(imageModifierUtil, originalImage, imageToShow, index, basicColor)
        imageModifierUtil:changeColor(originalImage, imageToShow, index, basicColor)
end

ChangeColorProcessor.instanceC = ChangeColorProcessor.new()

return ChangeColorProcessor


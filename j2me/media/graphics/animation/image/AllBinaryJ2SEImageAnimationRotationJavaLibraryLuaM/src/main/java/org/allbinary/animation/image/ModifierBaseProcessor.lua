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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ModifierBaseProcessor = {}
ModifierBaseProcessor.__index = ModifierBaseProcessor
ModifierBaseProcessor.className = "ModifierBaseProcessor"

function ModifierBaseProcessor.new()
    local self = setmetatable({}, ModifierBaseProcessor)
    return self
end


function ModifierBaseProcessor.getInstance()
        return ModifierBaseProcessor.instance
end


function ModifierBaseProcessor:updateColor(imageModifierUtil, originalImage, imageToShow, index, basicColor)
end


function ModifierBaseProcessor:updateAlpha(imageModifierUtil, originalImage, imageToShow, index, alpha)
end

ModifierBaseProcessor.instance = ModifierBaseProcessor.new()

return ModifierBaseProcessor


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
-- package org.allbinary.image

-- local Image = require("javax.microedition.lcdui.Image")
local AnimationFactoryInitializationVisitor = require("org.allbinary.animation.image.AnimationFactoryInitializationVisitor")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local ImageJ2MEScaleUtil = require("org.allbinary.media.image.ImageJ2MEScaleUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnimationFactoryImageScaleUtil = {}
AnimationFactoryImageScaleUtil.__index = AnimationFactoryImageScaleUtil
AnimationFactoryImageScaleUtil.className = "AnimationFactoryImageScaleUtil"

function AnimationFactoryImageScaleUtil:_init_fields()
    self.imageScaleUtil = ImageJ2MEScaleUtil.getInstance()
end

function AnimationFactoryImageScaleUtil.new()
    local self = setmetatable({}, AnimationFactoryImageScaleUtil)
    self:_init_fields()
    return self
end


function AnimationFactoryImageScaleUtil.getInstance()
        return AnimationFactoryImageScaleUtil.instance
end


-- throws Exception
function AnimationFactoryImageScaleUtil:createImage(image, width, height, scaleWidth, scaleHeight)
        local scaledImage = nil
        if scaleWidth ~= 0 and scaleHeight ~= 0 then
            local scaleX = ((scaleWidth + 0.0)) / ((width + 0.0))
            local scaleY = ((scaleHeight + 0.0)) / ((height + 0.0))
            if (scaleX == 1.0 and scaleY == 1.0) or (scaleX == 0.0 or scaleY == 0.0) then
                scaledImage = image
            else
                local scaledWidth = java_int((scaleX * (width + 0.0)))
                local scaledHeight = java_int((scaleY * (height + 0.0)))
                scaledImage = self.imageScaleUtil:scale(image, scaledWidth, scaledHeight)
            end
        else
            scaledImage = image
        end
        return scaledImage
end


-- throws Exception
function AnimationFactoryImageScaleUtil:processAdjust(baseImageAnimationFactory)
        local scaleProperties = baseImageAnimationFactory:getScalePropertiesP()
        if scaleProperties.scaleWidth ~= 0 and scaleProperties.scaleHeight ~= 0 then
            local animationFactoryInitializationVisitor = baseImageAnimationFactory:getAnimationFactoryInitializationVisitorP()
            local scaleX = ((scaleProperties.scaleWidth + 0.0)) / ((animationFactoryInitializationVisitor.width + 0.0))
            local scaleY = ((scaleProperties.scaleHeight + 0.0)) / ((animationFactoryInitializationVisitor.height + 0.0))
            if (scaleX == 1.0 and scaleY == 1.0) or (scaleX == 0.0 or scaleY == 0.0) then
            else
                animationFactoryInitializationVisitor.dx = java_int((animationFactoryInitializationVisitor.originalDx * scaleX))
                animationFactoryInitializationVisitor.dy = java_int((animationFactoryInitializationVisitor.originalDy * scaleY))
            end
        else
        end
end

AnimationFactoryImageScaleUtil.instance = AnimationFactoryImageScaleUtil.new()

return AnimationFactoryImageScaleUtil


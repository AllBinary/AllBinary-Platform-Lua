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
-- package org.allbinary.image.sprite

-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local SpriteFactory = require("org.allbinary.game.layer.SpriteFactory")
local OpenGLUtil = require("org.allbinary.graphics.opengles.OpenGLUtil")
local ImageCache = require("org.allbinary.image.ImageCache")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local OpenGLESImageExclusionUtil = require("org.allbinary.image.opengles.OpenGLESImageExclusionUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local J2SEMath = require("org.allbinary.logic.math.J2SEMath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ImageScaleUtil = require("org.allbinary.media.image.ImageScaleUtil")
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

local AnimationFactorySpriteScaleUtil = {}
AnimationFactorySpriteScaleUtil.__index = AnimationFactorySpriteScaleUtil
AnimationFactorySpriteScaleUtil.className = "AnimationFactorySpriteScaleUtil"

function AnimationFactorySpriteScaleUtil:_init_fields()
    self.imageCache = ImageCacheFactory.getInstance()
    self.imageScaleUtil = ImageScaleUtil.getInstance()
    self.openGLUtil = OpenGLUtil.getInstance()
    self.j2seMath = J2SEMath.getInstance()
    self.openGLESImageExclusionUtil = OpenGLESImageExclusionUtil.getInstance()
end

function AnimationFactorySpriteScaleUtil.new()
    local self = setmetatable({}, AnimationFactorySpriteScaleUtil)
    self:_init_fields()
    return self
end


function AnimationFactorySpriteScaleUtil.getInstance()
        return AnimationFactorySpriteScaleUtil.instance
end


-- throws Exception
function AnimationFactorySpriteScaleUtil:createImage(image, width, height, scaleWidth, scaleHeight)
        local spriteFactory = SpriteFactory.getInstance()
        local sprite = nil
        local scaledImage = nil
        if scaleWidth ~= 0 and scaleHeight ~= 0 then
            local scaleX = ((scaleWidth + 0.0)) / ((width + 0.0))
            local scaleY = ((scaleHeight + 0.0)) / ((height + 0.0))
            if (scaleX == 1.0 and scaleY == 1.0) or (scaleX == 0.0 or scaleY == 0.0) then
                scaledImage = self.openGLUtil:addImage(image)
                sprite = spriteFactory:createSprite(scaledImage, width, height)
            else
                if self.openGLESImageExclusionUtil:isCustomScaling(image) then
                    local width2 = self.j2seMath:round(((scaleWidth) + 0.0) - 0.5)
                    local height2 = self.j2seMath:round(((scaleHeight) + 0.0) - 0.5)
                    local multiplesOf16Width = java_idiv(width2, 16)
                    local by16Width = multiplesOf16Width * 16
                    scaleX = ((by16Width + 0.0)) / (width + 0.0)
                    local multiplesOf16Height = java_idiv(height2, 16)
                    local by16Height = multiplesOf16Height * 16
                    scaleY = ((by16Height + 0.0)) / (height + 0.0)
                    if scaleWidth < width then
                        scaleX = scaleX * 2.35
                    end
                    if scaleHeight < height then
                        scaleY = scaleY * 2.35
                    end
                end
                scaledImage = self.imageScaleUtil:createImage2(self.imageCache, image, scaleX, 1.0, scaleY, 1.0, true)
                sprite = spriteFactory:createSprite(scaledImage, java_int(((width + 0.0) * scaleX)), java_int(((height + 0.0) * scaleY)))
            end
        else
            scaledImage = self.openGLUtil:addImage(image)
            sprite = spriteFactory:createSprite(scaledImage, width, height)
        end
        return sprite
end

AnimationFactorySpriteScaleUtil.instance = AnimationFactorySpriteScaleUtil.new()

return AnimationFactorySpriteScaleUtil


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
-- package org.allbinary.animation.image.sprite

-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
-- local Player = require("javax.microedition.media.Player")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local CaptionIndexedAnimation = require("org.allbinary.animation.caption.CaptionIndexedAnimation")
local ImageAnimation = require("org.allbinary.animation.image.ImageAnimation")
local BasicColorUtil = require("org.allbinary.graphics.color.BasicColorUtil")
local AnimationFactoryImageScaleUtil = require("org.allbinary.image.AnimationFactoryImageScaleUtil")
local AnimationFactorySpriteScaleUtil = require("org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local Sound = require("org.allbinary.media.audio.Sound")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageCaptionIndexedAnimationFactory = {}
ImageCaptionIndexedAnimationFactory.__index = ImageCaptionIndexedAnimationFactory
ImageCaptionIndexedAnimationFactory.className = "ImageCaptionIndexedAnimationFactory"

function ImageCaptionIndexedAnimationFactory:_init_fields()
    self.animationFactoryImageScaleUtil = AnimationFactoryImageScaleUtil.getInstance()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
    self.captionImage = nil
    self.spriteMovieImage = nil
    self.frameWidth = nil
    self.frameHeight = nil
    self.captionDx = nil
    self.captionDy = nil
    self.dx = nil
    self.dy = nil
    self.time = nil
    self.soundInterface = nil
    self.scaleProperties = ScaleProperties.instance
    self.animationBehaviorFactory = nil
end


function ImageCaptionIndexedAnimationFactory.new(captionImage, spriteMovieImage, soundInterface, frameWidth, frameHeight, captionDx, captionDy, dx, dy, time, animationBehaviorFactory)
    local self = setmetatable({}, ImageCaptionIndexedAnimationFactory)
    self:_init_fields()
        if animationBehaviorFactory == AnimationBehaviorFactory.getInstance() then
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", self)
        end
        self.captionImage = captionImage
        self.spriteMovieImage = spriteMovieImage
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
        self.captionDx = captionDx
        self.captionDy = captionDy
        self.dx = dx
        self.dy = dy
        self.time = time
        self.soundInterface = soundInterface
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end


-- throws Exception
function ImageCaptionIndexedAnimationFactory:getInstance(instanceId)
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(self.captionImage, self.captionImage:getWidth(), self.captionImage:getHeight(), self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local animationInterface = ImageAnimation.new(scaledImage, self.animationBehaviorFactory:getOrCreateInstance())
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self.spriteMovieImage, self.frameWidth, self.frameHeight, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local movieIndexedAnimationInterface = SpriteIndexedAnimation.new(sprite, self.spriteMovieImage, BasicColorUtil.getInstance().ZERO_ARRAY, self.animationBehaviorFactory:getOrCreateInstance())
        local player = self.soundInterface:getPlayerP()
        if player == nil then
            error(java_exception("Exception", "Sound Was not Initialized"), 0)
        end
        return CaptionIndexedAnimation.new(animationInterface, movieIndexedAnimationInterface, player, self.captionDx, self.captionDy, self.dx, self.dy, self.time, self.animationBehaviorFactory:getOrCreateInstance())
end


function ImageCaptionIndexedAnimationFactory:setInitialScale(scaleProperties)
        self.scaleProperties = scaleProperties
end

return ImageCaptionIndexedAnimationFactory


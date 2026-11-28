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

local ImageCaptionIndexedAnimationFactory = {}
package.loaded["org.allbinary.animation.image.sprite.ImageCaptionIndexedAnimationFactory"] = ImageCaptionIndexedAnimationFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Image = java_lazy("javax.microedition.lcdui.Image")
local Sprite = java_lazy("javax.microedition.lcdui.game.Sprite")
local Player = java_lazy("javax.microedition.media.Player")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local CaptionIndexedAnimation = java_lazy("org.allbinary.animation.caption.CaptionIndexedAnimation")
local ImageAnimation = java_lazy("org.allbinary.animation.image.ImageAnimation")
local BasicColorUtil = java_lazy("org.allbinary.graphics.color.BasicColorUtil")
local AnimationFactoryImageScaleUtil = java_lazy("org.allbinary.image.AnimationFactoryImageScaleUtil")
local AnimationFactorySpriteScaleUtil = java_lazy("org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local SpriteIndexedAnimation = java_lazy("org.allbinary.animation.image.sprite.SpriteIndexedAnimation")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ImageCaptionIndexedAnimationFactory is declared before the requires
ImageCaptionIndexedAnimationFactory.__index = ImageCaptionIndexedAnimationFactory
ImageCaptionIndexedAnimationFactory.className = "ImageCaptionIndexedAnimationFactory"
ImageCaptionIndexedAnimationFactory.javaClassName = "org.allbinary.animation.image.sprite.ImageCaptionIndexedAnimationFactory"
ImageCaptionIndexedAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
ImageCaptionIndexedAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function ImageCaptionIndexedAnimationFactory:_init_fields()
    self.animationFactoryImageScaleUtil = AnimationFactoryImageScaleUtil.getInstance()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
    if self.captionImage == nil then self.captionImage = nil end
    if self.spriteMovieImage == nil then self.spriteMovieImage = nil end
    if self.frameWidth == nil then self.frameWidth = 0 end
    if self.frameHeight == nil then self.frameHeight = 0 end
    if self.captionDx == nil then self.captionDx = 0 end
    if self.captionDy == nil then self.captionDy = 0 end
    if self.dx == nil then self.dx = 0 end
    if self.dy == nil then self.dy = 0 end
    if self.time == nil then self.time = 0 end
    if self.soundInterface == nil then self.soundInterface = nil end
    self.scaleProperties = ScaleProperties.instance_f
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
end


function ImageCaptionIndexedAnimationFactory._jinit(self, captionImage, spriteMovieImage, soundInterface, frameWidth, frameHeight, captionDx, captionDy, dx, dy, time, animationBehaviorFactory)
    ImageCaptionIndexedAnimationFactory._init_fields(self)
        if rawequal(animationBehaviorFactory, AnimationBehaviorFactory.getInstance()) then
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

function ImageCaptionIndexedAnimationFactory.new(...)
    local self = setmetatable({}, ImageCaptionIndexedAnimationFactory)
    ImageCaptionIndexedAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function ImageCaptionIndexedAnimationFactory:getInstance(instanceId)
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(self.captionImage, self.captionImage:getWidth(), self.captionImage:getHeight(), self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local animationInterface = ImageAnimation.new(scaledImage, self.animationBehaviorFactory:getOrCreateInstance())
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self.spriteMovieImage, self.frameWidth, self.frameHeight, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local movieIndexedAnimationInterface = SpriteIndexedAnimation.new(sprite, self.spriteMovieImage, BasicColorUtil.getInstance().ZERO_ARRAY, self.animationBehaviorFactory:getOrCreateInstance())
        local player = self.soundInterface:getPlayerP()
        if rawequal(player, nil) then
            error(require("java.lang.Exception").new("Sound Was not Initialized"), 0)
        end
        return CaptionIndexedAnimation.new(animationInterface, movieIndexedAnimationInterface, player, self.captionDx, self.captionDy, self.dx, self.dy, self.time, self.animationBehaviorFactory:getOrCreateInstance())
end


function ImageCaptionIndexedAnimationFactory:setInitialScale(scaleProperties)
        self.scaleProperties = scaleProperties
end

return ImageCaptionIndexedAnimationFactory


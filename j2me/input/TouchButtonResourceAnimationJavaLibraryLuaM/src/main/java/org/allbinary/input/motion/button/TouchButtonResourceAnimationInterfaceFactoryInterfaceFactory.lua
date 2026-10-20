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
-- package org.allbinary.input.motion.button

-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local OneRowSpriteIndexedAnimationFactory = require("org.allbinary.animation.image.sprite.OneRowSpriteIndexedAnimationFactory")
local BaseResourceAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local ImageCompleteUtil = require("org.allbinary.media.image.ImageCompleteUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory = {}
TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.__index = TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory
TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.className = "TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory"
setmetatable(TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory, {__index = BaseResourceAnimationInterfaceFactoryInterfaceFactory})


function TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.createFactory()
        return TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.new("TouchButton Animations")
end


function TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.new(name)
    local self = setmetatable(BaseResourceAnimationInterfaceFactoryInterfaceFactory.new(name, StdUtil.getInstance():createHashtable(), StdUtil.getInstance():createHashtable(), StdUtil.getInstance():createHashtable()), TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory:init(level)
        self:initImageCache(ImageCacheFactory.getInstance(), level)
end


-- throws Exception
function TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory:initImageCache(imageCache, level)
        if self:isInitialized() then
            return
        end
        local portion = 140
        local loadingString = tostring(StringMaker.new():append(tostring(self)):append(" Loading: "))
        local index = 0
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        local touchButtonBlankResource = TouchButtonBlankResource.getInstance()
        local touchButtonGenericActionResource = TouchButtonGenericActionResource.getInstance()
        local touchButtonStartResource = TouchButtonStartResource.getInstance()
        local touchButtonUpResource = TouchButtonUpResource.getInstance()
        local touchButtonDownResource = TouchButtonDownResource.getInstance()
        local touchButtonTurnLeftResource = TouchButtonTurnLeftResource.getInstance()
        local touchButtonTurnRightResource = TouchButtonTurnRightResource.getInstance()
        local touchButtonStrafeLeftResource = TouchButtonStrafeLeftResource.getInstance()
        local touchButtonStrafeRightResource = TouchButtonStrafeRightResource.getInstance()
        local touchButtonBlankResourceImage = imageCache:getWithKey(touchButtonBlankResource.RESOURCE)
        local touchButtonGenericActionResourceImage = imageCache:getWithKey(touchButtonGenericActionResource.RESOURCE)
        local touchButtonStartResourceImage = imageCache:getWithKey(touchButtonStartResource.RESOURCE)
        local touchButtonUpResourceImage = imageCache:getWithKey(touchButtonUpResource.RESOURCE)
        local touchButtonDownResourceImage = imageCache:getWithKey(touchButtonDownResource.RESOURCE)
        local touchButtonTurnLeftResourceImage = imageCache:getWithKey(touchButtonTurnLeftResource.RESOURCE)
        local touchButtonTurnRightResourceImage = imageCache:getWithKey(touchButtonTurnRightResource.RESOURCE)
        local touchButtonStrafeLeftResourceImage = imageCache:getWithKey(touchButtonStrafeLeftResource.RESOURCE)
        local touchButtonStrafeRightResourceImage = imageCache:getWithKey(touchButtonStrafeRightResource.RESOURCE)
        local nullAnimationFactory = NullAnimationFactory.getFactoryInstance()
        if OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan() then
            imageCache:getWithKey(TouchButtonStartResource.getInstance().HINT)
        end
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        local imageCompleteUtil = ImageCompleteUtil.getInstance()
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonBlankResourceImage, touchButtonBlankResource.RESOURCE)
        self:add(touchButtonBlankResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonBlankResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonBlankResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonGenericActionResourceImage, touchButtonGenericActionResource.RESOURCE)
        self:add(touchButtonGenericActionResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonGenericActionResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonGenericActionResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonStartResourceImage, touchButtonStartResource.RESOURCE)
        self:add(touchButtonStartResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStartResourceImage, AnimationBehaviorFactory.getInstance()))
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonUpResourceImage, touchButtonUpResource.RESOURCE)
        self:add(touchButtonUpResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonUpResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonUpResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonDownResourceImage, touchButtonDownResource.RESOURCE)
        self:add(touchButtonDownResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonDownResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonDownResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonTurnLeftResourceImage, touchButtonTurnLeftResource.RESOURCE)
        self:add(touchButtonTurnLeftResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonTurnLeftResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonTurnLeftResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonTurnRightResourceImage, touchButtonTurnRightResource.RESOURCE)
        self:add(touchButtonTurnRightResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonTurnRightResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonTurnRightResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonStrafeLeftResourceImage, touchButtonStrafeLeftResource.RESOURCE)
        self:add(touchButtonStrafeLeftResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStrafeLeftResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonStrafeLeftResource.HINT, nullAnimationFactory)
        progressCanvas:addPortion(portion, loadingString, (function() local value = index index = value + 1 return value end)())
        imageCompleteUtil:waitForImage(touchButtonStrafeRightResourceImage, touchButtonStrafeRightResource.RESOURCE)
        self:add(touchButtonStrafeRightResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStrafeRightResourceImage, AnimationBehaviorFactory.getInstance()))
        self:add(touchButtonStrafeRightResource.HINT, nullAnimationFactory)
        if OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan() then
            local touchButtonStartHintResource = imageCache:getWithKey(TouchButtonStartResource.getInstance().HINT)
            self:add(touchButtonStartResource.HINT, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStartHintResource, AnimationBehaviorFactory.getInstance()))
        else
            self:add(touchButtonStartResource.HINT, nullAnimationFactory)
        end
        BaseResourceAnimationInterfaceFactoryInterfaceFactory.init(self, level)
end


function TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory:isLoadingLevel(level)
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        if level == resourceLoadingLevelFactory.LOAD_TOUCH:getLevel() then
            return true
        else
            return BaseResourceAnimationInterfaceFactoryInterfaceFactory.isLoadingLevel(self, level)
        end
end


function TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory:isFeature()
        if not Features.getInstance():isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            return true
        else
            return false
        end
end

return TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory


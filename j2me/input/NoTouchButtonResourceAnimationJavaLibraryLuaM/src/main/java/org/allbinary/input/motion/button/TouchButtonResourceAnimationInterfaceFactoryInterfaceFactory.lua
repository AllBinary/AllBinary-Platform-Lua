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

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")

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


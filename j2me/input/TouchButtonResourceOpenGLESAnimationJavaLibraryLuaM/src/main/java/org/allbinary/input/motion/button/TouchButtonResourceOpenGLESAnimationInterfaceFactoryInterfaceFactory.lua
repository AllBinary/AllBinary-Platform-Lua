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

local Features = require("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLImageCacheFactory = require("org.allbinary.image.opengles.OpenGLImageCacheFactory")
local TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.input.motion.button.TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory = {}
TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory.__index = TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory
TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory.className = "TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory"
setmetatable(TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory, {__index = TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory})


function TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory.new()
    local self = setmetatable(TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.new("OpenGL TouchButton Animations"), TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory:init(level)
        TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.initImageCache(self, OpenGLImageCacheFactory.getInstance(), level)
end


function TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory:isFeature()
        if Features.getInstance():isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            return true
        else
            return false
        end
end

return TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory


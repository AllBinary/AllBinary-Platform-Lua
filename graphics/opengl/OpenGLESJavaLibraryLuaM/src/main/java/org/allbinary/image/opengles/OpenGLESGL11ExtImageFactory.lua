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
-- package org.allbinary.image.opengles

-- local Image = require("javax.microedition.lcdui.Image")
local PlatformBitmapBaseFactory = require("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformTextureBaseFactory = require("org.allbinary.platform.opengles.PlatformTextureBaseFactory")
local OpenGLImageFactory = require("org.allbinary.image.opengles.OpenGLImageFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLESGL11ExtImageFactory = {}
OpenGLESGL11ExtImageFactory.__index = OpenGLESGL11ExtImageFactory
OpenGLESGL11ExtImageFactory.className = "OpenGLESGL11ExtImageFactory"
setmetatable(OpenGLESGL11ExtImageFactory, {__index = OpenGLImageFactory})

function OpenGLESGL11ExtImageFactory.new()
    local self = setmetatable(OpenGLImageFactory.new(), OpenGLESGL11ExtImageFactory)
    return self
end


function OpenGLESGL11ExtImageFactory:getInstance(image, bitmapFactory, textureFactory)
        return OpenGLESGL11ExtImage.new(image, bitmapFactory, textureFactory)
end

return OpenGLESGL11ExtImageFactory


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

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local PlatformBitmapBase = require("org.allbinary.platform.graphics.PlatformBitmapBase")
local PlatformBitmapBaseFactory = require("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformTextureBaseFactory = require("org.allbinary.platform.opengles.PlatformTextureBaseFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")

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

--OpenGLESNullImageJ2MEJavaLibrary
local OpenGLESImage = {}
OpenGLESImage.__index = OpenGLESImage
OpenGLESImage.className = "OpenGLESImage"

function OpenGLESImage:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.textureFactory = nil
    self.openGLBitmap = nil
    self.openGLESImageProperties = OpenGLESImageProperties.new()
end


function OpenGLESImage.new(image, bitmapFactory, textureFactory)
    local self = setmetatable({}, OpenGLESImage)
    self:_init_fields()
        self.openGLBitmap = bitmapFactory:createBitmap(image)
        self.textureFactory = textureFactory
    return self
end


-- throws Exception
function OpenGLESImage:set(gl)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function OpenGLESImage:initTexture(gl)
        return false
end


function OpenGLESImage:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
end


function OpenGLESImage:draw(gl, x, y, z)
end


function OpenGLESImage:getType()
        return OpenGLESImage.TYPE
end

OpenGLESImage.NULL_OPENGL_IMAGE = OpenGLESImage.new(NullImage.NULL_IMAGE, PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY, PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY)
OpenGLESImage.texture2dList = BasicArrayListD.new()
OpenGLESImage.TYPE = 4

return OpenGLESImage


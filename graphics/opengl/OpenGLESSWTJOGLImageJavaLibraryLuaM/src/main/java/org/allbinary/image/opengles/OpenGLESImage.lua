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
-- local OpenGLESPostLoadPlatformImage = require("javax.microedition.lcdui.OpenGLESPostLoadPlatformImage")
-- local PostLoadImageProcessor = require("javax.microedition.lcdui.PostLoadImageProcessor")
local GraphicsStrings = require("org.allbinary.graphics.GraphicsStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

--OpenGLESSWTJOGLImageJavaLibrary
local OpenGLESImage = {}
OpenGLESImage.__index = OpenGLESImage
OpenGLESImage.className = "OpenGLESImage"
setmetatable(OpenGLESImage, {__index = Image})

function OpenGLESImage:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.textureFactory = nil
    self.openGLBitmap = nil
    self.imageProcessor = OpenGLESImageProcessor.getInstance()
    self.openGLESImageTranslate = OpenGLESImageTranslate.getInstance()
    self.openGLESImageProperties = OpenGLESImageProperties.new()
end


function OpenGLESImage.new(image, bitmapFactory, textureFactory)
    local self = setmetatable(Image.new(image:getName(), PostLoadImageProcessor.NULL_POST_LOAD_IMAGE_PROCESSOR), OpenGLESImage)
    self:_init_fields()
        -- super(...) made self above
        self.openGLBitmap = bitmapFactory:createBitmap(image)
        self.textureFactory = textureFactory
        OpenGLImageCacheFactory.getInstance():init(self)
        self.platformImage = OpenGLESPostLoadPlatformImage.getInstance()
    return self
end


function OpenGLESImage:getHeight()
        return java_int((self.openGLBitmap:getHeight() * self.openGLESImageProperties.scaleY2))
end


function OpenGLESImage:getWidth()
        return java_int((self.openGLBitmap:getWidth() * self.openGLESImageProperties.scaleX2))
end


-- throws Exception
function OpenGLESImage:set(gl)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function OpenGLESImage:initTexture(gl)
        if not OpenGLESImage.texture2dList:contains(self) then
            OpenGLESImage.texture2dList:add(self)
            local textures = java_new_array(0, 1)
            gl:glEnable(self.GL10.GL_TEXTURE_2D)
            if self.openGLESImageProperties.textureID ~= -1 then
                textures[1] = self.openGLESImageProperties.textureID
                gl:glDeleteTextures(1, textures, 0)
            end
            gl:glGenTextures(1, textures, 0)
            self.openGLESImageProperties.textureID = textures[1]
            gl:glBindTexture(self.GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
            gl:glTexParameterf(self.GL10.GL_TEXTURE_2D, self.GL10.GL_TEXTURE_MIN_FILTER, self.GL10.GL_NEAREST)
            gl:glTexParameterf(self.GL10.GL_TEXTURE_2D, self.GL10.GL_TEXTURE_WRAP_S, self.GL10.GL_CLAMP_TO_EDGE)
            gl:glTexParameterf(self.GL10.GL_TEXTURE_2D, self.GL10.GL_TEXTURE_WRAP_T, self.GL10.GL_CLAMP_TO_EDGE)
            return true
        end
        return false
end


function OpenGLESImage:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
end


function OpenGLESImage:draw(gl, x, y, z)
end


function OpenGLESImage:getType()
        return OpenGLESImage.TYPE
end


function OpenGLESImage:toString()
        local graphicsStrings = GraphicsStrings.getInstance()
        return tostring(StringMaker.new():append(self:getName()):append(tostring(Image)):append(graphicsStrings.OPACITY):appendfloat((self.openGLESImageProperties.alphaf + 0.0)))
end
OpenGLESImage.__tostring = function(self) return self:toString() end

OpenGLESImage.NULL_OPENGL_IMAGE = OpenGLESImage.new(NullImage.NULL_IMAGE, PlatformBitmapBaseFactory.NULL_PLATFORM_BITMAP_BASE_FACTORY, PlatformTextureBaseFactory.NULL_PLATFORM_TEXTURE_BASE_FACTORY)
OpenGLESImage.texture2dList = BasicArrayListD.new()
OpenGLESImage.TYPE = 4

return OpenGLESImage


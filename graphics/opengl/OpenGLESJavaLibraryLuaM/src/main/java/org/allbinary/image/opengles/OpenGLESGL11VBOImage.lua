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

-- local ByteBuffer = require("java.nio.ByteBuffer")
-- local ByteOrder = require("java.nio.ByteOrder")
-- local FloatBuffer = require("java.nio.FloatBuffer")
-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local OpenGLLogUtil = require("org.allbinary.graphics.opengles.OpenGLLogUtil")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GLUtil = require("org.allbinary.opengles.GLUtil")
local PlatformBitmapBaseFactory = require("org.allbinary.platform.graphics.PlatformBitmapBaseFactory")
local PlatformTextureBaseFactory = require("org.allbinary.platform.opengles.PlatformTextureBaseFactory")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")

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

--This is not actually VBO impl
local OpenGLESGL11VBOImage = {}
OpenGLESGL11VBOImage.__index = OpenGLESGL11VBOImage
OpenGLESGL11VBOImage.className = "OpenGLESGL11VBOImage"
setmetatable(OpenGLESGL11VBOImage, {__index = OpenGLESImage})

function OpenGLESGL11VBOImage:_init_fields()
    self.glUtil = GLUtil.getInstance()
    self.textureVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2):order(ByteOrder.nativeOrder()):asFloatBuffer()
    self.regionRectangleFloatArray = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
    self.regionRectangleVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 3):order(ByteOrder.nativeOrder()):asFloatBuffer()
    self.regionTextureRectangleFloatArray = java_new_array(0.0, 8)
    self.regionTextureVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2):order(ByteOrder.nativeOrder()):asFloatBuffer()
end


function OpenGLESGL11VBOImage.new(image, bitmapFactory, textureFactory)
    local self = setmetatable(OpenGLESImage.new(image, bitmapFactory, textureFactory), OpenGLESGL11VBOImage)
    self:_init_fields()
        -- super(...) made self above
        self:initVertices()
        self.regionRectangleVertexFloatBuffer:put(FloatBuffer.wrap(self.regionRectangleFloatArray))
        self.regionTextureVertexFloatBuffer:put(FloatBuffer.wrap(self.regionTextureRectangleFloatArray))
    return self
end


function OpenGLESGL11VBOImage:initVertices()
        self.textureVertexFloatBuffer:put(0)
        self.textureVertexFloatBuffer:put(1)
        self.textureVertexFloatBuffer:put(1)
        self.textureVertexFloatBuffer:put(1)
        self.textureVertexFloatBuffer:put(0)
        self.textureVertexFloatBuffer:put(0)
        self.textureVertexFloatBuffer:put(1)
        self.textureVertexFloatBuffer:put(0)
        self.textureVertexFloatBuffer:rewind()
end


function OpenGLESGL11VBOImage:set(gl)
        local gl10 = gl
        if OpenGLESImage.initTexture(self, gl10) then
            self.textureFactory:load(gl10, self.GL10.GL_TEXTURE_2D, 0, self, 0, true)
            gl10:glDisable(self.GL10.GL_TEXTURE_2D)
            OpenGLLogUtil.getInstance():logError(gl10, self)
        end
end


function OpenGLESGL11VBOImage:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
        self.regionRectangleFloatArray[1] = (x + 0.0)
        self.regionRectangleFloatArray[8] = (viewHeight - y + 0.0)
        self.regionRectangleFloatArray[2] = self.regionRectangleFloatArray[8] - height
        self.regionRectangleFloatArray[4] = (x + 0.0) + width
        self.regionRectangleFloatArray[5] = self.regionRectangleFloatArray[2]
        self.regionRectangleFloatArray[7] = (x + 0.0)
        self.regionRectangleFloatArray[10] = self.regionRectangleFloatArray[4]
        self.regionRectangleFloatArray[11] = self.regionRectangleFloatArray[8]
        self.regionTextureRectangleFloatArray[1] = x_src / self:getWidth()
        self.regionTextureRectangleFloatArray[2] = ((y_src + height)) / self:getHeight()
        self.regionTextureRectangleFloatArray[3] = ((x_src + width)) / self:getWidth()
        self.regionTextureRectangleFloatArray[4] = self.regionTextureRectangleFloatArray[2]
        self.regionTextureRectangleFloatArray[5] = self.regionTextureRectangleFloatArray[1]
        self.regionTextureRectangleFloatArray[6] = y_src / self:getHeight()
        self.regionTextureRectangleFloatArray[7] = self.regionTextureRectangleFloatArray[3]
        self.regionTextureRectangleFloatArray[8] = self.regionTextureRectangleFloatArray[6]
        self.glUtil:position(self.regionRectangleVertexFloatBuffer, 0)
        gl:glVertexPointer(3, self.GL10.GL_FLOAT, 0, self.regionRectangleVertexFloatBuffer)
        gl:glEnableClientState(self.GL10.GL_VERTEX_ARRAY)
        gl:glEnable(self.GL10.GL_TEXTURE_2D)
        gl:glBindTexture(self.GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
        gl:glEnableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
        self.glUtil:position(self.regionTextureVertexFloatBuffer, 0)
        gl:glTexCoordPointer(2, self.GL10.GL_FLOAT, 0, self.regionTextureVertexFloatBuffer)
        gl:glDrawArrays(self.GL10.GL_TRIANGLE_STRIP, 0, 4)
        gl:glDisableClientState(self.GL10.GL_VERTEX_ARRAY)
        gl:glDisableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
        gl:glDisable(self.GL10.GL_TEXTURE_2D)
end


function OpenGLESGL11VBOImage:draw(gl, x, y, z)
        self.regionRectangleFloatArray[1] = (x + 0.0)
        self.regionRectangleFloatArray[8] = DisplayInfoSingleton.getInstance():getLastHeight() - y
        self.regionRectangleFloatArray[2] = self.regionRectangleFloatArray[8] - self:getHeight()
        self.regionRectangleFloatArray[4] = x + self:getWidth()
        self.regionRectangleFloatArray[5] = self.regionRectangleFloatArray[2]
        self.regionRectangleFloatArray[7] = (x + 0.0)
        self.regionRectangleFloatArray[10] = self.regionRectangleFloatArray[4]
        self.regionRectangleFloatArray[11] = self.regionRectangleFloatArray[8]
        self.glUtil:position(self.regionRectangleVertexFloatBuffer, 0)
        gl:glVertexPointer(3, self.GL10.GL_FLOAT, 0, self.regionRectangleVertexFloatBuffer)
        gl:glEnableClientState(self.GL10.GL_VERTEX_ARRAY)
        gl:glEnable(self.GL10.GL_TEXTURE_2D)
        gl:glBindTexture(self.GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
        gl:glEnableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
        self.glUtil:position(self.textureVertexFloatBuffer, 0)
        gl:glTexCoordPointer(2, self.GL10.GL_FLOAT, 0, self.textureVertexFloatBuffer)
        gl:glDrawArrays(self.GL10.GL_TRIANGLE_STRIP, 0, 4)
        gl:glDisableClientState(self.GL10.GL_VERTEX_ARRAY)
        gl:glDisableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
        gl:glDisable(self.GL10.GL_TEXTURE_2D)
end

return OpenGLESGL11VBOImage


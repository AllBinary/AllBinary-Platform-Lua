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
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local OpenGLLogUtil = require("org.allbinary.graphics.opengles.OpenGLLogUtil")
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

local OpenGLESGL10Image = {}
OpenGLESGL10Image.__index = OpenGLESGL10Image
OpenGLESGL10Image.className = "OpenGLESGL10Image"
setmetatable(OpenGLESGL10Image, {__index = OpenGLESImage})

function OpenGLESGL10Image:_init_fields()
    self.textureVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2):order(ByteOrder.nativeOrder()):asFloatBuffer()
    self.realOpenGLESImageDraw = (function()
        local o = OpenGLESImageDraw.new and OpenGLESImageDraw.new() or setmetatable({}, {__index = OpenGLESImageDraw})
        self.glUtil = GLUtil.getInstance()
        self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
        self.textureVertexFloatBuffer = self.textureVertexFloatBuffer
        self.regionTextureRectangleFloatArray = java_new_array(0.0, 8)
        self.regionTextureVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 2):order(ByteOrder.nativeOrder()):asFloatBuffer()
        self.regionRectangleFloatArray = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
        self.regionRectangleVertexFloatBuffer = ByteBuffer.allocateDirect(4 * 4 * 3):order(ByteOrder.nativeOrder()):asFloatBuffer()
        self.openGLESImageProperties = self.openGLESImageProperties
        

        function o:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
            local imageWidth = self:getWidth()
            local imageHeight = self:getHeight()
            self.regionRectangleFloatArray[8] = viewHeight
            self.regionRectangleFloatArray[2] = self.regionRectangleFloatArray[8] - height
            self.regionRectangleFloatArray[4] = width
            self.regionRectangleFloatArray[5] = self.regionRectangleFloatArray[2]
            self.regionRectangleFloatArray[10] = self.regionRectangleFloatArray[4]
            self.regionRectangleFloatArray[11] = self.regionRectangleFloatArray[8]
            self.regionTextureRectangleFloatArray[1] = x_src / imageWidth
            self.regionTextureRectangleFloatArray[2] = ((y_src + height)) / imageHeight
            self.regionTextureRectangleFloatArray[3] = ((x_src + width)) / imageWidth
            self.regionTextureRectangleFloatArray[4] = self.regionTextureRectangleFloatArray[2]
            self.regionTextureRectangleFloatArray[5] = self.regionTextureRectangleFloatArray[1]
            self.regionTextureRectangleFloatArray[6] = y_src / imageHeight
            self.regionTextureRectangleFloatArray[7] = self.regionTextureRectangleFloatArray[3]
            self.regionTextureRectangleFloatArray[8] = self.regionTextureRectangleFloatArray[6]
            local u_center = (self.regionTextureRectangleFloatArray[1] + self.regionTextureRectangleFloatArray[3]) / 2.0
            local v_center = (self.regionTextureRectangleFloatArray[6] + self.regionTextureRectangleFloatArray[2]) / 2.0
            self.glUtil:rotateUVs(self.regionTextureRectangleFloatArray, -self.openGLESImageProperties.angle, u_center, v_center)
            gl:glPushMatrix()
            local imageProcessor = self.imageProcessor
            self.openGLESImageTranslate:translate(gl, self, x, -y)
            imageProcessor:scale(gl, self.openGLESImageProperties.scaleX, self.openGLESImageProperties.scaleY)
            imageProcessor:colorMask(gl, self.openGLESImageProperties.redf, self.openGLESImageProperties.greenf, self.openGLESImageProperties.bluef, self.openGLESImageProperties.alphaf)
            self.openGLESImageTranslate:translate2(gl, self)
            self.regionRectangleVertexFloatBuffer:put(self.regionRectangleFloatArray)
            self.glUtil:position(self.regionRectangleVertexFloatBuffer, 0)
            gl:glVertexPointer(3, self.GL10.GL_FLOAT, 0, self.regionRectangleVertexFloatBuffer)
            gl:glEnableClientState(self.GL10.GL_VERTEX_ARRAY)
            gl:glEnable(self.GL10.GL_TEXTURE_2D)
            gl:glBindTexture(self.GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
            gl:glEnableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
            self.regionTextureVertexFloatBuffer:put(self.regionTextureRectangleFloatArray)
            self.glUtil:position(self.regionTextureVertexFloatBuffer, 0)
            gl:glTexCoordPointer(2, self.GL10.GL_FLOAT, 0, self.regionTextureVertexFloatBuffer)
            gl:glDrawArrays(self.GL10.GL_TRIANGLE_STRIP, 0, 4)
            gl:glDisableClientState(self.GL10.GL_VERTEX_ARRAY)
            gl:glDisableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
            gl:glDisable(self.GL10.GL_TEXTURE_2D)
            gl:glPopMatrix()
        end
        

        function o:draw(gl, x, y, z)
            local width = self:getWidth()
            local height = self:getHeight()
            self.regionRectangleFloatArray[8] = self.displayInfoSingleton:getLastHeight()
            self.regionRectangleFloatArray[2] = self.regionRectangleFloatArray[8] - height
            self.regionRectangleFloatArray[4] = width
            self.regionRectangleFloatArray[5] = self.regionRectangleFloatArray[2]
            self.regionRectangleFloatArray[10] = self.regionRectangleFloatArray[4]
            self.regionRectangleFloatArray[11] = self.regionRectangleFloatArray[8]
            self.regionTextureRectangleFloatArray[1] = 0
            self.regionTextureRectangleFloatArray[2] = 1
            self.regionTextureRectangleFloatArray[3] = 1
            self.regionTextureRectangleFloatArray[4] = 1
            self.regionTextureRectangleFloatArray[5] = 0
            self.regionTextureRectangleFloatArray[6] = 0
            self.regionTextureRectangleFloatArray[7] = 1
            self.regionTextureRectangleFloatArray[8] = 0
            gl:glPushMatrix()
            self.openGLESImageTranslate:translate(gl, self, x, -y)
            local imageProcessor = self.imageProcessor
            imageProcessor:scale(gl, self.openGLESImageProperties.scaleX, self.openGLESImageProperties.scaleY)
            imageProcessor:colorMask(gl, self.openGLESImageProperties.redf, self.openGLESImageProperties.greenf, self.openGLESImageProperties.bluef, self.openGLESImageProperties.alphaf)
            self.openGLESImageTranslate:translate2(gl, self)
            self.regionRectangleVertexFloatBuffer:put(self.regionRectangleFloatArray)
            self.glUtil:position(self.regionRectangleVertexFloatBuffer, 0)
            gl:glVertexPointer(3, self.GL10.GL_FLOAT, 0, self.regionRectangleVertexFloatBuffer)
            gl:glEnableClientState(self.GL10.GL_VERTEX_ARRAY)
            gl:glEnable(self.GL10.GL_TEXTURE_2D)
            gl:glBindTexture(self.GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
            gl:glEnableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
            self.glUtil:rotateUVs(self.regionTextureRectangleFloatArray, -self.openGLESImageProperties.angle, 0.5, 0.5)
            self.glUtil:position(self.textureVertexFloatBuffer, 0)
            self.textureVertexFloatBuffer:put(self.regionTextureRectangleFloatArray)
            self.glUtil:position(self.textureVertexFloatBuffer, 0)
            gl:glTexCoordPointer(2, self.GL10.GL_FLOAT, 0, self.textureVertexFloatBuffer)
            gl:glDrawArrays(self.GL10.GL_TRIANGLE_STRIP, 0, 4)
            gl:glDisableClientState(self.GL10.GL_VERTEX_ARRAY)
            gl:glDisableClientState(self.GL10.GL_TEXTURE_COORD_ARRAY)
            gl:glDisable(self.GL10.GL_TEXTURE_2D)
            gl:glPopMatrix()
        end
        return o
    end)()
    self.openGLESImageDraw = OpenGLESImageDraw.getInstance()
end


function OpenGLESGL10Image.new(image, bitmapFactory, textureFactory)
    local self = setmetatable(OpenGLESImage.new(image, bitmapFactory, textureFactory), OpenGLESGL10Image)
    self:_init_fields()
        -- super(...) made self above
        self:initVertices()
    return self
end


function OpenGLESGL10Image:initVertices()
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


function OpenGLESGL10Image:set(gl)
        local gl10 = gl
        if OpenGLESImage.initTexture(self, gl10) then
            self.textureFactory:load(gl10, self.GL10.GL_TEXTURE_2D, 0, self, 0, true)
            gl10:glDisable(self.GL10.GL_TEXTURE_2D)
            self.openGLESImageDraw = self.realOpenGLESImageDraw
            OpenGLLogUtil.getInstance():logError(gl10, self)
        end
end


function OpenGLESGL10Image:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
        self.openGLESImageDraw:drawRegion(gl, viewHeight, x_src, y_src, width, height, x, y, z)
end


function OpenGLESGL10Image:draw(gl, x, y, z)
        self.openGLESImageDraw:draw(gl, x, y, z)
end

return OpenGLESGL10Image


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
-- local GL11 = require("javax.microedition.khronos.opengles.GL11")
-- local GL11Ext = require("javax.microedition.khronos.opengles.GL11Ext")
-- local Image = require("javax.microedition.lcdui.Image")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local OpenGLLogUtil = require("org.allbinary.graphics.opengles.OpenGLLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

--Many devices don't support this even though it is supposed to
local OpenGLESGL11ExtImage = {}
OpenGLESGL11ExtImage.__index = OpenGLESGL11ExtImage
OpenGLESGL11ExtImage.className = "OpenGLESGL11ExtImage"
setmetatable(OpenGLESGL11ExtImage, {__index = OpenGLESImage})

function OpenGLESGL11ExtImage:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.a = 0
    self.rectangle = nil
end


function OpenGLESGL11ExtImage.new(image, bitmapFactory, textureFactory)
    local self = setmetatable(OpenGLESImage.new(image, bitmapFactory, textureFactory), OpenGLESGL11ExtImage)
    self:_init_fields()
        -- super(...) made self above
        self:onDisplayChangeEvent(nil)
        self.rectangle = {0, self:getHeight(), self:getWidth(), -self:getHeight()}
    return self
end


function OpenGLESGL11ExtImage:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "onResize")
            self.a = DisplayInfoSingleton.getInstance():getLastHeight() - self:getHeight()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onResize", e)
        end
end


function OpenGLESGL11ExtImage:set(gl)
        self:onDisplayChangeEvent(nil)
        local gl11 = gl
        if OpenGLESImage.initTexture(self, gl11) then
            self.textureFactory:load(gl11, self.GL10.GL_TEXTURE_2D, 0, self, 0, true)
            gl11:glTexParameteriv(self.GL10.GL_TEXTURE_2D, GL11Ext.GL_TEXTURE_CROP_RECT_OES, self.rectangle, 0)
            gl11:glDisable(self.GL10.GL_TEXTURE_2D)
            OpenGLLogUtil.getInstance():logError(gl11, self)
        end
end


function OpenGLESGL11ExtImage:draw(gl, x, y, z)
        gl:glEnable(self.GL10.GL_TEXTURE_2D)
        gl:glBindTexture(self.GL10.GL_TEXTURE_2D, self.openGLESImageProperties.textureID)
        (gl):glDrawTexfOES(x, self.a - y, z, self:getWidth(), self:getHeight())
        gl:glDisable(self.GL10.GL_TEXTURE_2D)
end

return OpenGLESGL11ExtImage


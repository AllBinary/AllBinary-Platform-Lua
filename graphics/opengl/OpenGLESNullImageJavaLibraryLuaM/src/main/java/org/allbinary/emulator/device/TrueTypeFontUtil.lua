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
-- package org.allbinary.emulator.device

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local TrueTypeFontUtilBase = require("org.allbinary.emulator.device.TrueTypeFontUtilBase")

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

local TrueTypeFontUtil = {}
TrueTypeFontUtil.__index = TrueTypeFontUtil
TrueTypeFontUtil.className = "TrueTypeFontUtil"
setmetatable(TrueTypeFontUtil, {__index = TrueTypeFontUtilBase})

function TrueTypeFontUtil:_init_fields()
    self.fontImage = OpenGLESImage.NULL_OPENGL_IMAGE
end


function TrueTypeFontUtil.getInstance()
        return TrueTypeFontUtil.instance
end


function TrueTypeFontUtil.new()
    local self = setmetatable(TrueTypeFontUtilBase.new(1), TrueTypeFontUtil)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TrueTypeFontUtil:getAsTextureSize(textureSize)
        error(java_exception("RuntimeException"), 0)
end


function TrueTypeFontUtil:getCellSize(cellSize)
        error(java_exception("RuntimeException"), 0)
end


function TrueTypeFontUtil:getFontBitmap(filename, fontSize, cellSize, basicColor)
        error(java_exception("RuntimeException"), 0)
end


function TrueTypeFontUtil:saveFontAtlasAsFile()
end


function TrueTypeFontUtil:getFontBitmapGL(gl, filename, cellSize, basicColor)
        error(java_exception("RuntimeException"), 0)
end


function TrueTypeFontUtil:getFontWidths(filename, fontSize)
        error(java_exception("RuntimeException"), 0)
end

TrueTypeFontUtil.instance = TrueTypeFontUtil.new()

return TrueTypeFontUtil


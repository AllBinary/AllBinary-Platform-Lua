-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local OpenGLESImageTranslate = require("org.allbinary.image.opengles.OpenGLESImageTranslate")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLESDeviceImageTranslate = {}
OpenGLESDeviceImageTranslate.__index = OpenGLESDeviceImageTranslate
OpenGLESDeviceImageTranslate.className = "OpenGLESDeviceImageTranslate"
setmetatable(OpenGLESDeviceImageTranslate, {__index = OpenGLESImageTranslate})

function OpenGLESDeviceImageTranslate:_init_fields()
    self.translateX = 0.0
    self.translateY = 0.0
    self.translateX2 = 0.0
    self.translateY2 = 0.0
end

function OpenGLESDeviceImageTranslate.new()
    local self = setmetatable(OpenGLESImageTranslate.new(), OpenGLESDeviceImageTranslate)
    self:_init_fields()
    return self
end


function OpenGLESDeviceImageTranslate:translate(gl, openGLESImage, x, y)
        openGLESImage.imageProcessor:translate(gl, self.translateX + (openGLESImage.openGLESImageProperties.scaleX * x), self.translateY + (openGLESImage.openGLESImageProperties.scaleY * y))
end


function OpenGLESDeviceImageTranslate:translate2(gl, openGLESImage)
        openGLESImage.imageProcessor:translate(gl, self.translateX2, self.translateY2)
end

return OpenGLESDeviceImageTranslate


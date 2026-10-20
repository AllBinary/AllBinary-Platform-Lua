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
-- package org.allbinary.graphics.opengles

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLCapabilities = {}
OpenGLCapabilities.__index = OpenGLCapabilities
OpenGLCapabilities.className = "OpenGLCapabilities"

function OpenGLCapabilities:_init_fields()
    self.VERSION_1_0 = "1.0"
    self.VERSION_1_1 = "1.1"
    self.VERSION_2_0 = "2.0"
    self.VERSION_3_0 = "3.0"
    self.VERSION_3_1 = "3.1"
    self.VERSION_3_2 = "3.2"
    self.VERSION_HIGHER_THAN_EXISTS = "999.999"
    self.glVersion = StringUtil.getInstance().EMPTY_STRING
    self.shaderVersion = 0
    self.glInstanceVersion = StringUtil.getInstance().EMPTY_STRING
    self.maxTextureSize = 64
end


function OpenGLCapabilities.getInstance()
        return OpenGLCapabilities.instance
end


function OpenGLCapabilities.new()
    local self = setmetatable({}, OpenGLCapabilities)
    self:_init_fields()
    return self
end


function OpenGLCapabilities:initCapabilities(gl)
end


function OpenGLCapabilities:isGlExtensionDrawTexture()
        return false
end


function OpenGLCapabilities:getGlVersion()
        return self.glVersion
end


function OpenGLCapabilities:isVertexBufferObjectSupport()
        return false
end


function OpenGLCapabilities:isTextureSizeValid(widthAndHeight)
        return true
end

OpenGLCapabilities.instance = OpenGLCapabilities.new()

return OpenGLCapabilities


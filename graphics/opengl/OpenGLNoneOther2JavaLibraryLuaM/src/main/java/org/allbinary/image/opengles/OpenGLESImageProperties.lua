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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLESImageProperties = {}
OpenGLESImageProperties.__index = OpenGLESImageProperties
OpenGLESImageProperties.className = "OpenGLESImageProperties"

function OpenGLESImageProperties:_init_fields()
    self.textureID = -1
    self.scaleX = 1.0
    self.scaleY = 1.0
    self.scaleX2 = 1.0
    self.scaleY2 = 1.0
    self.angle = 0
    self.redf = 1.0
    self.greenf = 1.0
    self.bluef = 1.0
    self.alphaf = 1.0
end

function OpenGLESImageProperties.new()
    local self = setmetatable({}, OpenGLESImageProperties)
    self:_init_fields()
    return self
end

return OpenGLESImageProperties


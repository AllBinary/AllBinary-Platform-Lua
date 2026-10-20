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
-- package org.allbinary.graphics.opengles

local ShaderComposite = require("org.allbinary.graphics.opengles.shader.ShaderComposite")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLVersionValidator = {}
OpenGLVersionValidator.__index = OpenGLVersionValidator
OpenGLVersionValidator.className = "OpenGLVersionValidator"

function OpenGLVersionValidator:_init_fields()
    self.EGL_CONTEXT_CLIENT_VERSION_VALUE = -1
end

function OpenGLVersionValidator.new()
    local self = setmetatable({}, OpenGLVersionValidator)
    self:_init_fields()
    return self
end


function OpenGLVersionValidator.getInstance()
        return OpenGLVersionValidator.instance
end


function OpenGLVersionValidator:isGL31OrHigher()
        return false
end


function OpenGLVersionValidator:isAvailable(glVersionRequired)
        return false
end


function OpenGLVersionValidator:setShaderComposite(shaderComposite, anyType)
end

OpenGLVersionValidator.instance = OpenGLVersionValidator.new()

return OpenGLVersionValidator


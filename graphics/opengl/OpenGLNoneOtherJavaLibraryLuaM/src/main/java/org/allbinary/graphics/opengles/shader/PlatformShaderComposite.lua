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
-- package org.allbinary.graphics.opengles.shader

local NullOpenGLProcessorFactory = require("org.allbinary.graphics.opengles.NullOpenGLProcessorFactory")
local OpenGLProcessor = require("org.allbinary.graphics.opengles.OpenGLProcessor")
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

local PlatformShaderComposite = {}
PlatformShaderComposite.__index = PlatformShaderComposite
PlatformShaderComposite.className = "PlatformShaderComposite"
setmetatable(PlatformShaderComposite, {__index = ShaderComposite})


function PlatformShaderComposite.new(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor)
    local self = setmetatable(ShaderComposite.new(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, NullOpenGLProcessorFactory.getInstance()), PlatformShaderComposite)
        -- super(...) made self above
    return self
end

return PlatformShaderComposite


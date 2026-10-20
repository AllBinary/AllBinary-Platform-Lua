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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local NullOpenGLProcessorFactory = require("org.allbinary.graphics.opengles.NullOpenGLProcessorFactory")
local OpenGLProcessor = require("org.allbinary.graphics.opengles.OpenGLProcessor")
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

local ShaderComposite = {}
ShaderComposite.__index = ShaderComposite
ShaderComposite.className = "ShaderComposite"

function ShaderComposite:_init_fields()
    self.disableProgramShaderOpenGLProcessor = nil
    self.requiresOpenGLVersion = nil
    self.shaderArray = nil
    self.shaderInitializer = nil
    self.compositeShaderUpdater = nil
    self.modelViewProjection = nil
    self.colorOpenGLProcessor = nil
    self.vertexOpenGLProcessor = nil
    self.useProgramShaderOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.shaderMatrixOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.colorEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.normalEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.vertexEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.textureEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.colorDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.normalDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.vertexDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.textureDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    self.uniformLightPositionOpenGLProcessor = NullOpenGLTextureProcessor.getInstance()
    self.uniformLightColorOpenGLProcessor = NullOpenGLTextureProcessor.getInstance()
    self.uniformCameraPositionOpenGLProcessor = NullOpenGLTextureProcessor.getInstance()
    self.uniformTextureUnitOpenGLProcessor = NullOpenGLTextureProcessor.getInstance()
    self.programHandle = 0
end


function ShaderComposite.new(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, disableProgramShaderOpenGLProcessor)
    local self = setmetatable({}, ShaderComposite)
    self:_init_fields()
        self.requiresOpenGLVersion = requiresOpenGLVersion
        self.shaderArray = shaderArray
        self.shaderInitializer = shaderInitializer
        self.compositeShaderUpdater = compositeShaderUpdater
        self.modelViewProjection = modelViewProjection
        self.colorOpenGLProcessor = colorOpenGLProcessor
        self.vertexOpenGLProcessor = vertexOpenGLProcessor
        self.disableProgramShaderOpenGLProcessor = disableProgramShaderOpenGLProcessor
    return self
end


function ShaderComposite:init(gl)
        self.programHandle = self.shaderInitializer:init(gl, self.shaderArray, StringUtil.getInstance():getArrayInstance())
end

return ShaderComposite


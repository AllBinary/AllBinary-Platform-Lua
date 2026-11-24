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

local ShaderComposite = {}
package.loaded["org.allbinary.graphics.opengles.shader.ShaderComposite"] = ShaderComposite

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local NullOpenGLProcessorFactory = java_lazy("org.allbinary.graphics.opengles.NullOpenGLProcessorFactory")
local OpenGLProcessor = java_lazy("org.allbinary.graphics.opengles.OpenGLProcessor")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CompositeShaderUpdater = java_lazy("org.allbinary.graphics.opengles.shader.CompositeShaderUpdater")
local ModelViewProjection = java_lazy("org.allbinary.graphics.opengles.shader.ModelViewProjection")
local NullOpenGLTextureProcessor = java_lazy("org.allbinary.graphics.opengles.shader.NullOpenGLTextureProcessor")
local OpenGLObject3dProcessor = java_lazy("org.allbinary.graphics.opengles.shader.OpenGLObject3dProcessor")
local Shader = java_lazy("org.allbinary.graphics.opengles.shader.Shader")
local ShaderInitializer = java_lazy("org.allbinary.graphics.opengles.shader.ShaderInitializer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ShaderComposite is declared before the requires
ShaderComposite.__index = ShaderComposite
ShaderComposite.className = "ShaderComposite"
ShaderComposite.javaClassName = "org.allbinary.graphics.opengles.shader.ShaderComposite"

function ShaderComposite:_init_fields()
    if self.disableProgramShaderOpenGLProcessor == nil then self.disableProgramShaderOpenGLProcessor = nil end
    if self.requiresOpenGLVersion == nil then self.requiresOpenGLVersion = nil end
    if self.shaderArray == nil then self.shaderArray = nil end
    if self.shaderInitializer == nil then self.shaderInitializer = nil end
    if self.compositeShaderUpdater == nil then self.compositeShaderUpdater = nil end
    if self.modelViewProjection == nil then self.modelViewProjection = nil end
    if self.colorOpenGLProcessor == nil then self.colorOpenGLProcessor = nil end
    if self.vertexOpenGLProcessor == nil then self.vertexOpenGLProcessor = nil end
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
    if self.programHandle == nil then self.programHandle = 0 end
end


function ShaderComposite._jinit(self, requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, disableProgramShaderOpenGLProcessor)
    ShaderComposite._init_fields(self)
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

function ShaderComposite.new(...)
    local self = setmetatable({}, ShaderComposite)
    ShaderComposite._jinit(self, ...)
    return self
end


function ShaderComposite:init(gl)
        self.programHandle = self.shaderInitializer:init(gl, self.shaderArray, StringUtil.getInstance():getArrayInstance())
end

return ShaderComposite


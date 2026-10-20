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
local OpenGLCapabilities = require("org.allbinary.graphics.opengles.OpenGLCapabilities")
local OpenGLProcessor = require("org.allbinary.graphics.opengles.OpenGLProcessor")
local ShaderComposite = require("org.allbinary.graphics.opengles.shader.ShaderComposite")

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

local NullShaderComposite = {}
NullShaderComposite.__index = NullShaderComposite
NullShaderComposite.className = "NullShaderComposite"
setmetatable(NullShaderComposite, {__index = ShaderComposite})


function NullShaderComposite.getInstance()
        return NullShaderComposite.instance
end


function NullShaderComposite.new(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, disableProgramShaderOpenGLProcessor)
    local self = setmetatable(ShaderComposite.new(requiresOpenGLVersion, shaderArray, compositeShaderUpdater, shaderInitializer, modelViewProjection, colorOpenGLProcessor, vertexOpenGLProcessor, disableProgramShaderOpenGLProcessor), NullShaderComposite)
        -- super(...) made self above
        self.useProgramShaderOpenGLProcessor = NullOpenGLProcessorFactory.getInstance()
    return self
end

NullShaderComposite.instance = (function()
        local o = NullShaderComposite.new and NullShaderComposite.new(OpenGLCapabilities.getInstance().VERSION_2_0, {Shader.new(), Shader.new()}, CompositeShaderUpdater.getInstance(), ShaderInitializer.getInstance(), ModelViewProjection.getInstance(), nil, nil, NullOpenGLProcessorFactory.getInstance()) or setmetatable({}, {__index = NullShaderComposite})
        

        function o:init(gl)
        end
        return o
    end)()

return NullShaderComposite


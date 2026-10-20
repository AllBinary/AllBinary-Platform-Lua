-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local ObjectThreedOpenGLProcessor = require("org.allbinary.graphics.threed.min3d.renderer.processor.ObjectThreedOpenGLProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EnableFacesShaderOpenGLProcessor = {}
EnableFacesShaderOpenGLProcessor.__index = EnableFacesShaderOpenGLProcessor
EnableFacesShaderOpenGLProcessor.className = "EnableFacesShaderOpenGLProcessor"
setmetatable(EnableFacesShaderOpenGLProcessor, {__index = ObjectThreedOpenGLProcessor})


function EnableFacesShaderOpenGLProcessor.getInstance()
        return EnableFacesShaderOpenGLProcessor.instance
end


function EnableFacesShaderOpenGLProcessor.new()
    local self = setmetatable(ObjectThreedOpenGLProcessor.new(), EnableFacesShaderOpenGLProcessor)
    return self
end


function EnableFacesShaderOpenGLProcessor:process(gl, anyType)
end

EnableFacesShaderOpenGLProcessor.instance = EnableFacesShaderOpenGLProcessor.new()

return EnableFacesShaderOpenGLProcessor


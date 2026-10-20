-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles.shader

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local OpenGLProcessor = require("org.allbinary.graphics.opengles.OpenGLProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShaderOpenGLProcessor = {}
ShaderOpenGLProcessor.__index = ShaderOpenGLProcessor
ShaderOpenGLProcessor.className = "ShaderOpenGLProcessor"
setmetatable(ShaderOpenGLProcessor, {__index = OpenGLProcessor})


function ShaderOpenGLProcessor.new()
    local self = setmetatable(OpenGLProcessor.new(), ShaderOpenGLProcessor)
    return self
end


function ShaderOpenGLProcessor:process0(gl)
end


function ShaderOpenGLProcessor:process1(gl)
end


function ShaderOpenGLProcessor:process(gl)
end


function ShaderOpenGLProcessor:process2(gl)
end


function ShaderOpenGLProcessor:process3(gl)
end

return ShaderOpenGLProcessor


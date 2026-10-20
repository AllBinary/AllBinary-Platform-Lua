-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLProcessor = {}
OpenGLProcessor.__index = OpenGLProcessor
OpenGLProcessor.className = "OpenGLProcessor"

function OpenGLProcessor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function OpenGLProcessor.new()
    local self = setmetatable({}, OpenGLProcessor)
    self:_init_fields()
    return self
end


function OpenGLProcessor:process(gl)
end

return OpenGLProcessor


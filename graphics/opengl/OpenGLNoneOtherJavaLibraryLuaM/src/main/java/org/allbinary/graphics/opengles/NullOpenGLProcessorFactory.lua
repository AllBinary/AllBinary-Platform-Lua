-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullOpenGLProcessorFactory = {}
NullOpenGLProcessorFactory.__index = NullOpenGLProcessorFactory
NullOpenGLProcessorFactory.className = "NullOpenGLProcessorFactory"

function NullOpenGLProcessorFactory.new()
    local self = setmetatable({}, NullOpenGLProcessorFactory)
    return self
end


function NullOpenGLProcessorFactory.getInstance()
        return NullOpenGLProcessorFactory.instance
end

NullOpenGLProcessorFactory.instance = OpenGLProcessor.new()

return NullOpenGLProcessorFactory


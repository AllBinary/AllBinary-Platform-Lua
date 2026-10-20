-- Generated Code Do Not Modify
-- package org.allbinary.device


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLESGraphicsFactory = {}
OpenGLESGraphicsFactory.__index = OpenGLESGraphicsFactory
OpenGLESGraphicsFactory.className = "OpenGLESGraphicsFactory"

function OpenGLESGraphicsFactory.new()
    local self = setmetatable({}, OpenGLESGraphicsFactory)
    return self
end


function OpenGLESGraphicsFactory:getOpenGLESGraphicsInstance()
        return OpenGLESNullGraphicsFactory.getInstance()
end

return OpenGLESGraphicsFactory


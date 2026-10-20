-- Generated Code Do Not Modify
-- package org.allbinary.image.opengles


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLStrings = {}
OpenGLStrings.__index = OpenGLStrings
OpenGLStrings.className = "OpenGLStrings"

function OpenGLStrings:_init_fields()
    self.GL_ERROR_LABEL = "GLError: "
    self.SET = "set(GL10)"
end

function OpenGLStrings.new()
    local self = setmetatable({}, OpenGLStrings)
    self:_init_fields()
    return self
end


function OpenGLStrings.getInstance()
        return OpenGLStrings.instance
end

OpenGLStrings.instance = OpenGLStrings.new()

return OpenGLStrings


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

local OpenGLThreadUtil = {}
OpenGLThreadUtil.__index = OpenGLThreadUtil
OpenGLThreadUtil.className = "OpenGLThreadUtil"

function OpenGLThreadUtil.new()
    local self = setmetatable({}, OpenGLThreadUtil)
    return self
end


function OpenGLThreadUtil.getInstance()
        return OpenGLThreadUtil.instance
end


function OpenGLThreadUtil:set(glSurfaceView)
end


function OpenGLThreadUtil:onPause()
end


function OpenGLThreadUtil:onResume()
end

OpenGLThreadUtil.instance = OpenGLThreadUtil.new()

return OpenGLThreadUtil


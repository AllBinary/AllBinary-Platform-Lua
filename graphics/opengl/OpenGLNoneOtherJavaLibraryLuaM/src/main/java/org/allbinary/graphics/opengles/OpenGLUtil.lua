-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

-- local Image = require("javax.microedition.lcdui.Image")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLUtil = {}
OpenGLUtil.__index = OpenGLUtil
OpenGLUtil.className = "OpenGLUtil"

function OpenGLUtil.new()
    local self = setmetatable({}, OpenGLUtil)
    return self
end


function OpenGLUtil.getInstance()
        return OpenGLUtil.instance
end


function OpenGLUtil:addImage(image)
        return image
end


function OpenGLUtil:clear()
end


function OpenGLUtil:addRunnable(runnable)
end

OpenGLUtil.instance = OpenGLUtil.new()

return OpenGLUtil


-- Generated Code Do Not Modify
-- package org.platform.graphics

local OpenGLImageUtilBase = require("org.allbinary.image.opengles.OpenGLImageUtilBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLImageUtil = {}
OpenGLImageUtil.__index = OpenGLImageUtil
OpenGLImageUtil.className = "OpenGLImageUtil"
setmetatable(OpenGLImageUtil, {__index = OpenGLImageUtilBase})

function OpenGLImageUtil.new()
    local self = setmetatable(OpenGLImageUtilBase.new(), OpenGLImageUtil)
    return self
end


function OpenGLImageUtil.getInstance()
        return OpenGLImageUtil.instance
end

OpenGLImageUtil.instance = OpenGLImageUtil.new()

return OpenGLImageUtil


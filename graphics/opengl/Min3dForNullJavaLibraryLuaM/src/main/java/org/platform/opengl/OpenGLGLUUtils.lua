-- Generated Code Do Not Modify
-- package org.platform.opengl

-- local ByteBuffer = require("java.nio.ByteBuffer")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local OpenGLBitmap = require("org.allbinary.graphics.OpenGLBitmap")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local OpenGLGLUUtils = {}
OpenGLGLUUtils.__index = OpenGLGLUUtils
OpenGLGLUUtils.className = "OpenGLGLUUtils"

function OpenGLGLUUtils.new()
    local self = setmetatable({}, OpenGLGLUUtils)
    return self
end


function OpenGLGLUUtils.getInstance()
        return OpenGLGLUUtils.instance
end


function OpenGLGLUUtils:makeByteBuffer(bmp, flip)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLGLUUtils:texImage2D(gl, glVersion, target, level, generateMipMap, openGLESImage, border, flip)
        error(java_exception("RuntimeException"), 0)
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLGLUUtils:texImage2D(gl, glVersion, target, level, generateMipMap, bitmap, border, flip)
        error(java_exception("RuntimeException"), 0)
end

OpenGLGLUUtils.instance = OpenGLGLUUtils.new()

return OpenGLGLUUtils


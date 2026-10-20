-- Generated Code Do Not Modify
-- package org.platform.opengl

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local PlatformTextureBaseFactory = require("org.allbinary.platform.opengles.PlatformTextureBaseFactory")

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

local OpenGLTextureFactory = {}
OpenGLTextureFactory.__index = OpenGLTextureFactory
OpenGLTextureFactory.className = "OpenGLTextureFactory"
setmetatable(OpenGLTextureFactory, {__index = PlatformTextureBaseFactory})

function OpenGLTextureFactory:_init_fields()
    self.gluUtils = OpenGLGLUUtils.getInstance()
end


function OpenGLTextureFactory.getInstance()
        return OpenGLTextureFactory.instance
end


function OpenGLTextureFactory.new()
    local self = setmetatable(PlatformTextureBaseFactory.new(), OpenGLTextureFactory)
    self:_init_fields()
    return self
end


function OpenGLTextureFactory:load(gl, target, level, image, border, flip)
        error(java_exception("RuntimeException"), 0)
end

OpenGLTextureFactory.instance = OpenGLTextureFactory.new()

return OpenGLTextureFactory


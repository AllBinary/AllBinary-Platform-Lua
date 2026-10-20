-- Generated Code Do Not Modify
-- package org.allbinary.device

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local FontDebugBase = require("org.allbinary.graphics.font.FontDebugBase")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GraphicsInterface = require("org.allbinary.device.GraphicsInterface")

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

local OpenGLESGraphics = {}
OpenGLESGraphics.__index = OpenGLESGraphics
OpenGLESGraphics.className = "OpenGLESGraphics"
setmetatable(OpenGLESGraphics, {__index = Graphics})

function OpenGLESGraphics:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.gl = NullGL10.NULL_GL10
end


function OpenGLESGraphics.new()
    local self = setmetatable(Graphics.new(), OpenGLESGraphics)
    self:_init_fields()
    return self
end


function OpenGLESGraphics:updateGL(gl)
end


function OpenGLESGraphics:set(gl)
end


-- throws Exception
function OpenGLESGraphics:init()
end


-- throws Exception
function OpenGLESGraphics:update()
end


function OpenGLESGraphics:setOrthoginalMode()
end


function OpenGLESGraphics:setCameraMode()
end


function OpenGLESGraphics:getGl10()
        return self.gl
end


function OpenGLESGraphics:setFontDebug(font, fontDebug)
        error(java_exception("RuntimeException"), 0)
end

return OpenGLESGraphics


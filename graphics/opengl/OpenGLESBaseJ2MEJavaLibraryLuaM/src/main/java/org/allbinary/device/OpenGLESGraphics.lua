-- Generated Code Do Not Modify
-- package org.allbinary.device

local OpenGLESGraphics = {}
package.loaded["org.allbinary.device.OpenGLESGraphics"] = OpenGLESGraphics

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Font = require("javax.microedition.lcdui.Font")
local FontDebugBase = java_lazy("org.allbinary.graphics.font.FontDebugBase")
local OpenGLSurfaceChangedInterface = java_lazy("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GraphicsInterface = require("org.allbinary.device.GraphicsInterface")
local NullGL10 = java_lazy("org.allbinary.device.NullGL10")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table OpenGLESGraphics is declared before the requires
OpenGLESGraphics.__index = OpenGLESGraphics
OpenGLESGraphics.className = "OpenGLESGraphics"
OpenGLESGraphics.javaClassName = "org.allbinary.device.OpenGLESGraphics"
OpenGLESGraphics.java_implements = " OpenGLSurfaceChangedInterface GraphicsInterface "
OpenGLESGraphics.java_interfaces = function() return {OpenGLSurfaceChangedInterface, GraphicsInterface} end

function OpenGLESGraphics:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.gl = NullGL10.NULL_GL10
end


function OpenGLESGraphics._jinit(self)
    OpenGLESGraphics._init_fields(self)
    return self
end

function OpenGLESGraphics.new(...)
    local self = setmetatable({}, OpenGLESGraphics)
    OpenGLESGraphics._jinit(self, ...)
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


function OpenGLESGraphics:getGlP()
        return self.gl
end


function OpenGLESGraphics:setFontDebug(font, fontDebug)
        error(require("java.lang.RuntimeException").new(), 0)
end

return OpenGLESGraphics


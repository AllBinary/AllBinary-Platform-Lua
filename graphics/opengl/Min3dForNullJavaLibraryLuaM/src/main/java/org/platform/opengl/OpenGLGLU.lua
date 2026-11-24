-- Generated Code Do Not Modify
-- package org.platform.opengl

local OpenGLGLU = {}
package.loaded["org.platform.opengl.OpenGLGLU"] = OpenGLGLU

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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")

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

-- class table OpenGLGLU is declared before the requires
OpenGLGLU.__index = OpenGLGLU
OpenGLGLU.className = "OpenGLGLU"
OpenGLGLU.javaClassName = "org.platform.opengl.OpenGLGLU"

function OpenGLGLU._jinit(self)
    return self
end

function OpenGLGLU.new()
    return OpenGLGLU._jinit(setmetatable({}, OpenGLGLU))
end


function OpenGLGLU.getInstance()
        return OpenGLGLU.instance_f
end


function OpenGLGLU:gluLookAt(gl, eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLGLU:gluProject(gl, objX, objY, objZ, model, modelOffset, project, projectOffset, view, viewOffset, win, winOffset)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLGLU:gluUnProject(gl, winX, winY, winZ, model, modelOffset, project, projectOffset, view, viewOffset, obj, objOffset)
        error(require("java.lang.RuntimeException").new(), 0)
end


function OpenGLGLU:glFrustumf(gl, lt, rt, btm, top, zNear, zFar)
        error(require("java.lang.RuntimeException").new(), 0)
end

OpenGLGLU.instance_f = OpenGLGLU.new()

return OpenGLGLU


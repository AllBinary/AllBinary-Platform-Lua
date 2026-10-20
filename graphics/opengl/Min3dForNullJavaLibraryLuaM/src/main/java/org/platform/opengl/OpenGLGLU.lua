-- Generated Code Do Not Modify
-- package org.platform.opengl

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLGLU = {}
OpenGLGLU.__index = OpenGLGLU
OpenGLGLU.className = "OpenGLGLU"

function OpenGLGLU.new()
    local self = setmetatable({}, OpenGLGLU)
    return self
end


function OpenGLGLU.getInstance()
        return OpenGLGLU.instance
end


function OpenGLGLU:gluLookAt(gl, eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLGLU:gluProject(gl, objX, objY, objZ, model, modelOffset, project, projectOffset, view, viewOffset, win, winOffset)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLGLU:gluUnProject(gl, winX, winY, winZ, model, modelOffset, project, projectOffset, view, viewOffset, obj, objOffset)
        error(java_exception("RuntimeException"), 0)
end


function OpenGLGLU:glFrustumf(gl, lt, rt, btm, top, zNear, zFar)
        error(java_exception("RuntimeException"), 0)
end

OpenGLGLU.instance = OpenGLGLU.new()

return OpenGLGLU


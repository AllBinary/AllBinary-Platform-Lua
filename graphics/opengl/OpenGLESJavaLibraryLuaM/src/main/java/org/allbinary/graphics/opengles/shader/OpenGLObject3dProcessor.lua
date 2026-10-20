-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles.shader

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLObject3dProcessor = {}
OpenGLObject3dProcessor.__index = OpenGLObject3dProcessor
OpenGLObject3dProcessor.className = "OpenGLObject3dProcessor"

function OpenGLObject3dProcessor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function OpenGLObject3dProcessor.new()
    local self = setmetatable({}, OpenGLObject3dProcessor)
    self:_init_fields()
    return self
end


function OpenGLObject3dProcessor:process(gl, object3d)
end


-- Java overloaded method: Lua keeps the last definition
function OpenGLObject3dProcessor:process(gl, object3d, index)
end

return OpenGLObject3dProcessor


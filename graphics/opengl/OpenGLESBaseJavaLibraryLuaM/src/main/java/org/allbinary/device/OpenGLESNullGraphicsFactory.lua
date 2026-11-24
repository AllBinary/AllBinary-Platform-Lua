-- Generated Code Do Not Modify
-- package org.allbinary.device

local OpenGLESNullGraphicsFactory = {}
package.loaded["org.allbinary.device.OpenGLESNullGraphicsFactory"] = OpenGLESNullGraphicsFactory

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

local OpenGLESGraphics = java_lazy("org.allbinary.device.OpenGLESGraphics")

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

-- class table OpenGLESNullGraphicsFactory is declared before the requires
OpenGLESNullGraphicsFactory.__index = OpenGLESNullGraphicsFactory
OpenGLESNullGraphicsFactory.className = "OpenGLESNullGraphicsFactory"
OpenGLESNullGraphicsFactory.javaClassName = "org.allbinary.device.OpenGLESNullGraphicsFactory"

function OpenGLESNullGraphicsFactory._jinit(self)
    return self
end

function OpenGLESNullGraphicsFactory.new()
    return OpenGLESNullGraphicsFactory._jinit(setmetatable({}, OpenGLESNullGraphicsFactory))
end


function OpenGLESNullGraphicsFactory.getInstance()
        return OpenGLESNullGraphicsFactory.instance_f
end

OpenGLESNullGraphicsFactory.instance_f = OpenGLESGraphics.new()

return OpenGLESNullGraphicsFactory


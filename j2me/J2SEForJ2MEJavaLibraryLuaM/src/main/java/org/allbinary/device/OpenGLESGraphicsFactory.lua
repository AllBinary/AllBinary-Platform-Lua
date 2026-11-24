-- Generated Code Do Not Modify
-- package org.allbinary.device

local OpenGLESGraphicsFactory = {}
package.loaded["org.allbinary.device.OpenGLESGraphicsFactory"] = OpenGLESGraphicsFactory

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

-- class table OpenGLESGraphicsFactory is declared before the requires
OpenGLESGraphicsFactory.__index = OpenGLESGraphicsFactory
OpenGLESGraphicsFactory.className = "OpenGLESGraphicsFactory"
OpenGLESGraphicsFactory.javaClassName = "org.allbinary.device.OpenGLESGraphicsFactory"

function OpenGLESGraphicsFactory._jinit(self)
    return self
end

function OpenGLESGraphicsFactory.new()
    return OpenGLESGraphicsFactory._jinit(setmetatable({}, OpenGLESGraphicsFactory))
end


function OpenGLESGraphicsFactory:getOpenGLESGraphicsInstance()
        return OpenGLESNullGraphicsFactory.getInstance()
end

return OpenGLESGraphicsFactory


-- Generated Code Do Not Modify
-- package org.allbinary.image.opengles

local OpenGLStrings = {}
package.loaded["org.allbinary.image.opengles.OpenGLStrings"] = OpenGLStrings

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

-- class table OpenGLStrings is declared before the requires
OpenGLStrings.__index = OpenGLStrings
OpenGLStrings.className = "OpenGLStrings"
OpenGLStrings.javaClassName = "org.allbinary.image.opengles.OpenGLStrings"

function OpenGLStrings:_init_fields()
    self.GL_ERROR_LABEL = "GLError: "
    self.SET = "set(GL10)"
end

function OpenGLStrings._jinit(self)
    OpenGLStrings._init_fields(self)
    return self
end

function OpenGLStrings.new()
    return OpenGLStrings._jinit(setmetatable({}, OpenGLStrings))
end


function OpenGLStrings.getInstance()
        return OpenGLStrings.instance_f
end

OpenGLStrings.instance_f = OpenGLStrings.new()

return OpenGLStrings


-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

local OpenGLProcessor = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLProcessor"] = OpenGLProcessor

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

local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table OpenGLProcessor is declared before the requires
OpenGLProcessor.__index = OpenGLProcessor
OpenGLProcessor.className = "OpenGLProcessor"
OpenGLProcessor.javaClassName = "org.allbinary.graphics.opengles.OpenGLProcessor"

function OpenGLProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function OpenGLProcessor._jinit(self)
    OpenGLProcessor._init_fields(self)
    return self
end

function OpenGLProcessor.new()
    return OpenGLProcessor._jinit(setmetatable({}, OpenGLProcessor))
end


function OpenGLProcessor:process(gl)
end

return OpenGLProcessor


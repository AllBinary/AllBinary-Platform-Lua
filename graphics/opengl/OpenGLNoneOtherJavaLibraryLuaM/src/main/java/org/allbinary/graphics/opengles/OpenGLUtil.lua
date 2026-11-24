-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

local OpenGLUtil = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLUtil"] = OpenGLUtil

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

-- local Image = require("javax.microedition.lcdui.Image")

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

-- class table OpenGLUtil is declared before the requires
OpenGLUtil.__index = OpenGLUtil
OpenGLUtil.className = "OpenGLUtil"
OpenGLUtil.javaClassName = "org.allbinary.graphics.opengles.OpenGLUtil"

function OpenGLUtil._jinit(self)
    return self
end

function OpenGLUtil.new()
    return OpenGLUtil._jinit(setmetatable({}, OpenGLUtil))
end


function OpenGLUtil.getInstance()
        return OpenGLUtil.instance_f
end


function OpenGLUtil:addImage(image)
        return image
end


function OpenGLUtil:clear()
end


function OpenGLUtil:addRunnable(runnable)
end

OpenGLUtil.instance_f = OpenGLUtil.new()

return OpenGLUtil


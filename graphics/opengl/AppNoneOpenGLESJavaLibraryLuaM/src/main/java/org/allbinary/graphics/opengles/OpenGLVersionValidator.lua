-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.graphics.opengles

local OpenGLVersionValidator = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLVersionValidator"] = OpenGLVersionValidator

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

local ShaderComposite = java_lazy("org.allbinary.graphics.opengles.shader.ShaderComposite")

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

-- class table OpenGLVersionValidator is declared before the requires
OpenGLVersionValidator.__index = OpenGLVersionValidator
OpenGLVersionValidator.className = "OpenGLVersionValidator"
OpenGLVersionValidator.javaClassName = "org.allbinary.graphics.opengles.OpenGLVersionValidator"

function OpenGLVersionValidator:_init_fields()
    self.EGL_CONTEXT_CLIENT_VERSION_VALUE = -1
end

function OpenGLVersionValidator._jinit(self)
    OpenGLVersionValidator._init_fields(self)
    return self
end

function OpenGLVersionValidator.new()
    return OpenGLVersionValidator._jinit(setmetatable({}, OpenGLVersionValidator))
end


function OpenGLVersionValidator.getInstance()
        return OpenGLVersionValidator.instance_f
end


function OpenGLVersionValidator:isGL31OrHigher()
        return false
end


function OpenGLVersionValidator:isAvailable(glVersionRequired)
        return false
end


function OpenGLVersionValidator:setShaderComposite(shaderComposite, anyType)
end

OpenGLVersionValidator.instance_f = OpenGLVersionValidator.new()

return OpenGLVersionValidator


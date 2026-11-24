--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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

local OpenGLCapabilities = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLCapabilities"] = OpenGLCapabilities

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table OpenGLCapabilities is declared before the requires
OpenGLCapabilities.__index = OpenGLCapabilities
OpenGLCapabilities.className = "OpenGLCapabilities"
OpenGLCapabilities.javaClassName = "org.allbinary.graphics.opengles.OpenGLCapabilities"

function OpenGLCapabilities:_init_fields()
    self.CUSTOM_GL_SURFACE_VIEW = true
    self.VERSION_1_0 = "1.0"
    self.VERSION_1_1 = "1.1"
    self.VERSION_2_0 = "2.0"
    self.VERSION_3_0 = "3.0"
    self.VERSION_3_1 = "3.1"
    self.VERSION_3_2 = "3.2"
    self.VERSION_HIGHER_THAN_EXISTS = "999.999"
    self.glVersion = StringUtil.getInstance().EMPTY_STRING
    self.shaderVersion = 0
    self.glInstanceVersion = StringUtil.getInstance().EMPTY_STRING
    self.maxTextureSize = 64
end


function OpenGLCapabilities.getInstance()
        return OpenGLCapabilities.instance_f
end


function OpenGLCapabilities._jinit(self)
    OpenGLCapabilities._init_fields(self)
    return self
end

function OpenGLCapabilities.new(...)
    local self = setmetatable({}, OpenGLCapabilities)
    OpenGLCapabilities._jinit(self, ...)
    return self
end


function OpenGLCapabilities:isInitialized()
        return true
end


function OpenGLCapabilities:initCapabilities(gl)
end


function OpenGLCapabilities:isGlExtensionDrawTexture()
        return false
end


function OpenGLCapabilities:getGlVersion()
        return self.glVersion
end


function OpenGLCapabilities:isVertexBufferObjectSupport()
        return false
end


function OpenGLCapabilities:isTextureSizeValid(widthAndHeight)
        return true
end

OpenGLCapabilities.instance_f = OpenGLCapabilities.new()

return OpenGLCapabilities


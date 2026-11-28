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

local OpenGLFeatureUtil = {}
package.loaded["org.allbinary.graphics.opengles.OpenGLFeatureUtil"] = OpenGLFeatureUtil

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local OpenGLConfiguration = java_lazy("org.allbinary.graphics.opengles.OpenGLConfiguration")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")

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

-- class table OpenGLFeatureUtil is declared before the requires
OpenGLFeatureUtil.__index = OpenGLFeatureUtil
OpenGLFeatureUtil.className = "OpenGLFeatureUtil"
OpenGLFeatureUtil.javaClassName = "org.allbinary.graphics.opengles.OpenGLFeatureUtil"

function OpenGLFeatureUtil:_init_fields()
    if self.anyThreed == nil then self.anyThreed = false end
end


function OpenGLFeatureUtil.getInstance()
        return OpenGLFeatureUtil.instance_f
end


function OpenGLFeatureUtil._jinit(self)
    OpenGLFeatureUtil._init_fields(self)
        local openGLConfiguration = OpenGLConfiguration.getInstance()
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        self.anyThreed = openGLConfiguration:isOpenGL() and (features:isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) or features:isFeature(openGLFeatureFactory.OPENGL_3D))
    return self
end

function OpenGLFeatureUtil.new(...)
    local self = setmetatable({}, OpenGLFeatureUtil)
    OpenGLFeatureUtil._jinit(self, ...)
    return self
end


function OpenGLFeatureUtil:isAnyThreed()
        return self.anyThreed
end

OpenGLFeatureUtil.instance_f = OpenGLFeatureUtil.new()

return OpenGLFeatureUtil


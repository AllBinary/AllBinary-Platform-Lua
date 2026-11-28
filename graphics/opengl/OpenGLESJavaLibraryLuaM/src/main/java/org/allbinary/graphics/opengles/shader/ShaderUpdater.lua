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
-- package org.allbinary.graphics.opengles.shader

local ShaderUpdater = {}
package.loaded["org.allbinary.graphics.opengles.shader.ShaderUpdater"] = ShaderUpdater

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

local EGLConfig = java_lazy("javax.microedition.khronos.egl.EGLConfig")
local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local RendererStrings = java_lazy("org.allbinary.graphics.opengles.renderer.RendererStrings")
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

-- class table ShaderUpdater is declared before the requires
ShaderUpdater.__index = ShaderUpdater
ShaderUpdater.className = "ShaderUpdater"
ShaderUpdater.javaClassName = "org.allbinary.graphics.opengles.shader.ShaderUpdater"

function ShaderUpdater:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.rendererStrings = RendererStrings.getInstance()
end

function ShaderUpdater._jinit(self)
    ShaderUpdater._init_fields(self)
    return self
end

function ShaderUpdater.new()
    return ShaderUpdater._jinit(setmetatable({}, ShaderUpdater))
end


function ShaderUpdater.getInstance()
        return ShaderUpdater.instance_f
end


function ShaderUpdater:onSurfaceCreated(gl, eglConfig)
end

ShaderUpdater.instance_f = ShaderUpdater.new()

return ShaderUpdater


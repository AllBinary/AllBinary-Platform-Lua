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

local ShaderManager = {}
package.loaded["org.allbinary.graphics.opengles.shader.ShaderManager"] = ShaderManager

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
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table ShaderManager is declared before the requires
ShaderManager.__index = ShaderManager
ShaderManager.className = "ShaderManager"
ShaderManager.javaClassName = "org.allbinary.graphics.opengles.shader.ShaderManager"

function ShaderManager:_init_fields()
    self.LOAD_SHADER = "loadShader"
    self.commonStrings = CommonStrings.getInstance()
    if self.GL_VERTEX_SHADER == nil then self.GL_VERTEX_SHADER = 0 end
    if self.GL_FRAGMENT_SHADER == nil then self.GL_FRAGMENT_SHADER = 0 end
end


function ShaderManager.getInstance()
        return ShaderManager.instance_f
end


function ShaderManager._jinit(self, GL_VERTEX_SHADER, GL_FRAGMENT_SHADER)
    ShaderManager._init_fields(self)
        self.GL_VERTEX_SHADER = GL_VERTEX_SHADER
        self.GL_FRAGMENT_SHADER = GL_FRAGMENT_SHADER
    return self
end

function ShaderManager.new(...)
    local self = setmetatable({}, ShaderManager)
    ShaderManager._jinit(self, ...)
    return self
end


function ShaderManager:load(gl, resource, shaderAsStringArray, shaderType)
        return -1
end


function ShaderManager:loadShader(gl, resource, stringList, shaderType)
        return -1
end

ShaderManager.instance_f = ShaderManager.new(-1, -1)

return ShaderManager


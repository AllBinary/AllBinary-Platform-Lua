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

local Shader = {}
package.loaded["org.allbinary.graphics.opengles.shader.Shader"] = Shader

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")

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

-- class table Shader is declared before the requires
Shader.__index = Shader
Shader.className = "Shader"
Shader.javaClassName = "org.allbinary.graphics.opengles.shader.Shader"

function Shader:_init_fields()
    self.shaderName = StringUtil.getInstance().EMPTY_STRING
    self.shaderStringList = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.shaderAsString = StringUtil.getInstance().EMPTY_STRING
    if self.shaderHandle == nil then self.shaderHandle = 0 end
end

function Shader._jinit(self)
    Shader._init_fields(self)
    return self
end

function Shader.new()
    return Shader._jinit(setmetatable({}, Shader))
end

return Shader


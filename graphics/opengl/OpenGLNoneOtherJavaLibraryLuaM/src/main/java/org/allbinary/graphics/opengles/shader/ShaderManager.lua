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

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShaderManager = {}
ShaderManager.__index = ShaderManager
ShaderManager.className = "ShaderManager"

function ShaderManager:_init_fields()
    self.LOAD_SHADER = "loadShader"
    self.commonStrings = CommonStrings.getInstance()
    self.GL_VERTEX_SHADER = nil
    self.GL_FRAGMENT_SHADER = nil
end


function ShaderManager.getInstance()
        return ShaderManager.instance
end


function ShaderManager.new(GL_VERTEX_SHADER, GL_FRAGMENT_SHADER)
    local self = setmetatable({}, ShaderManager)
    self:_init_fields()
        self.GL_VERTEX_SHADER = GL_VERTEX_SHADER
        self.GL_FRAGMENT_SHADER = GL_FRAGMENT_SHADER
    return self
end


function ShaderManager:load(gl, resource, shaderAsStringArray, shaderType)
        return -1
end


function ShaderManager:loadShader(gl, resource, stringList, shaderType)
        return -1
end

ShaderManager.instance = ShaderManager.new(-1, -1)

return ShaderManager


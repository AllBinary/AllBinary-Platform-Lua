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

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Shader = {}
Shader.__index = Shader
Shader.className = "Shader"

function Shader:_init_fields()
    self.shaderName = StringUtil.getInstance().EMPTY_STRING
    self.shaderStringList = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.shaderAsString = StringUtil.getInstance().EMPTY_STRING
    self.shaderHandle = 0
end

function Shader.new()
    local self = setmetatable({}, Shader)
    self:_init_fields()
    return self
end

return Shader


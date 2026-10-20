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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShaderInitializer = {}
ShaderInitializer.__index = ShaderInitializer
ShaderInitializer.className = "ShaderInitializer"

function ShaderInitializer:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function ShaderInitializer.new()
    local self = setmetatable({}, ShaderInitializer)
    self:_init_fields()
    return self
end


function ShaderInitializer.getInstance()
        return ShaderInitializer.instance
end


function ShaderInitializer:init(gl, shader, attributeArray)
        return -1
end

ShaderInitializer.instance = ShaderInitializer.new()

return ShaderInitializer


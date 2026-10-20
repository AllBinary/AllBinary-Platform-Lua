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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShaderStrings = {}
ShaderStrings.__index = ShaderStrings
ShaderStrings.className = "ShaderStrings"

function ShaderStrings:_init_fields()
    self.NO_PROGRAM_HANDLE = "No program handle"
    self.UNIFORM_BLOCK_HANDLE = "Uniform Block Handle: "
    self.UNIFORM_HANDLE = "Uniform Handle: "
    self.UNIFORM_ATTRIBUTE_HANDLE = "Uniform Attribute Handle: "
end

function ShaderStrings.new()
    local self = setmetatable({}, ShaderStrings)
    self:_init_fields()
    return self
end


function ShaderStrings.getInstance()
        return ShaderStrings.instance
end

ShaderStrings.instance = ShaderStrings.new()

return ShaderStrings


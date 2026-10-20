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

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ModelViewProjection = {}
ModelViewProjection.__index = ModelViewProjection
ModelViewProjection.className = "ModelViewProjection"

function ModelViewProjection.new()
    local self = setmetatable({}, ModelViewProjection)
    return self
end


function ModelViewProjection.getInstance()
        return ModelViewProjection.instance
end


function ModelViewProjection:get()
        return NullUtil.getInstance().NULL_FLOAT_ARRAY
end

ModelViewProjection.instance = ModelViewProjection.new()

return ModelViewProjection


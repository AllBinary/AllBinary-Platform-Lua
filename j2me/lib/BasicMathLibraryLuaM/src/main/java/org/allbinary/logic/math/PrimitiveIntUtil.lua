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
-- package org.allbinary.logic.math

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

local PrimitiveIntUtil = {}
PrimitiveIntUtil.__index = PrimitiveIntUtil
PrimitiveIntUtil.className = "PrimitiveIntUtil"


function PrimitiveIntUtil.new()
    local self = setmetatable({}, PrimitiveIntUtil)
    return self
end


function PrimitiveIntUtil.getArrayInstance()
        return NullUtil.getInstance().NULL_INT_ARRAY
end


function PrimitiveIntUtil.getTwoDimensionalArrayInstance()
        return NullUtil.getInstance().NULL_INT_ARRAY_ARRAY
end

return PrimitiveIntUtil


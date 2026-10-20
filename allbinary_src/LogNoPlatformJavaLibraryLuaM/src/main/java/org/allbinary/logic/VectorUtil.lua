-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.logic

-- local Vector = require("java.util.Vector")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorUtil = {}
VectorUtil.__index = VectorUtil
VectorUtil.className = "VectorUtil"

function VectorUtil.new()
    local self = setmetatable({}, VectorUtil)
    return self
end


function VectorUtil.getInstance()
        return VectorUtil.instance
end


function VectorUtil:getSize(anyType)
        local vector = anyType
        return vector:size()
end


function VectorUtil:elementAt(anyType, index)
        local vector = anyType
        return vector:elementAt(index)
end

VectorUtil.instance = VectorUtil.new()

return VectorUtil


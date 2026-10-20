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
-- package org.allbinary.logic

local JsType = require("jsinterop.annotations.JsType")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local NullUtil = {}
NullUtil.__index = NullUtil
NullUtil.className = "NullUtil"

function NullUtil:_init_fields()
    self.NULL_OBJECT = Any.new()
    self.NULL_CLASS = getmetatable(self.NULL_OBJECT)
    self.NULL_OBJECT_ARRAY = java_new_array(nil, 0)
    self.NULL_CHAR_ARRAY = java_new_array("\0", 0)
    self.NULL_BYTE_ARRAY = java_new_array(0, 0)
    self.NULL_SHORT_ARRAY_ARRAY = java_new_array(0, 0, 0)
    self.NULL_INT_ARRAY = java_new_array(0, 0)
    self.NULL_INT_ARRAY_ARRAY = java_new_array(0, 0, 0)
    self.NULL_INT_ARRAY_ARRAY_ARRAY = java_new_array(0, 0, 0, 0)
    self.NULL_FLOAT_ARRAY = java_new_array(0.0, 0)
end

function NullUtil.new()
    local self = setmetatable({}, NullUtil)
    self:_init_fields()
    return self
end


function NullUtil.getInstance()
        return NullUtil.instance
end

NullUtil.instance = NullUtil.new()

return NullUtil


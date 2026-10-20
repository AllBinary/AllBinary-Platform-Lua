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
-- package org.allbinary.graphics

local BaseCircularPool = require("org.allbinary.logic.util.cache.BaseCircularPool")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

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

local GPointCircularPool = {}
GPointCircularPool.__index = GPointCircularPool
GPointCircularPool.className = "GPointCircularPool"
setmetatable(GPointCircularPool, {__index = BaseCircularPool})


function GPointCircularPool.new(size)
    local self = setmetatable(BaseCircularPool.new(), GPointCircularPool)
        self.circularIndexUtil = CircularIndexUtil.createInstance(size)
        self.OBJECT_ARRAY = java_new_array(nil, size)
        for index = size - 1, 0, -1 do
            self.OBJECT_ARRAY[index + 1] = CustomGPoint.getInstance3(0, 0)
        end
    return self
end

return GPointCircularPool


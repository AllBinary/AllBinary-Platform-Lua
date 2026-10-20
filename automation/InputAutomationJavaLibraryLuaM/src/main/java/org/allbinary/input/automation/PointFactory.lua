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
-- package org.allbinary.input.automation

-- local awt = require("java.awt")

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

local PointFactory = {}
PointFactory.__index = PointFactory
PointFactory.className = "PointFactory"


function PointFactory.new()
    local self = setmetatable({}, PointFactory)
    return self
end


function PointFactory.getInstance(x, y)
        local point = PointFactory.pointArray[x + 1][y + 1]
        if point == nil then
            PointFactory.pointArray[x + 1][y + 1] = Point.new(x, y)
            point = PointFactory.pointArray[x + 1][y + 1]
        end
        return point
end

PointFactory.pointArray = java_new_array(nil, 3000, 3000)

return PointFactory


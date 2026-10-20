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
-- package org.allbinary.vector


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

local PointsUtil = {}
PointsUtil.__index = PointsUtil
PointsUtil.className = "PointsUtil"

function PointsUtil.new()
    local self = setmetatable({}, PointsUtil)
    return self
end


function PointsUtil.getInstance()
        return PointsUtil.instance
end


function PointsUtil:adjustXY(points, x, y)
        local size = (points.n or #points)
        local newPoints = java_new_array(0, size, 0, 0)
        for index = 0, size - 1 do
            local size2 = (points[index + 1].n or #points[index + 1])
            newPoints[index + 1] = java_new_array(0, size2, 2)
            for index2 = 0, size2 - 1 do
                if points[index + 1][index2 + 1][1] ~= 1000 then
                    newPoints[index + 1][index2 + 1][1] = points[index + 1][index2 + 1][1] + x
                    newPoints[index + 1][index2 + 1][2] = points[index + 1][index2 + 1][2] + y
                else
                    newPoints[index + 1][index2 + 1][1] = 1000
                    newPoints[index + 1][index2 + 1][2] = 1000
                end
            end
        end
        return newPoints
end


function PointsUtil:adjust(points, both)
        return self:adjust(points, both, both)
end


-- Java overloaded method: Lua keeps the last definition
function PointsUtil:adjust(points, x, y)
        local newPoints = java_new_array(0, (points.n or #points), 2)
        for index2 = 0, (points.n or #points) - 1 do
            if points[index2 + 1][1] ~= 1000 then
                newPoints[index2 + 1][1] = points[index2 + 1][1] + x
                newPoints[index2 + 1][2] = points[index2 + 1][2] + y
            else
                newPoints[index2 + 1][1] = 1000
                newPoints[index2 + 1][2] = 1000
            end
        end
        return newPoints
end

PointsUtil.instance = PointsUtil.new()

return PointsUtil


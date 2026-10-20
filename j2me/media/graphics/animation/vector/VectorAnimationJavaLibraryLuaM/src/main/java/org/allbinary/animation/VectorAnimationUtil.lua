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
-- package org.allbinary.animation

local GPoint = require("org.allbinary.graphics.GPoint")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local VectorAnimationUtil = {}
VectorAnimationUtil.__index = VectorAnimationUtil
VectorAnimationUtil.className = "VectorAnimationUtil"


function VectorAnimationUtil.getInstance()
        return VectorAnimationUtil.instance
end


function VectorAnimationUtil.new()
    local self = setmetatable({}, VectorAnimationUtil)
    return self
end


function VectorAnimationUtil:toAnimationArrayFromListOfPointListWithPointsPerFrame(vector, pointsPerFrame)
        local size = vector:size()
        local points = java_new_array(0, size, pointsPerFrame, 2)
        local nextBasicArrayList = nil
        local framePoints = nil
        for index = 0, size - 1 do
            nextBasicArrayList = vector.objectArray[index + 1]
            framePoints = self:toFrameArrayFromPointBasicArrayList(nextBasicArrayList)
            for pointIndex = 0, (framePoints.n or #framePoints) - 1 do
                points[index + 1][pointIndex + 1][1] = framePoints[pointIndex + 1][1]
                points[index + 1][pointIndex + 1][2] = framePoints[pointIndex + 1][2]
            end
        end
        return points
end


function VectorAnimationUtil:toAnimationArrayFromListOfPointList(vector)
        local size = vector:size()
        local points = java_new_array(0, size, 0, 0)
        local nextBasicArrayList = nil
        local framePoints = nil
        for index = 0, size - 1 do
            nextBasicArrayList = vector.objectArray[index + 1]
            framePoints = self:toFrameArrayFromPointBasicArrayList(nextBasicArrayList)
            points[index + 1] = java_new_array(0, (framePoints.n or #framePoints), 2)
            for pointIndex = 0, (framePoints.n or #framePoints) - 1 do
                points[index + 1][pointIndex + 1][1] = framePoints[pointIndex + 1][1]
                points[index + 1][pointIndex + 1][2] = framePoints[pointIndex + 1][2]
            end
        end
        return points
end


function VectorAnimationUtil:toFrameArrayFromPointBasicArrayList(list)
        local points = java_new_array(0, list:size(), 2)
        local size = list:size()
        for index = 0, size - 1 do
            local nextPoint = list.objectArray[index + 1]
            points[index + 1][1] = nextPoint:getX()
            points[index + 1][2] = nextPoint:getY()
        end
        return points
end

VectorAnimationUtil.instance = VectorAnimationUtil.new()

return VectorAnimationUtil


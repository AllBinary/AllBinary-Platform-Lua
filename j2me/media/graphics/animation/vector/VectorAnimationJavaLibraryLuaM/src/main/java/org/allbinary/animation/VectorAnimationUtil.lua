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

local VectorAnimationUtil = {}
package.loaded["org.allbinary.animation.VectorAnimationUtil"] = VectorAnimationUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table VectorAnimationUtil is declared before the requires
VectorAnimationUtil.__index = VectorAnimationUtil
VectorAnimationUtil.className = "VectorAnimationUtil"
VectorAnimationUtil.javaClassName = "org.allbinary.animation.VectorAnimationUtil"


function VectorAnimationUtil.getInstance()
        return VectorAnimationUtil.instance_f
end


function VectorAnimationUtil._jinit(self)
    return self
end

function VectorAnimationUtil.new(...)
    local self = setmetatable({}, VectorAnimationUtil)
    VectorAnimationUtil._jinit(self, ...)
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

VectorAnimationUtil.instance_f = VectorAnimationUtil.new()

return VectorAnimationUtil


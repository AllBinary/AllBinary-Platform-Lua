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
local PointFactory = require("org.allbinary.graphics.PointFactory")
local RandomRotationFactory = require("org.allbinary.graphics.pipeline.RandomRotationFactory")
local RandomTranslation = require("org.allbinary.graphics.pipeline.RandomTranslation")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local VectorExplosionGenerator = {}
VectorExplosionGenerator.__index = VectorExplosionGenerator
VectorExplosionGenerator.className = "VectorExplosionGenerator"

function VectorExplosionGenerator:_init_fields()
    self.RANDOM = VectorExplosionType.new()
    self.ROTATION = VectorExplosionType.new()
    self.vectorAnimationUtil = VectorAnimationUtil.getInstance()
    self.randomRotationFactory = RandomRotationFactory.getInstance()
end


function VectorExplosionGenerator.getInstance()
        return VectorExplosionGenerator.instance
end


function VectorExplosionGenerator.new()
    local self = setmetatable({}, VectorExplosionGenerator)
    self:_init_fields()
    return self
end


-- throws Exception
function VectorExplosionGenerator:createList(list, howMuch, type)
        local point = nil
        local size = list:size()
        local points = java_new_array(0, size, 2)
        for index = 0, size - 1 do
            point = list.objectArray[index + 1]
            points[index + 1][1] = point:getX()
            points[index + 1][2] = point:getY()
        end
        return self:createListFromPoints(list, points, howMuch, type)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function VectorExplosionGenerator:getInstance(points, howMuch, type)
        local pointsBasicArrayList = self:getInstanceStartFrame(points, howMuch, type, true)
        local tempBasicArrayList = pointsBasicArrayList.objectArray[1]
        local newPoints = self.vectorAnimationUtil:toAnimationArrayFromListOfPointListWithPointsPerFrame(pointsBasicArrayList, tempBasicArrayList:size())
        return newPoints
end


-- throws Exception
function VectorExplosionGenerator:getInstanceStartFrame(points, howMuch, type, startFrame)
        local try_ok, try_error = pcall(function()
            local pointsBasicArrayList = BasicArrayListS.new(howMuch)
            pointsBasicArrayList:add(self:createPointsBasicArrayList(points))
            local frameIndex = 0
            local tempBasicArrayList = nil
            local pointBasicArrayList = nil
            while frameIndex < howMuch do
                tempBasicArrayList = pointsBasicArrayList.objectArray[frameIndex + 1]
                pointBasicArrayList = self:createListFromPoints(tempBasicArrayList, points, howMuch, type)
                pointsBasicArrayList:add(pointBasicArrayList)
                frameIndex = frameIndex + 1
            end
            if not startFrame then
                pointsBasicArrayList:removeAt(0)
            end
            return pointsBasicArrayList
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
function VectorExplosionGenerator:createListFromPoints(tempBasicArrayList, points, howMuch, type)
        local index = 0
        local pointBasicArrayList = BasicArrayListD.new()
        local sectionBasicArrayList = nil
        while index < (points.n or #points) do
            sectionBasicArrayList = BasicArrayListD.new()
            while points[index + 1][1] ~= 1000 do
                sectionBasicArrayList:add(tempBasicArrayList.objectArray[index + 1])
                index = index + 1
                if index >= (points.n or #points) then
                    break
                end
            end
            sectionBasicArrayList = RandomTranslation.getInstance(sectionBasicArrayList, howMuch)
            if type == self.ROTATION then
                sectionBasicArrayList = self.randomRotationFactory:getInstanceList(sectionBasicArrayList, howMuch)
            end
            local size = sectionBasicArrayList:size()
            for index2 = 0, size - 1 do
                pointBasicArrayList:add(sectionBasicArrayList.objectArray[index2 + 1])
            end
            if index >= (points.n or #points) then
                break
            elseif points[index + 1][1] == 1000 then
                pointBasicArrayList:add(tempBasicArrayList.objectArray[index + 1])
                index = index + 1
            end
        end
        return pointBasicArrayList
end


-- throws Exception
function VectorExplosionGenerator:createPointsBasicArrayList(points)
        if (points.n or #points) == 0 then
            error(java_exception("Exception", "Not Points Provided"), 0)
        end
        local firstPointBasicArrayList = BasicArrayListS.new((points.n or #points))
        local pointFactory = PointFactory.getInstance()
        for index = 0, (points.n or #points) - 1 do
            firstPointBasicArrayList:add(pointFactory:createXY(points[index + 1][1], points[index + 1][2]))
        end
        return firstPointBasicArrayList
end

VectorExplosionGenerator.instance = VectorExplosionGenerator.new()

return VectorExplosionGenerator


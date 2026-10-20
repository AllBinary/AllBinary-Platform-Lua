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

local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicGraphicsPipeline = require("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")
local VectorInfo = require("org.allbinary.vector.VectorInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorRotationGenerator = {}
VectorRotationGenerator.__index = VectorRotationGenerator
VectorRotationGenerator.className = "VectorRotationGenerator"

function VectorRotationGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.vectorAnimationUtil = VectorAnimationUtil.getInstance()
    self.angleFactory = AngleFactory.getInstance()
end


function VectorRotationGenerator.getInstance()
        return VectorRotationGenerator.instance
end


function VectorRotationGenerator.new()
    local self = setmetatable({}, VectorRotationGenerator)
    self:_init_fields()
    return self
end


-- Java overloaded method: Lua keeps the last definition
function VectorRotationGenerator:getInstance(vectorRotationInfo)
        return self:getInstanceFrames(vectorRotationInfo:getWidth(), vectorRotationInfo:getHeight(), vectorRotationInfo:getPoints(), vectorRotationInfo:getTotalFrames())
end


function VectorRotationGenerator:getInstanceFrames(width, height, points, frames)
        local try_ok, try_error = pcall(function()
            local totalAngle = self.angleFactory.TOTAL_ANGLE
            local angleIncrement = java_idiv(totalAngle, frames)
            local pointsBasicArrayList = BasicArrayListS.new(java_idiv(totalAngle, angleIncrement))
            local pointBasicArrayList = BasicArrayListS.new((points.n or #points))
            local pointFactory = PointFactory.getInstance()
            local size = (points.n or #points)
            for index = 0, size - 1 do
                pointBasicArrayList:add(pointFactory:createXY(points[index + 1][1], points[index + 1][2]))
            end
            local index = 0
            while index < totalAngle do
                pointsBasicArrayList:add(self:getListAtAngle(width, height, pointBasicArrayList, self.angleFactory:getAt(index)))
                index = index + (angleIncrement)
            end
            local newPoints = self.vectorAnimationUtil:toAnimationArrayFromListOfPointListWithPointsPerFrame(pointsBasicArrayList, pointBasicArrayList:size())
            return newPoints
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            return NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
        end
end


-- throws Exception
function VectorRotationGenerator:getListAtAngle(width, height, pointBasicArrayList, angle)
        local graphicsPipe = BasicGraphicsPipeline.new(pointBasicArrayList)
        graphicsPipe:createMatrix()
        graphicsPipe:translate(-(((width) // (1 << (1)))), -(((height) // (1 << (1)))))
        graphicsPipe:rotateToAngle(angle)
        graphicsPipe:translate((((width) // (1 << (1)))), (((height) // (1 << (1)))))
        return graphicsPipe:getMatrix()
end

VectorRotationGenerator.instance = VectorRotationGenerator.new()

return VectorRotationGenerator


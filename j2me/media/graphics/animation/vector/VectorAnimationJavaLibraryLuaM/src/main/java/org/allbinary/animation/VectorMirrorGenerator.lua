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
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorMirrorGenerator = {}
VectorMirrorGenerator.__index = VectorMirrorGenerator
VectorMirrorGenerator.className = "VectorMirrorGenerator"

function VectorMirrorGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.vectorAnimationUtil = VectorAnimationUtil.getInstance()
end


function VectorMirrorGenerator.getInstance()
        return VectorMirrorGenerator.instance
end


function VectorMirrorGenerator.new()
    local self = setmetatable({}, VectorMirrorGenerator)
    self:_init_fields()
    return self
end


-- Java overloaded method: Lua keeps the last definition
function VectorMirrorGenerator:getInstance(points, width)
        local try_ok, try_error = pcall(function()
            local pointFactory = PointFactory.getInstance()
            local pointBasicArrayList = nil
            local nextPoints = nil
            local size2 = 0
            local size = (points.n or #points)
            local pointsBasicArrayList = BasicArrayListS.new(size)
            for frame = 0, size - 1 do
                nextPoints = points[frame + 1]
                size2 = (nextPoints.n or #nextPoints)
                pointBasicArrayList = BasicArrayListS.new(size2)
                for index = 0, size2 - 1 do
                    pointBasicArrayList:add(pointFactory:createXY(nextPoints[index + 1][1], nextPoints[index + 1][2]))
                end
                pointsBasicArrayList:add(pointBasicArrayList)
            end
            for index = 0, (points.n or #points) - 1 do
                pointsBasicArrayList:add(self:getInstance(pointsBasicArrayList.objectArray[index + 1], width))
            end
            local newPoints = self.vectorAnimationUtil:toAnimationArrayFromListOfPointList(pointsBasicArrayList)
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
-- Java overloaded method: Lua keeps the last definition
function VectorMirrorGenerator:getInstance(pointBasicArrayList, width)
        local graphicsPipe = BasicGraphicsPipeline.new(pointBasicArrayList)
        graphicsPipe:createMatrix()
        graphicsPipe:mirror(width)
        return graphicsPipe:getMatrix()
end

VectorMirrorGenerator.instance = VectorMirrorGenerator.new()

return VectorMirrorGenerator


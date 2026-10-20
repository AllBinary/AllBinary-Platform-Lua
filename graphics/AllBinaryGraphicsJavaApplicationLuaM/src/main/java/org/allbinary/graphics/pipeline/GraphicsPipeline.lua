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
-- package org.allbinary.graphics.pipeline

local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicGraphicsPipeline = require("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GraphicsPipeline = {}
GraphicsPipeline.__index = GraphicsPipeline
GraphicsPipeline.className = "GraphicsPipeline"
setmetatable(GraphicsPipeline, {__index = BasicGraphicsPipeline})


function GraphicsPipeline.new(points)
    local self = setmetatable(BasicGraphicsPipeline.new(points), GraphicsPipeline)
        -- super(...) made self above
    return self
end


-- throws Exception
function GraphicsPipeline:rotateTheta(aTheta)
        local newVector = BasicArrayListD.new()
        local size = self.pointBasicArrayList:size()
        for index = 0, size - 1 do
            local secondPoint = self.pointBasicArrayList:get(index)
            local secondX = (secondPoint:getX() * math.cos(aTheta)) - (secondPoint:getY() * math.sin(aTheta))
            local secondY = (secondPoint:getX() * math.sin(aTheta)) + (secondPoint:getY() * math.cos(aTheta))
            local point = PointFactory.getInstance():createXY((java_int(secondX)), (java_int(secondY)))
            newVector:add(point)
        end
        self.pointBasicArrayList = newVector
end

return GraphicsPipeline


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
local Angle = require("org.allbinary.math.Angle")
local NoDecimalTrigTable = require("org.allbinary.math.NoDecimalTrigTable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGraphicsPipeline = {}
BasicGraphicsPipeline.__index = BasicGraphicsPipeline
BasicGraphicsPipeline.className = "BasicGraphicsPipeline"

function BasicGraphicsPipeline:_init_fields()
    self.pointBasicArrayList = nil
    self.noDecimalTrigTable = NoDecimalTrigTable.getInstance()
end


function BasicGraphicsPipeline.new(points)
    local self = setmetatable({}, BasicGraphicsPipeline)
    self:_init_fields()
        self.pointBasicArrayList = points
    return self
end


function BasicGraphicsPipeline:setInitMatrix(points)
        self.pointBasicArrayList = points
end


function BasicGraphicsPipeline:createMatrix()
end


-- throws Exception
function BasicGraphicsPipeline:translate(x, y)
        local newBasicArrayList = BasicArrayListD.new()
        local size = self.pointBasicArrayList:size()
        local pointFactory = PointFactory.getInstance()
        local secondPoint = nil
        for index = 0, size - 1 do
            secondPoint = self.pointBasicArrayList.objectArray[index + 1]
            if secondPoint:getX() ~= 1000 then
                newBasicArrayList:add(pointFactory:createXY(secondPoint:getX() + x, secondPoint:getY() + y))
            else
                newBasicArrayList:add(secondPoint)
            end
        end
        self.pointBasicArrayList = newBasicArrayList
end


-- throws Exception
function BasicGraphicsPipeline:rotateToAngle(angle)
        self:rotate(java_int(angle:getValue()))
end


-- throws Exception
function BasicGraphicsPipeline:rotate(angle)
        local newBasicArrayList = BasicArrayListD.new()
        local secondPoint = nil
        local y = 0
        local secondX = 0
        local secondY = 0
        local point = nil
        local pointFactory = PointFactory.getInstance()
        local size = self.pointBasicArrayList:size()
        local sin = 0
        local cos = 0
        for index = 0, size - 1 do
            secondPoint = self.pointBasicArrayList.objectArray[index + 1]
            if secondPoint:getX() ~= 1000 then
                sin = self.noDecimalTrigTable:sin(angle)
                cos = self.noDecimalTrigTable:cos(angle)
                y = secondPoint:getY() * sin
                secondX = (secondPoint:getX() * cos) - y
                secondY = (secondPoint:getX() * sin) + (secondPoint:getY() * cos)
                point = pointFactory:createXY(java_idiv(secondX, 10000), java_idiv(secondY, 10000))
                newBasicArrayList:add(point)
            else
                newBasicArrayList:add(secondPoint)
            end
        end
        self.pointBasicArrayList = newBasicArrayList
end


-- throws Exception
function BasicGraphicsPipeline:mirror(width)
        local pointFactory = PointFactory.getInstance()
        local halfWidth = (((width) // (1 << (1))))
        local newBasicArrayList = BasicArrayListD.new()
        local secondPoint = nil
        local newX = 0
        local point = nil
        local size = self.pointBasicArrayList:size()
        for index = 0, size - 1 do
            secondPoint = self.pointBasicArrayList.objectArray[index + 1]
            if secondPoint:getX() ~= 1000 then
                newX = 0
                if secondPoint:getX() > halfWidth then
                    newX = halfWidth - (secondPoint:getX() - halfWidth)
                else
                    newX = halfWidth + (halfWidth - secondPoint:getX())
                end
                point = pointFactory:createXY(newX, secondPoint:getY())
                newBasicArrayList:add(point)
            else
                newBasicArrayList:add(secondPoint)
            end
        end
        self.pointBasicArrayList = newBasicArrayList
end


function BasicGraphicsPipeline:getMatrix()
        return self.pointBasicArrayList
end

return BasicGraphicsPipeline


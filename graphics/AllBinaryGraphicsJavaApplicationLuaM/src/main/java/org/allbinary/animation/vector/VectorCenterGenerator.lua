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
-- package org.allbinary.animation.vector

-- local HashMap = require("java.util.HashMap")
local GPoint = require("org.allbinary.graphics.GPoint")
local GraphicItemInterface = require("org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface")
local LinesGraphicItem = require("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local Points = require("org.allbinary.graphics.j2me.workarea.tools.Points")
local BasicGraphicsPipeline = require("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorCenterGenerator = {}
VectorCenterGenerator.__index = VectorCenterGenerator
VectorCenterGenerator.className = "VectorCenterGenerator"

function VectorCenterGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.minX = Integer.MAX_VALUE
    self.minY = Integer.MAX_VALUE
    self.maxX = Integer.MIN_VALUE
    self.maxY = Integer.MIN_VALUE
    self.dx = 0
    self.dy = 0
    self.width = 0
    self.height = 0
end


function VectorCenterGenerator.new()
    local self = setmetatable({}, VectorCenterGenerator)
    self:_init_fields()
    return self
end


-- throws Exception
function VectorCenterGenerator:calculate(hashMap)
        local graphicItemArray = hashMap:keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = hashMap:get(graphicItemArray[index + 1])
            if item:getName() == LinesGraphicItem.getStaticName() then
                self:getInstance(item:getPointsInterface():getPoints())
            end
        end
        self.logUtil:putF("minX: " .. tostring(self.minX) .. " minY: " .. tostring(self.minY) .. " maxX: " .. tostring(self.maxX) .. " maxY: " .. tostring(self.maxY), self, self.commonStrings.GET_INSTANCE)
        self:setWidth(self.maxX - self.minX)
        self:setHeight(self.maxY - self.minY)
        local max = self:getWidth()
        if self:getHeight() > max then
            max = self:getHeight()
        end
        local middle = java_idiv(max, 2)
        local commonLabels = CommonLabels.getInstance()
        local s = tostring(StringMaker.new():append(commonLabels.WIDTH_LABEL):appendint(self:getWidth()):append(commonLabels.HEIGHT_LABEL):appendint(self:getHeight()):append(" max: "):appendint(max):append(" middle: "):appendint(middle))
        self.logUtil:putF(s, self, self.commonStrings.GET_INSTANCE)
        local currentMiddleX = self.minX + java_idiv(self:getWidth(), 2)
        local currentMiddleY = self.minY + java_idiv(self:getHeight(), 2)
        self.dx = middle - currentMiddleX
        self.dy = middle - currentMiddleY
end


-- throws Exception
function VectorCenterGenerator:transform(hashMap)
        self:calculate(hashMap)
        self.logUtil:putF(tostring(StringMaker.new():append(" dx: "):appendint(self.dx):append(" dy: "):appendint(self.dy)), self, self.commonStrings.GET_INSTANCE)
        local graphicItemArray = hashMap:keySet():toArray()
        local size = (graphicItemArray.n or #graphicItemArray)
        for index = 0, size - 1 do
            local item = hashMap:get(graphicItemArray[index + 1])
            local list = VectorCenterGenerator.translate(item:getPointsInterface():getPoints(), self.dx, self.dy)
            local newPoints = Points.new()
            newPoints:addPoints(list)
            item:setPointsInterface(newPoints)
        end
end


-- throws Exception
function VectorCenterGenerator:getInstance(pointVector)
        local try_ok, try_error = pcall(function()
            local size = pointVector:size()
            for index = 0, size - 1 do
                local point = pointVector:get(index)
                if point:getX() < self.minX then
                    self.minX = point:getX()
                end
                if point:getX() > self.maxX then
                    self.maxX = point:getX()
                end
                if point:getY() < self.minY then
                    self.minY = point:getY()
                end
                if point:getY() > self.maxY then
                    self.maxY = point:getY()
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            error(e, 0)
        end
end


-- throws Exception
function VectorCenterGenerator.translate(list, x, y)
        local graphicsPipe = BasicGraphicsPipeline.new(list)
        graphicsPipe:createMatrix()
        graphicsPipe:translate(x, y)
        return graphicsPipe:getMatrix()
end


function VectorCenterGenerator:getWidth()
        return self.width
end


function VectorCenterGenerator:setWidth(width)
        self.width = width
end


function VectorCenterGenerator:getHeight()
        return self.height
end


function VectorCenterGenerator:setHeight(height)
        self.height = height
end

return VectorCenterGenerator


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
-- package org.allbinary.media.graphics.geography.map.drop

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DropCellPositionHistory = {}
DropCellPositionHistory.__index = DropCellPositionHistory
DropCellPositionHistory.className = "DropCellPositionHistory"

function DropCellPositionHistory:_init_fields()
    self.cellPositionFactory = CellPositionFactory.getInstance()
    self.positionList = BasicArrayListD.new()
    self.layerList = BasicArrayListD.new()
end

function DropCellPositionHistory.new()
    local self = setmetatable({}, DropCellPositionHistory)
    self:_init_fields()
    return self
end


function DropCellPositionHistory.getInstance()
        return DropCellPositionHistory.SINGLETON
end


function DropCellPositionHistory:add(cellPosition, layerInterface)
        self.positionList:add(cellPosition)
        self.layerList:add(layerInterface)
end


function DropCellPositionHistory:addAll(list, layerInterface)
        for index = list:size() - 1, 0, -1 do
            self:add(list:get(index), layerInterface)
        end
end


function DropCellPositionHistory:remove(cellPosition)
        local index = self.positionList:indexOf(cellPosition)
        if index >= 0 then
            self.positionList:removeAt(index)
            self.layerList:removeAt(index)
        end
end


function DropCellPositionHistory:removeAll(layerInterface)
        local index = 0
        while index ~= -1 do
            index = self.layerList:indexOf(layerInterface)
            if index >= 0 then
                self.positionList:removeAt(index)
                self.layerList:removeAt(index)
            end
        end
end


function DropCellPositionHistory:clear()
        self.positionList:clear()
        self.layerList:clear()
end


function DropCellPositionHistory:isCellPositionWithDrop(cellPosition)
        return self.positionList:contains(cellPosition)
end


function DropCellPositionHistory:anyCellPositionWithDrop(list)
        for index = list:size() - 1, 0, -1 do
            if self:isCellPositionWithDrop(list:get(index)) then
                return true
            end
        end
        return false
end


function DropCellPositionHistory:getCellPositionWithDrop(list)
        local cellPosition = nil
        for index = list:size() - 1, 0, -1 do
            cellPosition = list:get(index)
            if self:isCellPositionWithDrop(cellPosition) then
                return cellPosition
            end
        end
        return self.cellPositionFactory.NONE
end


function DropCellPositionHistory:getLayerInterface(cellPosition)
        local index = self.positionList:indexOf(cellPosition)
        if index >= 0 then
            return self.layerList:get(index)
        else
            return AllBinaryLayer.NULL_ALLBINARY_LAYER
        end
end

DropCellPositionHistory.SINGLETON = DropCellPositionHistory.new()

return DropCellPositionHistory


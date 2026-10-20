-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.waypoint

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CellPosition = require("org.allbinary.graphics.CellPosition")
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

local WaypointCellPositionHistory = {}
WaypointCellPositionHistory.__index = WaypointCellPositionHistory
WaypointCellPositionHistory.className = "WaypointCellPositionHistory"

function WaypointCellPositionHistory:_init_fields()
    self.positionList = BasicArrayListD.new()
    self.layerList = BasicArrayListD.new()
end

function WaypointCellPositionHistory.new()
    local self = setmetatable({}, WaypointCellPositionHistory)
    self:_init_fields()
    return self
end


function WaypointCellPositionHistory.getInstance()
        return WaypointCellPositionHistory.SINGLETON
end


function WaypointCellPositionHistory:add(cellPosition, layerInterface)
        self.positionList:add(cellPosition)
        self.layerList:add(layerInterface)
end


function WaypointCellPositionHistory:addList(list, layerInterface)
        for index = list:size() - 1, 0, -1 do
            self:add(list:get(index), layerInterface)
        end
end


function WaypointCellPositionHistory:remove(cellPosition)
        local index = self.positionList:indexOf(cellPosition)
        if index >= 0 then
            self.positionList:removeAt(index)
            self.layerList:removeAt(index)
        end
end


function WaypointCellPositionHistory:removeLayer(layerInterface)
        local index = 0
        while index ~= -1 do
            index = self.layerList:indexOf(layerInterface)
            if index >= 0 then
                self.positionList:removeAt(index)
                self.layerList:removeAt(index)
            end
        end
end


function WaypointCellPositionHistory:clear()
        self.positionList:clear()
        self.layerList:clear()
end


function WaypointCellPositionHistory:isCellPositionWithDrop(cellPosition)
        return self.positionList:contains(cellPosition)
end


function WaypointCellPositionHistory:anyCellPositionWithDrop(list)
        for index = list:size() - 1, 0, -1 do
            if self:isCellPositionWithDrop(list:get(index)) then
                return true
            end
        end
        return false
end


function WaypointCellPositionHistory:getLayerInterface(cellPosition)
        local index = self.positionList:indexOf(cellPosition)
        if index >= 0 then
            return self.layerList:get(index)
        else
            return AllBinaryLayer.NULL_ALLBINARY_LAYER
        end
end

WaypointCellPositionHistory.SINGLETON = WaypointCellPositionHistory.new()

return WaypointCellPositionHistory


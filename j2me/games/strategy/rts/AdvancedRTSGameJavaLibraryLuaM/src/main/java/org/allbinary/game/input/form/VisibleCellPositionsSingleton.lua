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
-- package org.allbinary.game.input.form

-- local SimpleTiledLayer = require("javax.microedition.lcdui.game.SimpleTiledLayer")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local BuildingEventListenerInterface = require("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local LocalPlayerBuildingEventHandler = require("org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local ScrollMapEvent = require("org.allbinary.layer.event.ScrollMapEvent")
local ScrollMapEventHandler = require("org.allbinary.layer.event.ScrollMapEventHandler")
local ScrollMapEventListenerInterface = require("org.allbinary.layer.event.ScrollMapEventListenerInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

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

local VisibleCellPositionsSingleton = {}
VisibleCellPositionsSingleton.__index = VisibleCellPositionsSingleton
VisibleCellPositionsSingleton.className = "VisibleCellPositionsSingleton"

function VisibleCellPositionsSingleton:_init_fields()
    self.stationaryVisibleCellPositions = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY
    self.visibleCellPositions = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY
    self.currentlyVisibleCellPositions = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY
    self.ALL_VISIBLE_TILEDLAYER = SimpleTiledLayer.new(0, 0, 0, 0)
    self.simpleTiledLayer = self.ALL_VISIBLE_TILEDLAYER
    self.paintSimpleTiledLayer = self.ALL_VISIBLE_TILEDLAYER
    self.currentIndex = 0
end


function VisibleCellPositionsSingleton.getInstance()
        return VisibleCellPositionsSingleton.instance
end


function VisibleCellPositionsSingleton.new()
    local self = setmetatable({}, VisibleCellPositionsSingleton)
    self:_init_fields()
        LocalPlayerBuildingEventHandler.getInstance():addListenerInterface(self)
        ScrollMapEventHandler.getInstance():addListenerInterface(self)
    return self
end


function VisibleCellPositionsSingleton:init(simpleTiledLayer)
        self.paintSimpleTiledLayer = self.ALL_VISIBLE_TILEDLAYER
        self.currentIndex = 0
        local rows = simpleTiledLayer:getRows()
        local columns = simpleTiledLayer:getColumns()
        self.stationaryVisibleCellPositions = java_new_array(0, rows, columns)
        self.visibleCellPositions = java_new_array(0, rows, columns)
        self.currentlyVisibleCellPositions = java_new_array(0, rows, columns)
        self:setSimpleTiledLayer(simpleTiledLayer)
end


function VisibleCellPositionsSingleton:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function VisibleCellPositionsSingleton:onBuildingEvent(event)
        self.paintSimpleTiledLayer = self.simpleTiledLayer
end


-- throws Exception
function VisibleCellPositionsSingleton:onMoveEvent(scrollMapEvent)
        self:move(scrollMapEvent:getDx(), scrollMapEvent:getDy())
end


function VisibleCellPositionsSingleton:addStationaryCellPositions(list)
        for index = list:size() - 1, 0, -1 do
            local cellPosition = list:get(index)
            self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] = self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] + 1
        end
end


function VisibleCellPositionsSingleton:removeStationaryCellPositions(list)
        for index = list:size() - 1, 0, -1 do
            local cellPosition = list:get(index)
            self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] = self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] - 1
        end
end


function VisibleCellPositionsSingleton:update()
        if self.currentIndex == 0 then
            local temp = self.currentlyVisibleCellPositions
            self.currentlyVisibleCellPositions = self.visibleCellPositions
            self.visibleCellPositions = temp
            for index = (self.visibleCellPositions.n or #self.visibleCellPositions) - 1, 0, -1 do
                for index2 = (self.visibleCellPositions[1].n or #self.visibleCellPositions[1]) - 1, 0, -1 do
                    self.visibleCellPositions[index + 1][index2 + 1] = self.stationaryVisibleCellPositions[index + 1][index2 + 1]
                end
            end
        end
        self.currentIndex = self.currentIndex + 1
        if self.currentIndex > 10 then
            self.currentIndex = 0
        end
end


function VisibleCellPositionsSingleton:shouldProcess()
        if self.currentIndex == 0 then
            return true
        else
            return false
        end
end


function VisibleCellPositionsSingleton:addCellPositions(list)
        for index = list:size() - 1, 0, -1 do
            local cellPosition = list:get(index)
            self.visibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] = self.visibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] + 1
        end
end


function VisibleCellPositionsSingleton:isVisible(cellPosition)
        if self.visibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] > 0 then
            return true
        else
            return false
        end
end


function VisibleCellPositionsSingleton:move(dx, dy)
        self:getSimpleTiledLayer():moveDXY(dx, dy)
end


function VisibleCellPositionsSingleton:paint(graphics)
        self.paintSimpleTiledLayer:paint(graphics, self.currentlyVisibleCellPositions)
end


function VisibleCellPositionsSingleton:setSimpleTiledLayer(simpleTiledLayer)
        self.simpleTiledLayer = simpleTiledLayer
end


function VisibleCellPositionsSingleton:getSimpleTiledLayer()
        return self.simpleTiledLayer
end

VisibleCellPositionsSingleton.instance = VisibleCellPositionsSingleton.new()

return VisibleCellPositionsSingleton


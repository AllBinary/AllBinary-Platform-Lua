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
-- package org.allbinary.media.graphics.geography.map.racetrack.drop

local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local DropLayerFactory = require("org.allbinary.game.layer.drop.DropLayerFactory")
local PickupLayerCircularStaticPool = require("org.allbinary.game.layer.pickup.PickupLayerCircularStaticPool")
local RaceTrackPickupLayer = require("org.allbinary.game.layer.pickup.RaceTrackPickupLayer")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local GPoint = require("org.allbinary.graphics.GPoint")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local RaceTrackDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackDropCellPositionGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackRandomDropCellPositionGenerator = {}
RaceTrackRandomDropCellPositionGenerator.__index = RaceTrackRandomDropCellPositionGenerator
RaceTrackRandomDropCellPositionGenerator.className = "RaceTrackRandomDropCellPositionGenerator"
setmetatable(RaceTrackRandomDropCellPositionGenerator, {__index = RaceTrackDropCellPositionGenerator})

function RaceTrackRandomDropCellPositionGenerator:_init_fields()
    self.myRandomFactory = MyRandomFactory.getInstance()
    self.cellsPerRowOrColumn = 3
    self.totalCells = self.cellsPerRowOrColumn * self.cellsPerRowOrColumn
    self.rowArray = {0, 1, 2, 0, 1, 2, 0, 1, 2}
    self.columnArray = {0, 0, 0, 1, 1, 1, 2, 2, 2}
    self.cellWidth = 0
    self.cellHeight = 0
end


function RaceTrackRandomDropCellPositionGenerator.getInstance()
        return RaceTrackRandomDropCellPositionGenerator.SINGLETON
end


function RaceTrackRandomDropCellPositionGenerator.new()
    local self = setmetatable(RaceTrackDropCellPositionGenerator.new(), RaceTrackRandomDropCellPositionGenerator)
    self:_init_fields()
    return self
end


-- throws Exception
function RaceTrackRandomDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        RaceTrackDropCellPositionGenerator.update(self, allBinaryGameLayerManager, geographicMapInterface)
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        self.cellWidth = tiledLayer:getCellWidth() / self.cellsPerRowOrColumn
        self.cellHeight = tiledLayer:getCellHeight() / self.cellsPerRowOrColumn
end


-- throws Exception
function RaceTrackRandomDropCellPositionGenerator:drop(allBinaryLayerManager, index)
        local geographicMapCellPosition = self.list:get(index)
        local point = geographicMapCellPosition:getPoint()
        local randomCell = self.myRandomFactory:getAbsoluteNextInt(self.totalCells)
        local row = self.rowArray[randomCell + 1]
        local column = self.columnArray[randomCell + 1]
        local x = point:getX() + (row * self.cellWidth)
        local y = point:getY() + (column * self.cellHeight)
        local pickedUpLayerInterfaceFactory = DropLayerFactory.getInstance():getRandomInstance()
        local tiledLayer = self.raceTrackGeographicMap:getAllBinaryTiledLayer()
        local pickupLayer = PickupLayerCircularStaticPool.getInstance():getInstanceXYZ(pickedUpLayerInterfaceFactory, x, y, tiledLayer:getZP() + 3)
        pickupLayer:setTiledLayer(tiledLayer)
        allBinaryLayerManager:append(pickupLayer)
end

RaceTrackRandomDropCellPositionGenerator.SINGLETON = RaceTrackRandomDropCellPositionGenerator.new()

return RaceTrackRandomDropCellPositionGenerator


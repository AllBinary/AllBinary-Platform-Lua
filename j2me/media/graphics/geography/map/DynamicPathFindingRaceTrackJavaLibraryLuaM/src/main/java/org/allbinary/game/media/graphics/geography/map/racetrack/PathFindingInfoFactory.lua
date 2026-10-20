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
-- package org.allbinary.game.media.graphics.geography.map.racetrack

local CommonStrings = require("org.allbinary.string.CommonStrings")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local BasicGeographicMapUtil = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local BasePathFindingInfoFactory = require("org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local RaceTrackRoadsGeographicMapCellHistoryFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local PathFindingNodeCostInfoFactoryBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase")
local BasicGeographicMapGraph = require("org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapGraph")
local BasicGeographicMapPathFinder = require("org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapPathFinder")
local PathFinderGraphVisitorFactoryBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathFindingNodeCostInfoFactory = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactory")
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

local PathFindingInfoFactory = {}
PathFindingInfoFactory.__index = PathFindingInfoFactory
PathFindingInfoFactory.className = "PathFindingInfoFactory"
setmetatable(PathFindingInfoFactory, {__index = BasePathFindingInfoFactory})

function PathFindingInfoFactory:_init_fields()
    self.MAX_DIRECTIONS = 4
    self.pathFindingInfo = nil
    self.basicGeographicMapGraph = nil
    self.basicGeographicMapPathFinder = nil
    self.pathFinderGraphVisitorFactoryInterface = nil
end


function PathFindingInfoFactory.getInstance()
        return PathFindingInfoFactory.instance
end


function PathFindingInfoFactory.initMax(max)
        PathFindingInfoFactory.instance = PathFindingInfoFactory.new(SimplePathFinderGraphVisitorFactory.new(1, 1, Integer.MAX_VALUE), max)
end


function PathFindingInfoFactory.new(pathFinderGraphVisitorFactoryInterface, max)
    local self = setmetatable(BasePathFindingInfoFactory.new(), PathFindingInfoFactory)
    self:_init_fields()
        local commonStrings = CommonStrings.getInstance()
        PreLogUtil.put("Using Dynamic Path Finding", self, commonStrings.GET_INSTANCE)
        self.basicGeographicMapPathFinder = BasicGeographicMapPathFinder.new(max)
        self.pathFindingInfo = PathFindingInfo.new(PathFindingNodeCostInfoFactory.new(max), BasicArrayListS.new(1), BasicArrayListS.new(1))
        self.basicGeographicMapGraph = BasicGeographicMapGraph.new(self.pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface())
        self.pathFinderGraphVisitorFactoryInterface = pathFinderGraphVisitorFactoryInterface
    return self
end


-- throws Exception
function PathFindingInfoFactory:getInstancePathFindingInfo(geographicMapInterface, mapArray)
        local pathFindingInfo = PathFindingInfo.new(self.pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface(), BasicArrayListS.new(1), BasicArrayListS.new(1))
        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance():init()
        self:init(geographicMapInterface, pathFindingInfo, mapArray)
        self.basicGeographicMapPathFinder:init(geographicMapInterface, self.basicGeographicMapGraph, self.pathFinderGraphVisitorFactoryInterface:getInstance(geographicMapInterface))
        pathFindingInfo:setPathFinder(self.basicGeographicMapPathFinder)
        return pathFindingInfo
end


-- throws Exception
function PathFindingInfoFactory:init(geographicMapInterface, pathFindingInfo, mapArray)
        BasePathFindingInfoFactory.init(self, geographicMapInterface, pathFindingInfo, mapArray)
        self:buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray)
end


-- throws Exception
function PathFindingInfoFactory:buildPathFindingNodesForCellPosition(geographicMapInterface, pathFindingInfo, mapArray, cellPosition)
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local cellTypeId = mapArray[cellPosition:getRow() + 1][cellPosition:getColumn() + 1]
        local geographicMapCellType = GeographicMapCellTypeFactory.getInstance():get(geographicMapInterface:getCellTypeFromMapCellTypeInt(cellTypeId))
        local raceTrackGeographicMapCellType = geographicMapCellType
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local pathFindingNodeCostInfoFactoryInterface = pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface()
        local basicGeographicMapUtil = BasicGeographicMapUtil.getInstance()
        local row = 0
        local column = 0
        local goingToGeographicMapCellPosition = nil
        local costFromStart = 0
        local costToEnd = 0
        for index = 0, self.MAX_DIRECTIONS - 1 do
            row = basicGeographicMapUtil:getBorderingRow(index, cellPosition)
            column = basicGeographicMapUtil:getBorderingColumn(index, cellPosition)
            if row < allBinaryTiledLayer:getRows() and column < allBinaryTiledLayer:getColumns() and row >= 0 and column >= 0 then
                goingToGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(column, row)
                costFromStart = raceTrackGeographicMapCellType:getTravelCost()
                costToEnd = costFromStart
                pathFindingNodeCostInfoFactoryInterface:create(geographicMapInterface, goingToGeographicMapCellPosition, cellPosition, costFromStart, costToEnd)
            end
        end
end


-- throws Exception
function PathFindingInfoFactory:buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray)
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local totalColumns = allBinaryTiledLayer:getColumns()
        local totalRows = allBinaryTiledLayer:getRows()
        for column = 0, totalColumns - 1 do
            for row = 0, totalRows - 1 do
                self:buildPathFindingNodesForCellPosition(geographicMapInterface, pathFindingInfo, mapArray, geographicMapCellPositionFactory:getAt(column, row))
            end
        end
end

PathFindingInfoFactory.instance = nil

return PathFindingInfoFactory


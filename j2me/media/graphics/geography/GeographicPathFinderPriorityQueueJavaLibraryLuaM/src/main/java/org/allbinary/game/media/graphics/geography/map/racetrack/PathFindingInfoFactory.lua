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

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasePathFindingInfoFactory = require("org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory")
local RaceTrackRoadsGeographicMapCellHistoryFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local PathFinder = require("org.allbinary.media.graphics.geography.pathfinding.PathFinder")
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

--1.4.2
local PathFindingInfoFactory = {}
PathFindingInfoFactory.__index = PathFindingInfoFactory
PathFindingInfoFactory.className = "PathFindingInfoFactory"
setmetatable(PathFindingInfoFactory, {__index = BasePathFindingInfoFactory})

function PathFindingInfoFactory:_init_fields()
    self.pathFindingInfo = nil
    self.pathFinder = nil
end


function PathFindingInfoFactory.getInstance()
        return PathFindingInfoFactory.instance
end


function PathFindingInfoFactory.initMax(max)
        PathFindingInfoFactory.MAX = max
end


function PathFindingInfoFactory.new()
    local self = setmetatable(BasePathFindingInfoFactory.new(), PathFindingInfoFactory)
    self:_init_fields()
        self.pathFindingInfo = PathFindingInfo.new(PathFindingNodeCostInfoFactory.new(PathFindingInfoFactory.MAX), BasicArrayListS.new(1), BasicArrayListS.new(1))
        self.pathFinder = PathFinder.new()
    return self
end


-- throws Exception
function PathFindingInfoFactory:getInstancePathFindingInfo(geographicMapInterface, mapArray)
        local pathFindingInfo = PathFindingInfo.new(self.pathFindingInfo:getPathFindingNodeCostInfoFactoryInterface(), BasicArrayListS.new(1), BasicArrayListS.new(1))
        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance():init()
        self:init(geographicMapInterface, pathFindingInfo, mapArray)
        self.pathFinder:init(geographicMapInterface)
        pathFindingInfo:setPathFinder(self.pathFinder)
        return pathFindingInfo
end


-- throws Exception
function PathFindingInfoFactory:init(geographicMapInterface, pathFindingInfo, mapArray)
        BasePathFindingInfoFactory.init(self, geographicMapInterface, pathFindingInfo, mapArray)
        self:buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray)
end


-- throws Exception
function PathFindingInfoFactory:buildPathFindingNodesForCellPosition(geographicMapInterface, pathFindingInfo, mapArray, cellPosition)
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

PathFindingInfoFactory.instance = PathFindingInfoFactory.new()
PathFindingInfoFactory.MAX = 32768

return PathFindingInfoFactory


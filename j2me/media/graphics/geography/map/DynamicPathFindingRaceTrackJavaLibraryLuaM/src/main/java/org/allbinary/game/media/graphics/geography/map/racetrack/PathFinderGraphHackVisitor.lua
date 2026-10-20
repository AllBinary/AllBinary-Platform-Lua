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

local GraphPath = require("org.jgrapht.GraphPath")
local DefaultWeightedEdge = require("org.jgrapht.graph.DefaultWeightedEdge")
local SimpleWeightedGraph = require("org.jgrapht.graph.SimpleWeightedGraph")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local BasicGeographicMapUtil = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local RaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")
local PathFindingNode = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
local BasePathFinderGraphVisitor = require("org.allbinary.game.media.graphics.geography.map.racetrack.BasePathFinderGraphVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathFinderGraphHackVisitor = {}
PathFinderGraphHackVisitor.__index = PathFinderGraphHackVisitor
PathFinderGraphHackVisitor.className = "PathFinderGraphHackVisitor"
setmetatable(PathFinderGraphHackVisitor, {__index = BasePathFinderGraphVisitor})

function PathFinderGraphHackVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PathFinderGraphHackVisitor.new(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight)
    local self = setmetatable(BasePathFinderGraphVisitor.new(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight), PathFinderGraphHackVisitor)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function PathFinderGraphHackVisitor:visit(graph, startPathFindingNodeList, endPathFindingNodeList)
        self:fixStart(graph, startPathFindingNodeList)
        self:fixEnd(graph, endPathFindingNodeList)
        self:fixOverPassEdges(graph)
end


-- throws Exception
function PathFinderGraphHackVisitor:fixStart(graph, startPathFindingNodeList)
        local geographicMapCellPositionFactory = self.geographicMapInterface:getGeographicMapCellPositionFactory()
        local tiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        for index = startPathFindingNodeList:size() - 1, 0, -1 do
            local startPathFindingNode = startPathFindingNodeList:get(index)
            local geographicMapCellPosition = startPathFindingNode.geographicMapCellPosition
            local column = geographicMapCellPosition:getColumn()
            local row = geographicMapCellPosition:getRow()
            local nextRow = row + 1
            if tiledLayer:isOnTileLayer(column, nextRow) then
                local geographicMapCellPositionNeighbor = geographicMapCellPositionFactory:getAt(column, nextRow)
                graph:removeEdge(geographicMapCellPosition, geographicMapCellPositionNeighbor)
            end
        end
end


-- throws Exception
function PathFinderGraphHackVisitor:fixEnd(graph, endPathFindingNodeList)
        local geographicMapCellPositionFactory = self.geographicMapInterface:getGeographicMapCellPositionFactory()
        local tiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        for index = endPathFindingNodeList:size() - 1, 0, -1 do
            local endPathFindingNode = endPathFindingNodeList:get(index)
            local geographicMapCellPosition = endPathFindingNode.geographicMapCellPosition
            graph:addVertex(geographicMapCellPosition)
            local column = geographicMapCellPosition:getColumn()
            local row = geographicMapCellPosition:getRow()
            local nextRow = row + 1
            if tiledLayer:isOnTileLayer(column, nextRow) then
                local geographicMapCellPositionNeighbor = geographicMapCellPositionFactory:getAt(column, nextRow)
                graph:addEdge(geographicMapCellPosition, geographicMapCellPositionNeighbor)
            end
        end
end


-- throws Exception
function PathFinderGraphHackVisitor:fixOverPassEdges(graph)
        local geographicMapCellPositionFactory = self.geographicMapInterface:getGeographicMapCellPositionFactory()
        local raceTrackGeographicMap = self.geographicMapInterface
        local CellPositionArray = raceTrackGeographicMap:getRaceTrackData():getOverPassGeographicMapCellPositionArray()
        for index = (CellPositionArray.n or #CellPositionArray) - 1, 0, -1 do
            local overPassGeographicMapCellPosition = CellPositionArray[index + 1]
            self.logUtil:putF("Fixing Over Pass: " .. tostring(overPassGeographicMapCellPosition:getColumn()) .. ", " .. tostring(overPassGeographicMapCellPosition:getRow()), self, "fixOverPassEdges")
            local underPassGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(overPassGeographicMapCellPosition:getColumn(), overPassGeographicMapCellPosition:getRow())
            local rightUnderPassGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(overPassGeographicMapCellPosition:getColumn() + 1, overPassGeographicMapCellPosition:getRow())
            local leftUnderPassGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(overPassGeographicMapCellPosition:getColumn() - 1, overPassGeographicMapCellPosition:getRow())
            graph:removeEdge(underPassGeographicMapCellPosition, rightUnderPassGeographicMapCellPosition)
            graph:removeEdge(underPassGeographicMapCellPosition, leftUnderPassGeographicMapCellPosition)
            graph:addVertex(overPassGeographicMapCellPosition)
            graph:addEdge(overPassGeographicMapCellPosition, rightUnderPassGeographicMapCellPosition)
            graph:addEdge(overPassGeographicMapCellPosition, leftUnderPassGeographicMapCellPosition)
        end
end


-- throws Exception
function PathFinderGraphHackVisitor:fixPath(startPathFindingNodeList, endPathFindingNodeList, pathList)
        for index = startPathFindingNodeList:size() - 1, 0, -1 do
            local endPathFindingNode = endPathFindingNodeList:get(index)
            local startPathFindingNode = startPathFindingNodeList:get(index)
            if BasicGeographicMapUtil.getInstance():isSameCellPosition(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition) then
                if pathList:remove(endPathFindingNode.geographicMapCellPosition) then
                    pathList:remove(startPathFindingNode.geographicMapCellPosition)
                    pathList:addAt(0, startPathFindingNode.geographicMapCellPosition)
                end
            end
        end
        self:removeOverPassEdges(pathList)
end


-- throws Exception
function PathFinderGraphHackVisitor:removeOverPassEdges(pathList)
        local geographicMapCellPositionFactory = self.geographicMapInterface:getGeographicMapCellPositionFactory()
        local raceTrackGeographicMap = self.geographicMapInterface
        local CellPositionArray = raceTrackGeographicMap:getRaceTrackData():getOverPassGeographicMapCellPositionArray()
        for index = (CellPositionArray.n or #CellPositionArray) - 1, 0, -1 do
            local overPassGeographicMapCellPosition = CellPositionArray[index + 1]
            local underPassGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(overPassGeographicMapCellPosition:getColumn(), overPassGeographicMapCellPosition:getRow())
            local indexOf = pathList:indexOf(overPassGeographicMapCellPosition)
            if indexOf ~= -1 then
                pathList:set(indexOf, underPassGeographicMapCellPosition)
            end
        end
end


function PathFinderGraphHackVisitor:isValid(graphPath)
        if graphPath:getEdgeList():size() > self.edgeMinimum and graphPath:getWeight() < self.maxPathWeight and graphPath:getWeight() > self.minPathWeight then
            return true
        else
            return false
        end
end

return PathFinderGraphHackVisitor


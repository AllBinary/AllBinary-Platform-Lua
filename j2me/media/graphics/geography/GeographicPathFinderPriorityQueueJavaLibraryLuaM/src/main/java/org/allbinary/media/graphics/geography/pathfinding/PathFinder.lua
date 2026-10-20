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
-- package org.allbinary.media.graphics.geography.pathfinding

-- local HashSet = require("java.util.HashSet")
-- local PriorityQueue = require("java.util.PriorityQueue")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local GeographicPathFinderBase = require("org.allbinary.media.graphics.geography.pathfinding.GeographicPathFinderBase")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local PathFinder = {}
PathFinder.__index = PathFinder
PathFinder.className = "PathFinder"
setmetatable(PathFinder, {__index = GeographicPathFinderBase})

function PathFinder:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.mathUtil = MathUtil.getInstance()
    self.openPriorityQueue = PriorityQueue.new()
    self.closedSet = HashSet.new()
    self.geographicMapInterface = NullUtil.getInstance().NULL_OBJECT
    self.costArray = PathFindingNodeCost.NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY
end

function PathFinder.new()
    local self = setmetatable(GeographicPathFinderBase.new(), PathFinder)
    self:_init_fields()
    return self
end


-- throws Exception
function PathFinder:init(geographicMapInterface)
        self.geographicMapInterface = geographicMapInterface
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        self.costArray = java_new_array(nil, tiledLayer:getColumns(), tiledLayer:getRows())
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local node = nil
        local sizeX = (self.costArray.n or #self.costArray)
        local sizeY = (self.costArray[1].n or #self.costArray[1])
        for column = 0, sizeX - 1 do
            for row = 0, sizeY - 1 do
                local geographicMapCellType = geographicMapInterface:getCellTypeAt(basicGeographicMapCellPositionFactory:getAt(column, row))
                local raceTrackGeographicMapCellType = geographicMapCellType
                node = PathFindingNodeCost.new(NullUtil.getInstance().NULL_OBJECT, basicGeographicMapCellPositionFactory:getAt(column, row), PathFindingNodeCostInfo.new(java_int(raceTrackGeographicMapCellType:getTravelCost()), -1))
                self.costArray[column + 1][row + 1] = node
            end
        end
end


function PathFinder:searchTotalPath(startPathFindingNodeList, endPathFindingNodeList, totalPaths)
        local try_ok, try_error = pcall(function()
            return self:search(startPathFindingNodeList:get(0), endPathFindingNodeList:get(0))
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "search", e)
            return self.basicArrayListUtil:getImmutableInstance()
        end
end


-- throws Exception
function PathFinder:searchTotalPathN(startPathFindingNodeList, endPathFindingNodeList, totalPaths, multipassState)
        if multipassState.step == 0 then
            multipassState.step = multipassState.step + 1
        elseif multipassState.step == 1 then
            self:searchStart(startPathFindingNodeList:get(0), endPathFindingNodeList:get(0), multipassState)
        elseif multipassState.step == 2 then
            return self:searchN(startPathFindingNodeList:get(0), endPathFindingNodeList:get(0), multipassState)
        end
        return self.basicArrayListUtil:getImmutableInstance()
end


-- throws Exception
function PathFinder:search(startPathFindingNode, endPathFindingNode)
        local list = self:findPath(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition)
        local pathList = BasicArrayListD.new()
        pathList:add(list)
        return pathList
end


-- throws Exception
function PathFinder:searchStart(startPathFindingNode, endPathFindingNode, multipassState)
        self:findPathStart(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition, multipassState)
end


-- throws Exception
function PathFinder:searchN(startPathFindingNode, endPathFindingNode, multipassState)
        local list = self:findPathEnd(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition, multipassState)
        if list == nil then
            return self.basicArrayListUtil:getImmutableInstance()
        end
        local pathList = BasicArrayListD.new()
        pathList:add(list)
        multipassState.iteration = 0
        multipassState.step = 0
        return pathList
end


-- throws Exception
function PathFinder:findPath(start, target)
        self.openPriorityQueue:clear()
        self.closedSet:clear()
        local discoveryCalculation = 0
        local node = nil
        local targetColumn = target:getColumn()
        local targetRow = target:getRow()
        local sizeX = (self.costArray.n or #self.costArray)
        local sizeY = (self.costArray[1].n or #self.costArray[1])
        for column = 0, sizeX - 1 do
            for row = 0, sizeY - 1 do
                discoveryCalculation = java_int(self.mathUtil:abs(column - targetColumn)) + self.mathUtil:abs(row - targetRow)
                node = self.costArray[column + 1][row + 1]
                node.pathFindingNodeCostInfoP.totalCostP = 0
                node.pathFindingNodeCostInfoP.costToEndP = discoveryCalculation
            end
        end
        local startNode = self.costArray[start:getColumn() + 1][start:getRow() + 1]
        self.openPriorityQueue:add(startNode)
        local geographicMapInterface = self.geographicMapInterface
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local targetNode = self.costArray[target:getColumn() + 1][target:getRow() + 1]
        local current = nil
        repeat
            current = self.openPriorityQueue:poll()
            self.closedSet:add(current)
            if current:equals(targetNode) then
                return self:extractPath(start, current)
            end
            local neighbor = nil
            local neighborInfo = nil
            local calculatedCost = 0
            for column = current.geographicMapCellPosition:getColumn() - 1, current.geographicMapCellPosition:getColumn() + 2 - 1 do
                for row = current.geographicMapCellPosition:getRow() - 1, current.geographicMapCellPosition:getRow() + 2 - 1 do
                    if column > 0 and row > 0 and column < allBinaryTiledLayer:getColumns() and row < allBinaryTiledLayer:getRows() and geographicMapInterface:isOnMap(basicGeographicMapCellPositionFactory:getAt(column, row)) then
                        neighbor = self.costArray[column + 1][row + 1]
                        if self.closedSet:contains(neighbor) then
                            goto continue_N70394
                        end
                        neighborInfo = neighbor.pathFindingNodeCostInfoP
                        calculatedCost = neighborInfo.costToEndP + neighborInfo.costFromStartP + current.pathFindingNodeCostInfoP.totalCostP
                        if calculatedCost < neighborInfo.totalCostP or not self.openPriorityQueue:contains(neighbor) then
                            neighborInfo.totalCostP = calculatedCost
                            neighbor.parent = current
                            if not self.openPriorityQueue:contains(neighbor) then
                                if geographicMapInterface:isOfFourDirections(current.geographicMapCellPosition, neighbor.geographicMapCellPosition) then
                                    self.openPriorityQueue:add(neighbor)
                                end
                            end
                        end
                    end
                    ::continue_N70394::
                end
            end
        until not (not self.openPriorityQueue:isEmpty())
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function PathFinder:findPathStart(start, target, multipassState)
        self.openPriorityQueue:clear()
        self.closedSet:clear()
        local discoveryCalculation = 0
        local node = nil
        local targetColumn = target:getColumn()
        local targetRow = target:getRow()
        local sizeX = (self.costArray.n or #self.costArray)
        local sizeY = (self.costArray[1].n or #self.costArray[1])
        for column = 0, sizeX - 1 do
            for row = 0, sizeY - 1 do
                discoveryCalculation = java_int(self.mathUtil:abs(column - targetColumn)) + self.mathUtil:abs(row - targetRow)
                node = self.costArray[column + 1][row + 1]
                node.pathFindingNodeCostInfoP.totalCostP = 0
                node.pathFindingNodeCostInfoP.costToEndP = discoveryCalculation
            end
        end
        local startNode = self.costArray[start:getColumn() + 1][start:getRow() + 1]
        self.openPriorityQueue:add(startNode)
        multipassState.step = multipassState.step + 1
end


-- throws Exception
function PathFinder:findPathEnd(start, target, multipassState)
        local geographicMapInterface = self.geographicMapInterface
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local targetNode = self.costArray[target:getColumn() + 1][target:getRow() + 1]
        local current = nil
        local total = 0
        repeat
            current = self.openPriorityQueue:poll()
            self.closedSet:add(current)
            if current:equals(targetNode) then
                return self:extractPath(start, current)
            end
            local neighbor = nil
            local neighborInfo = nil
            local calculatedCost = 0
            for column = current.geographicMapCellPosition:getColumn() - 1, current.geographicMapCellPosition:getColumn() + 2 - 1 do
                for row = current.geographicMapCellPosition:getRow() - 1, current.geographicMapCellPosition:getRow() + 2 - 1 do
                    if column > 0 and row > 0 and column < allBinaryTiledLayer:getColumns() and row < allBinaryTiledLayer:getRows() and geographicMapInterface:isOnMap(basicGeographicMapCellPositionFactory:getAt(column, row)) then
                        neighbor = self.costArray[column + 1][row + 1]
                        if self.closedSet:contains(neighbor) then
                            goto continue_N72940
                        end
                        neighborInfo = neighbor.pathFindingNodeCostInfoP
                        calculatedCost = neighborInfo.costToEndP + neighborInfo.costFromStartP + current.pathFindingNodeCostInfoP.totalCostP
                        if calculatedCost < neighborInfo.totalCostP or not self.openPriorityQueue:contains(neighbor) then
                            neighborInfo.totalCostP = calculatedCost
                            neighbor.parent = current
                            if not self.openPriorityQueue:contains(neighbor) then
                                if geographicMapInterface:isOfFourDirections(current.geographicMapCellPosition, neighbor.geographicMapCellPosition) then
                                    self.openPriorityQueue:add(neighbor)
                                end
                            end
                        end
                    end
                    ::continue_N72940::
                end
            end
            total = total + 1
            if total > 10 then
                return self.basicArrayListUtil:getImmutableInstance()
            end
        until not (not self.openPriorityQueue:isEmpty())
        error(java_exception("RuntimeException"), 0)
end


function PathFinder:extractPath(start, current)
        local path = BasicArrayListD.new()
        while current.parent ~= NullUtil.getInstance().NULL_OBJECT do
            path:add(current.geographicMapCellPosition)
            current = current.parent
        end
        path:add(start)
        self.basicArrayListUtil:reverse(path)
        return path
end

return PathFinder


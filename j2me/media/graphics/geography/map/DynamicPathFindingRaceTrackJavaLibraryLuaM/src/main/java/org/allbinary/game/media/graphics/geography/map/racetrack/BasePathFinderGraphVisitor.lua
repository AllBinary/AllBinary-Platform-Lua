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
local SimpleWeightedGraph = require("org.jgrapht.graph.SimpleWeightedGraph")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local PathFinderGraphVisitorBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase")
local PathFindingNode = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
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

local BasePathFinderGraphVisitor = {}
BasePathFinderGraphVisitor.__index = BasePathFinderGraphVisitor
BasePathFinderGraphVisitor.className = "BasePathFinderGraphVisitor"
setmetatable(BasePathFinderGraphVisitor, {__index = PathFinderGraphVisitorBase})

function BasePathFinderGraphVisitor:_init_fields()
    self.geographicMapInterface = nil
    self.edgeMinimum = nil
    self.minPathWeight = nil
    self.maxPathWeight = nil
end


function BasePathFinderGraphVisitor.new(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight)
    local self = setmetatable(PathFinderGraphVisitorBase.new(), BasePathFinderGraphVisitor)
    self:_init_fields()
        self.geographicMapInterface = geographicMapInterface
        self.edgeMinimum = edgeMinimum
        self.minPathWeight = minPathWeight
        self.maxPathWeight = maxPathWeight
    return self
end


-- throws Exception
function BasePathFinderGraphVisitor:visit(graph, startPathFindingNodeList, endPathFindingNodeList)
end


-- throws Exception
function BasePathFinderGraphVisitor:fixPath(startPathFindingNodeList, endPathFindingNodeList, pathList)
        for index = startPathFindingNodeList:size() - 1, 0, -1 do
            local startPathFindingNode = startPathFindingNodeList:get(index)
            pathList:remove(startPathFindingNode.geographicMapCellPosition)
            pathList:addAt(0, startPathFindingNode.geographicMapCellPosition)
        end
end


function BasePathFinderGraphVisitor:isValid(graphPath)
        if graphPath:getEdgeList():size() > self.edgeMinimum and graphPath:getWeight() < self.maxPathWeight and graphPath:getWeight() > self.minPathWeight then
            return true
        else
            return false
        end
end


function BasePathFinderGraphVisitor:getInvalidReason(graphPath)
        local stringBuffer = StringMaker.new()
        if graphPath:getEdgeList():size() < self.edgeMinimum then
            stringBuffer:append("Ignoring Small: " .. tostring(graphPath:getEdgeList():size()))
        end
        if graphPath:getWeight() <= self.minPathWeight then
            stringBuffer:append(" Low Weighted Path: " .. tostring(graphPath:getWeight()))
        end
        if graphPath:getWeight() >= self.maxPathWeight then
            stringBuffer:append(" To High Weighted Path: " .. tostring(graphPath:getWeight()))
        end
        return tostring(stringBuffer)
end

return BasePathFinderGraphVisitor


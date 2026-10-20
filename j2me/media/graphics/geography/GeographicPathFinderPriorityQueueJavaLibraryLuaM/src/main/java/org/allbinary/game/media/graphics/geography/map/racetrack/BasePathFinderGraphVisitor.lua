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

local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

--1.4.2
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
        local startPathFindingNode = nil
        for index = startPathFindingNodeList:size() - 1, 0, -1 do
            startPathFindingNode = startPathFindingNodeList:get(index)
            pathList:remove(startPathFindingNode.geographicMapCellPosition)
            pathList:addAt(0, startPathFindingNode.geographicMapCellPosition)
        end
end


function BasePathFinderGraphVisitor:isValid(graphPath)
        return false
end


function BasePathFinderGraphVisitor:getInvalidReason(graphPath)
        return StringUtil.getInstance().EMPTY_STRING
end

return BasePathFinderGraphVisitor


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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local PathFindingInfoInterface = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathFindingInfo = {}
PathFindingInfo.__index = PathFindingInfo
PathFindingInfo.className = "PathFindingInfo"

function PathFindingInfo:_init_fields()
    self.pathFinder = GeographicPathFinderBase.NULL_GEOGRAPHIC_PATH_FINDER_BASE
    self.startPathFindingNodeList = nil
    self.endPathFindingNodeList = nil
    self.pathFindingNodeCostInfoFactoryInterface = nil
end


function PathFindingInfo.new(pathFindingNodeCostInfoFactoryInterface, startPathFindingNodeList, endPathFindingNodeList)
    local self = setmetatable({}, PathFindingInfo)
    self:_init_fields()
        self.pathFindingNodeCostInfoFactoryInterface = pathFindingNodeCostInfoFactoryInterface
        self.startPathFindingNodeList = startPathFindingNodeList
        self.endPathFindingNodeList = endPathFindingNodeList
    return self
end


function PathFindingInfo:getStartPathFindingNodeList()
        return self.startPathFindingNodeList
end


function PathFindingInfo:getEndPathFindingNodeList()
        return self.endPathFindingNodeList
end


function PathFindingInfo:getPathFinder()
        return self.pathFinder
end


function PathFindingInfo:addStartPathFindingNode(startPathFindingNode)
        self.startPathFindingNodeList:add(startPathFindingNode)
end


function PathFindingInfo:addEndPathFindingNode(endPathFindingNode)
        self.endPathFindingNodeList:add(endPathFindingNode)
end


function PathFindingInfo:setPathFinder(pathFinder)
        self.pathFinder = pathFinder
end


function PathFindingInfo:getPathFindingNodeCostInfoFactoryInterface()
        return self.pathFindingNodeCostInfoFactoryInterface
end

PathFindingInfo.NULL_PATH_FINDING_INFO = PathFindingInfo.new(PathFindingNodeCostInfoFactoryBase.NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE, BasicArrayListUtil.getInstance():getImmutableInstance(), BasicArrayListUtil.getInstance():getImmutableInstance())

return PathFindingInfo


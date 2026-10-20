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
-- package org.allbinary.media.graphics.geography.pathfinding

local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local PathFindingNodeCostInfoFactoryBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase")

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

local PathFindingNodeCostInfoFactory = {}
PathFindingNodeCostInfoFactory.__index = PathFindingNodeCostInfoFactory
PathFindingNodeCostInfoFactory.className = "PathFindingNodeCostInfoFactory"
setmetatable(PathFindingNodeCostInfoFactory, {__index = PathFindingNodeCostInfoFactoryBase})

function PathFindingNodeCostInfoFactory:_init_fields()
    self.pathFindingNodeCostInfoAdjacencyList = nil
end


function PathFindingNodeCostInfoFactory.new(max)
    local self = setmetatable(PathFindingNodeCostInfoFactoryBase.new(), PathFindingNodeCostInfoFactory)
    self:_init_fields()
        self.pathFindingNodeCostInfoAdjacencyList = java_new_array(nil, max, max)
    return self
end


-- throws Exception
function PathFindingNodeCostInfoFactory:create(geographicMapInterface, goingToGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd)
        self:getInstance(goingToGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd)
end


-- throws Exception
function PathFindingNodeCostInfoFactory:getInstance(goingToGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd)
        local pathFindingNodeCostInfo = self:getInstance(goingToGeographicMapCellPosition, geographicMapCellPosition)
        if pathFindingNodeCostInfo == nil then
            pathFindingNodeCostInfo = PathFindingNodeCostInfo.new(costFromStart, costToEnd)
            pathFindingNodeCostInfo:setCalculatedTotalCost()
            self.pathFindingNodeCostInfoAdjacencyList[geographicMapCellPosition:getId() + 1][goingToGeographicMapCellPosition:getId() + 1] = pathFindingNodeCostInfo
        else
            pathFindingNodeCostInfo:setCostFromStart(costFromStart)
            pathFindingNodeCostInfo:setCostToEnd(costToEnd)
            pathFindingNodeCostInfo:setCalculatedTotalCost()
        end
        return pathFindingNodeCostInfo
end


-- Java overloaded method: Lua keeps the last definition
function PathFindingNodeCostInfoFactory:getInstance(goingToFromGeographicMapCellPosition, geographicMapCellPosition)
        return self.pathFindingNodeCostInfoAdjacencyList[geographicMapCellPosition:getId() + 1][goingToFromGeographicMapCellPosition:getId() + 1]
end


function PathFindingNodeCostInfoFactory:getTotalCost(geographicMapInterface, comingFromGeographicMapCellPosition, geographicMapCellPosition)
        return self:getInstance(comingFromGeographicMapCellPosition, geographicMapCellPosition).totalCostP
end

return PathFindingNodeCostInfoFactory


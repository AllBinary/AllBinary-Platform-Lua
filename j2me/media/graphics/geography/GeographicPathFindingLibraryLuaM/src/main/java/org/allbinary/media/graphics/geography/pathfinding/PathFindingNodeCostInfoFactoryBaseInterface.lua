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

local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local PathFindingNodeCostInfoFactoryBaseInterface = {}
PathFindingNodeCostInfoFactoryBaseInterface.__index = PathFindingNodeCostInfoFactoryBaseInterface
PathFindingNodeCostInfoFactoryBaseInterface.className = "PathFindingNodeCostInfoFactoryBaseInterface"


-- throws Exception
function PathFindingNodeCostInfoFactoryBaseInterface:create(geographicMapInterface, comingFromGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd)
    error("abstract method create")
end


-- throws Exception
function PathFindingNodeCostInfoFactoryBaseInterface:getTotalCost(geographicMapInterface, comingFromGeographicMapCellPosition, geographicMapCellPosition)
    error("abstract method getTotalCost")
end

return PathFindingNodeCostInfoFactoryBaseInterface


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
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local PathFindingNodeCostInfoFactoryBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase")

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


function PathFindingNodeCostInfoFactory.new(max)
    local self = setmetatable(PathFindingNodeCostInfoFactoryBase.new(), PathFindingNodeCostInfoFactory)
    return self
end


-- throws Exception
function PathFindingNodeCostInfoFactory:create(geographicMapInterface, goingToGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd)
end


-- throws Exception
function PathFindingNodeCostInfoFactory:getTotalCost(geographicMapInterface, comingFromGeographicMapCellPosition, geographicMapCellPosition)
        local geographicMapCellType = geographicMapInterface:getCellTypeAt(comingFromGeographicMapCellPosition)
        local geographicMapCellType2 = geographicMapInterface:getCellTypeAt(geographicMapCellPosition)
        local raceTrackGeographicMapCellType = geographicMapCellType
        local raceTrackGeographicMapCellType2 = geographicMapCellType2
        return java_int(raceTrackGeographicMapCellType:getTravelCost()) + raceTrackGeographicMapCellType2:getTravelCost()
end

return PathFindingNodeCostInfoFactory


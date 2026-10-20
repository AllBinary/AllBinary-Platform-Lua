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
-- package org.allbinary.media.graphics.geography.map.racetrack

local CommonStrings = require("org.allbinary.string.CommonStrings")
local PathFindingNodeCostInfoData = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoData")
local RaceTrackGeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EmptyRaceRaceTrackGeographicMapCellTypeFactory = {}
EmptyRaceRaceTrackGeographicMapCellTypeFactory.__index = EmptyRaceRaceTrackGeographicMapCellTypeFactory
EmptyRaceRaceTrackGeographicMapCellTypeFactory.className = "EmptyRaceRaceTrackGeographicMapCellTypeFactory"
setmetatable(EmptyRaceRaceTrackGeographicMapCellTypeFactory, {__index = RaceTrackGeographicMapCellTypeFactory})


function EmptyRaceRaceTrackGeographicMapCellTypeFactory.getInstance()
        return EmptyRaceRaceTrackGeographicMapCellTypeFactory.instanceC
end


function EmptyRaceRaceTrackGeographicMapCellTypeFactory.new()
    local self = setmetatable(RaceTrackGeographicMapCellTypeFactory.new(), EmptyRaceRaceTrackGeographicMapCellTypeFactory)
        local commonStrings = CommonStrings.getInstance()
        self.EMPTY_CELL_TYPE = RaceTrackGeographicMapCellType.new(commonStrings.EMPTY, 0, PathFindingNodeCostInfoData.getInstance().MAX_NODE_COST, 1)
        self.EASY_CELL_TYPE = RaceTrackGeographicMapCellType.new("Easy", 19, 1, 0)
        self.FINISH_LINE_ROAD_CELL_TYPE = self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE
    return self
end

EmptyRaceRaceTrackGeographicMapCellTypeFactory.instanceC = EmptyRaceRaceTrackGeographicMapCellTypeFactory.new()

return EmptyRaceRaceTrackGeographicMapCellTypeFactory


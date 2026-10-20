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

local CloseLoopRaceTrackGeographicMapCellTypeFactory = {}
CloseLoopRaceTrackGeographicMapCellTypeFactory.__index = CloseLoopRaceTrackGeographicMapCellTypeFactory
CloseLoopRaceTrackGeographicMapCellTypeFactory.className = "CloseLoopRaceTrackGeographicMapCellTypeFactory"
setmetatable(CloseLoopRaceTrackGeographicMapCellTypeFactory, {__index = RaceTrackGeographicMapCellTypeFactory})


function CloseLoopRaceTrackGeographicMapCellTypeFactory.getInstance()
        return CloseLoopRaceTrackGeographicMapCellTypeFactory.instanceC
end


function CloseLoopRaceTrackGeographicMapCellTypeFactory.new()
    local self = setmetatable(RaceTrackGeographicMapCellTypeFactory.new(), CloseLoopRaceTrackGeographicMapCellTypeFactory)
        self.EMPTY_CELL_TYPE = EmptyRaceRaceTrackGeographicMapCellTypeFactory.getInstance().EMPTY_CELL_TYPE
        self.EASY_CELL_TYPE = self.EMPTY_CELL_TYPE
        self.FINISH_LINE_ROAD_CELL_TYPE = self.START_LINE_ROAD_CELL_TYPE
    return self
end

CloseLoopRaceTrackGeographicMapCellTypeFactory.instanceC = CloseLoopRaceTrackGeographicMapCellTypeFactory.new()

return CloseLoopRaceTrackGeographicMapCellTypeFactory


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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackGeographicMapCellTypes = {}
RaceTrackGeographicMapCellTypes.__index = RaceTrackGeographicMapCellTypes
RaceTrackGeographicMapCellTypes.className = "RaceTrackGeographicMapCellTypes"

function RaceTrackGeographicMapCellTypes:_init_fields()
    self.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE = nil
    self.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE = nil
    self.TOP_LEFT_TURN_ROAD_CELL_TYPE = nil
    self.TOP_RIGHT_TURN_ROAD_CELL_TYPE = nil
    self.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE = nil
    self.VERTICAL_STRAIGHT_ROAD_CELL_TYPE = nil
    self.START_LINE_ROAD_CELL_TYPE = nil
    self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE = nil
end


function RaceTrackGeographicMapCellTypes.getInstance()
        return RaceTrackGeographicMapCellTypes.instance
end


function RaceTrackGeographicMapCellTypes.new()
    local self = setmetatable({}, RaceTrackGeographicMapCellTypes)
    self:_init_fields()
        self.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Bottom Left Turn", 1, 1, 0)
        self.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Bottom Right Turn", 2, 1, 0)
        self.TOP_LEFT_TURN_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Top Left Turn", 3, 1, 0)
        self.TOP_RIGHT_TURN_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Top Right Turne", 4, 1, 0)
        self.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Horizontal Straight", 5, 1, 0)
        self.VERTICAL_STRAIGHT_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Vertical Straight", 6, 1, 0)
        self.START_LINE_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Start Line", 7, 1, 0)
        self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE = RaceTrackGeographicMapCellType.new("Finish Line", 8, 1, 0)
    return self
end

RaceTrackGeographicMapCellTypes.instance = RaceTrackGeographicMapCellTypes.new()

return RaceTrackGeographicMapCellTypes


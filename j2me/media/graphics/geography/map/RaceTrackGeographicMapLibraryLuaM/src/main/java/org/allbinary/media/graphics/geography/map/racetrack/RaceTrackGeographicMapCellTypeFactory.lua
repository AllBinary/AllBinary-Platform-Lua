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

local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackGeographicMapCellTypeFactory = {}
RaceTrackGeographicMapCellTypeFactory.__index = RaceTrackGeographicMapCellTypeFactory
RaceTrackGeographicMapCellTypeFactory.className = "RaceTrackGeographicMapCellTypeFactory"
setmetatable(RaceTrackGeographicMapCellTypeFactory, {__index = GeographicMapCellTypeFactory})

function RaceTrackGeographicMapCellTypeFactory:_init_fields()
    self.EMPTY_CELL_TYPE = GeographicMapCellType.new(0, -1)
    self.EASY_CELL_TYPE = self.EMPTY_CELL_TYPE
    self.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE = nil
    self.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE = nil
    self.TOP_LEFT_TURN_ROAD_CELL_TYPE = nil
    self.TOP_RIGHT_TURN_ROAD_CELL_TYPE = nil
    self.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE = nil
    self.VERTICAL_STRAIGHT_ROAD_CELL_TYPE = nil
    self.START_LINE_ROAD_CELL_TYPE = nil
    self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE = nil
    self.FINISH_LINE_ROAD_CELL_TYPE = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE
end


function RaceTrackGeographicMapCellTypeFactory.getInstance()
        return RaceTrackGeographicMapCellTypeFactory.instanceC
end


function RaceTrackGeographicMapCellTypeFactory.new()
    local self = setmetatable(GeographicMapCellTypeFactory.new(), RaceTrackGeographicMapCellTypeFactory)
    self:_init_fields()
        local raceTrackGeographicMapCellTypes = RaceTrackGeographicMapCellTypes.getInstance()
        self.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE
        self.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE
        self.TOP_LEFT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.TOP_LEFT_TURN_ROAD_CELL_TYPE
        self.TOP_RIGHT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.TOP_RIGHT_TURN_ROAD_CELL_TYPE
        self.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE
        self.VERTICAL_STRAIGHT_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.VERTICAL_STRAIGHT_ROAD_CELL_TYPE
        self.START_LINE_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.START_LINE_ROAD_CELL_TYPE
        self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE
    return self
end


function RaceTrackGeographicMapCellTypeFactory:getStartType()
        return self.START_LINE_ROAD_CELL_TYPE:getType()
end


function RaceTrackGeographicMapCellTypeFactory:getEndType()
        return self.FINISH_LINE_ROAD_CELL_TYPE:getType()
end


function RaceTrackGeographicMapCellTypeFactory:getEmptyType()
        return self.EMPTY_CELL_TYPE:getType()
end


function RaceTrackGeographicMapCellTypeFactory:isPath(cellType)
        if cellType ~= self.EMPTY_CELL_TYPE and cellType ~= self.EASY_CELL_TYPE then
            return true
        end
        return false
end

RaceTrackGeographicMapCellTypeFactory.instanceC = RaceTrackGeographicMapCellTypeFactory.new()

return RaceTrackGeographicMapCellTypeFactory


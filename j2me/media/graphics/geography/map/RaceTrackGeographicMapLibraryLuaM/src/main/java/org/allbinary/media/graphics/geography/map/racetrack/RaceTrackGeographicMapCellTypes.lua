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

local RaceTrackGeographicMapCellTypes = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypes"] = RaceTrackGeographicMapCellTypes

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table RaceTrackGeographicMapCellTypes is declared before the requires
RaceTrackGeographicMapCellTypes.__index = RaceTrackGeographicMapCellTypes
RaceTrackGeographicMapCellTypes.className = "RaceTrackGeographicMapCellTypes"
RaceTrackGeographicMapCellTypes.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypes"

function RaceTrackGeographicMapCellTypes:_init_fields()
    if self.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE == nil then self.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE = nil end
    if self.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE == nil then self.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE = nil end
    if self.TOP_LEFT_TURN_ROAD_CELL_TYPE == nil then self.TOP_LEFT_TURN_ROAD_CELL_TYPE = nil end
    if self.TOP_RIGHT_TURN_ROAD_CELL_TYPE == nil then self.TOP_RIGHT_TURN_ROAD_CELL_TYPE = nil end
    if self.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE == nil then self.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE = nil end
    if self.VERTICAL_STRAIGHT_ROAD_CELL_TYPE == nil then self.VERTICAL_STRAIGHT_ROAD_CELL_TYPE = nil end
    if self.START_LINE_ROAD_CELL_TYPE == nil then self.START_LINE_ROAD_CELL_TYPE = nil end
    if self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE == nil then self.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE = nil end
end


function RaceTrackGeographicMapCellTypes.getInstance()
        return RaceTrackGeographicMapCellTypes.instance_f
end


function RaceTrackGeographicMapCellTypes._jinit(self)
    RaceTrackGeographicMapCellTypes._init_fields(self)
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

function RaceTrackGeographicMapCellTypes.new(...)
    local self = setmetatable({}, RaceTrackGeographicMapCellTypes)
    RaceTrackGeographicMapCellTypes._jinit(self, ...)
    return self
end

RaceTrackGeographicMapCellTypes.instance_f = RaceTrackGeographicMapCellTypes.new()

return RaceTrackGeographicMapCellTypes


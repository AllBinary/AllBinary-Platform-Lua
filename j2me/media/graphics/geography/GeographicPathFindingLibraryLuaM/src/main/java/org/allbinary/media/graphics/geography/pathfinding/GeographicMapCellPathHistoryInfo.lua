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

local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPathHistoryInfo = {}
GeographicMapCellPathHistoryInfo.__index = GeographicMapCellPathHistoryInfo
GeographicMapCellPathHistoryInfo.className = "GeographicMapCellPathHistoryInfo"

function GeographicMapCellPathHistoryInfo:_init_fields()
    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.previousOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.nextUnvisitedOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.nextOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.nextChosenOnPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end

function GeographicMapCellPathHistoryInfo.new()
    local self = setmetatable({}, GeographicMapCellPathHistoryInfo)
    self:_init_fields()
    return self
end


function GeographicMapCellPathHistoryInfo:getPreviousGeographicMapCellPosition()
        return self.previousGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setPreviousGeographicMapCellPosition(previousGeographicMapCellPosition)
        self.previousGeographicMapCellPosition = previousGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getPreviousOnPathGeographicMapCellPosition()
        return self.previousOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setPreviousOnPathGeographicMapCellPosition(previousOnPathGeographicMapCellPosition)
        self.previousOnPathGeographicMapCellPosition = previousOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getNextUnvisitedOnPathGeographicMapCellPosition()
        return self.nextUnvisitedOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setNextUnvisitedOnPathGeographicMapCellPosition(nextUnvisitedOnPathGeographicMapCellPosition)
        self.nextUnvisitedOnPathGeographicMapCellPosition = nextUnvisitedOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getNextOnPathGeographicMapCellPosition()
        return self.nextOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setNextOnPathGeographicMapCellPosition(nextOnPathGeographicMapCellPosition)
        self.nextOnPathGeographicMapCellPosition = nextOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:getNextChosenOnPathGeographicMapCellPosition()
        return self.nextChosenOnPathGeographicMapCellPosition
end


function GeographicMapCellPathHistoryInfo:setNextChosenOnPathGeographicMapCellPosition(nextChosenOnPathGeographicMapCellPosition)
        self.nextChosenOnPathGeographicMapCellPosition = nextChosenOnPathGeographicMapCellPosition
end

return GeographicMapCellPathHistoryInfo


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
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackGeographicMapCellType = {}
RaceTrackGeographicMapCellType.__index = RaceTrackGeographicMapCellType
RaceTrackGeographicMapCellType.className = "RaceTrackGeographicMapCellType"
setmetatable(RaceTrackGeographicMapCellType, {__index = GeographicMapCellType})

function RaceTrackGeographicMapCellType:_init_fields()
    self.name = nil
    self.travelCost = nil
end


function RaceTrackGeographicMapCellType.new(name, type, travelCost, reset)
    local self = setmetatable(GeographicMapCellType.new(type, reset), RaceTrackGeographicMapCellType)
    self:_init_fields()
        -- super(...) made self above
        self.name = name
        self.travelCost = travelCost
    return self
end


function RaceTrackGeographicMapCellType:getTravelCost()
        return self.travelCost
end

return RaceTrackGeographicMapCellType


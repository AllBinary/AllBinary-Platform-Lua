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

local GeographicMapInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapInterface")

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
local RaceTrackGeographicMapInterface = {}
RaceTrackGeographicMapInterface.__index = RaceTrackGeographicMapInterface
RaceTrackGeographicMapInterface.className = "RaceTrackGeographicMapInterface"
setmetatable(RaceTrackGeographicMapInterface, {__index = GeographicMapInterface})


function RaceTrackGeographicMapInterface:getRaceTrackInfo()
    error("abstract method getRaceTrackInfo")
end


function RaceTrackGeographicMapInterface:setRaceTrackInfo(aRaceTrackInfo)
    error("abstract method setRaceTrackInfo")
end


function RaceTrackGeographicMapInterface:getRaceTrackData()
    error("abstract method getRaceTrackData")
end


function RaceTrackGeographicMapInterface:setRaceTrackData(raceTrackData)
    error("abstract method setRaceTrackData")
end

return RaceTrackGeographicMapInterface


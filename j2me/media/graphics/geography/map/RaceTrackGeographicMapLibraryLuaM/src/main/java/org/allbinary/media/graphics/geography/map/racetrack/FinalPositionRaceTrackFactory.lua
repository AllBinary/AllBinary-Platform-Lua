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

local FinalPositionRaceTrackFactory = {}
FinalPositionRaceTrackFactory.__index = FinalPositionRaceTrackFactory
FinalPositionRaceTrackFactory.className = "FinalPositionRaceTrackFactory"


function FinalPositionRaceTrackFactory.new()
    local self = setmetatable({}, FinalPositionRaceTrackFactory)
    return self
end


function FinalPositionRaceTrackFactory.getInstance()
        return (function() local value = FinalPositionRaceTrackFactory.index FinalPositionRaceTrackFactory.index = value + 1 return value end)()
end


function FinalPositionRaceTrackFactory.reset()
        FinalPositionRaceTrackFactory.index = FinalPositionRaceTrackFactory.FIRST_POSITION
end

FinalPositionRaceTrackFactory.FIRST_POSITION = 1
FinalPositionRaceTrackFactory.index = FinalPositionRaceTrackFactory.FIRST_POSITION

return FinalPositionRaceTrackFactory


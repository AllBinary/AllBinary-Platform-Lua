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

local BasicColor = require("org.allbinary.graphics.color.BasicColor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackInfo = {}
RaceTrackInfo.__index = RaceTrackInfo
RaceTrackInfo.className = "RaceTrackInfo"

function RaceTrackInfo:_init_fields()
    self.id = nil
    self.name = nil
    self.raceTrackFrictionProperties = nil
    self.foregroundBasicColor = nil
    self.backgroundBasicColor = nil
    self.qualifyTime = nil
    self.worstContinuePosition = nil
    self.totalLaps = nil
end


function RaceTrackInfo.new(id, name, raceTrackFrictionProperties, foregroundBasicColor, backgroundBasicColor, qualifyTime, worstContinuePosition, totalLaps)
    local self = setmetatable({}, RaceTrackInfo)
    self:_init_fields()
        self.id = id
        self.name = name
        self.raceTrackFrictionProperties = raceTrackFrictionProperties
        self.backgroundBasicColor = backgroundBasicColor
        self.foregroundBasicColor = foregroundBasicColor
        self.qualifyTime = qualifyTime
        self.worstContinuePosition = worstContinuePosition
        self.totalLaps = totalLaps
    return self
end


function RaceTrackInfo:getId()
        return self.id
end


function RaceTrackInfo:setId(id)
        self.id = id
end


function RaceTrackInfo:getName()
        return self.name
end


function RaceTrackInfo:setName(name)
        self.name = name
end


function RaceTrackInfo:getQualifyTime()
        return self.qualifyTime
end


function RaceTrackInfo:setQualifyTime(qualifyTime)
        self.qualifyTime = qualifyTime
end


function RaceTrackInfo:getWorstContinuePosition()
        return self.worstContinuePosition
end


function RaceTrackInfo:setWorstContinuePosition(worstContinuePosition)
        self.worstContinuePosition = worstContinuePosition
end


function RaceTrackInfo:getTotalLaps()
        return self.totalLaps
end


function RaceTrackInfo:setTotalLaps(totalLaps)
        self.totalLaps = totalLaps
end


function RaceTrackInfo:getForegroundBasicColor()
        return self.foregroundBasicColor
end


function RaceTrackInfo:setForegroundBasicColor(foregroundBasicColor)
        self.foregroundBasicColor = foregroundBasicColor
end


function RaceTrackInfo:getBackgroundBasicColor()
        return self.backgroundBasicColor
end


function RaceTrackInfo:setBackgroundBasicColor(backgroundBasicColor)
        self.backgroundBasicColor = backgroundBasicColor
end


function RaceTrackInfo:getRaceTrackFrictionProperties()
        return self.raceTrackFrictionProperties
end


function RaceTrackInfo:setRaceTrackFrictionProperties(raceTrackFrictionProperties)
        self.raceTrackFrictionProperties = raceTrackFrictionProperties
end

return RaceTrackInfo


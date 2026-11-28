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

local RaceTrackInfo = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo"] = RaceTrackInfo

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

local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local RaceTrackFrictionProperties = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackFrictionProperties")

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

-- class table RaceTrackInfo is declared before the requires
RaceTrackInfo.__index = RaceTrackInfo
RaceTrackInfo.className = "RaceTrackInfo"
RaceTrackInfo.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo"

function RaceTrackInfo:_init_fields()
    if self.id == nil then self.id = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.raceTrackFrictionProperties == nil then self.raceTrackFrictionProperties = nil end
    if self.foregroundBasicColor == nil then self.foregroundBasicColor = nil end
    if self.backgroundBasicColor == nil then self.backgroundBasicColor = nil end
    if self.qualifyTime == nil then self.qualifyTime = 0 end
    if self.worstContinuePosition == nil then self.worstContinuePosition = 0 end
    if self.totalLaps == nil then self.totalLaps = 0 end
end


function RaceTrackInfo._jinit(self, id, name, raceTrackFrictionProperties, foregroundBasicColor, backgroundBasicColor, qualifyTime, worstContinuePosition, totalLaps)
    RaceTrackInfo._init_fields(self)
        self.id = id
        self.name_f = name
        self.raceTrackFrictionProperties = raceTrackFrictionProperties
        self.backgroundBasicColor = backgroundBasicColor
        self.foregroundBasicColor = foregroundBasicColor
        self.qualifyTime = qualifyTime
        self.worstContinuePosition = worstContinuePosition
        self.totalLaps = totalLaps
    return self
end

function RaceTrackInfo.new(...)
    local self = setmetatable({}, RaceTrackInfo)
    RaceTrackInfo._jinit(self, ...)
    return self
end


function RaceTrackInfo:getId()
        return self.id
end


function RaceTrackInfo:setId(id)
        self.id = id
end


function RaceTrackInfo:getName()
        return self.name_f
end


function RaceTrackInfo:setName(name)
        self.name_f = name
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


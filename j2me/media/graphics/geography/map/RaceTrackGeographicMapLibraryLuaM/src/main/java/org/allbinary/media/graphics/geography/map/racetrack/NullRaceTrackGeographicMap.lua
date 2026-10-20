-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local Layer = require("org.allbinary.layer.Layer")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionFactoryInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local RaceTrackGeographicMapInterface = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullRaceTrackGeographicMap = {}
NullRaceTrackGeographicMap.__index = NullRaceTrackGeographicMap
NullRaceTrackGeographicMap.className = "NullRaceTrackGeographicMap"

function NullRaceTrackGeographicMap.new()
    local self = setmetatable({}, NullRaceTrackGeographicMap)
    return self
end


function NullRaceTrackGeographicMap:getId()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getName()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:reset()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getAllBinaryTiledLayer()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellPositionsAt(layer, currentCellPositionArray, cellPositionArray)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellPositionAtXY(x, y)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellPositionAtXYNoThrow(x, y)
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getCellTypeFromMapCellTypeInt(cellTypeId)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellTypeAtXY(x, y)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellTypeAt(geographicMapCellPosition)
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getGeographicMapCellPositionFactory()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getGeographicMapCellPositionFactoryInterface()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getForegroundBasicColor()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getBackgroundBasicColor()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getRaceTrackInfo()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:setRaceTrackInfo(aRaceTrackInfo)
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:getRaceTrackData()
        error(java_exception("RuntimeException"), 0)
end


function NullRaceTrackGeographicMap:setRaceTrackData(raceTrackData)
        error(java_exception("RuntimeException"), 0)
end

NullRaceTrackGeographicMap.NULL_RACE_TRACK_GEOGRAPHIC_MAP = NullRaceTrackGeographicMap.new()

return NullRaceTrackGeographicMap


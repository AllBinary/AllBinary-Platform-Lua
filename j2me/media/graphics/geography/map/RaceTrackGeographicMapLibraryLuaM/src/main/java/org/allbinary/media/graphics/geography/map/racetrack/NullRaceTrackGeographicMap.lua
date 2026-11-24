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

local NullRaceTrackGeographicMap = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.NullRaceTrackGeographicMap"] = NullRaceTrackGeographicMap

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

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local Layer = java_lazy("org.allbinary.layer.Layer")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local RaceTrackGeographicMapInterface = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterface")
local RaceTrackData = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData")
local RaceTrackInfo = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table NullRaceTrackGeographicMap is declared before the requires
NullRaceTrackGeographicMap.__index = NullRaceTrackGeographicMap
NullRaceTrackGeographicMap.className = "NullRaceTrackGeographicMap"
NullRaceTrackGeographicMap.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.NullRaceTrackGeographicMap"
NullRaceTrackGeographicMap.java_implements = " RaceTrackGeographicMapInterface "
NullRaceTrackGeographicMap.java_interfaces = function() return {RaceTrackGeographicMapInterface} end

function NullRaceTrackGeographicMap._jinit(self)
    return self
end

function NullRaceTrackGeographicMap.new()
    return NullRaceTrackGeographicMap._jinit(setmetatable({}, NullRaceTrackGeographicMap))
end


function NullRaceTrackGeographicMap:getId()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getName()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:reset()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getAllBinaryTiledLayer()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellPositionsAt(layer, currentCellPositionArray, cellPositionArray)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellPositionAtXY(x, y)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellPositionAtXYNoThrow(x, y)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getCellTypeFromMapCellTypeInt(cellTypeId)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellTypeAtXY(x, y)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullRaceTrackGeographicMap:getCellTypeAt(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getGeographicMapCellPositionFactory()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getGeographicMapCellPositionFactoryInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getForegroundBasicColor()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getBackgroundBasicColor()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getRaceTrackInfo()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:setRaceTrackInfo(aRaceTrackInfo)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:getRaceTrackData()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullRaceTrackGeographicMap:setRaceTrackData(raceTrackData)
        error(require("java.lang.RuntimeException").new(), 0)
end

NullRaceTrackGeographicMap.NULL_RACE_TRACK_GEOGRAPHIC_MAP = NullRaceTrackGeographicMap.new()

return NullRaceTrackGeographicMap


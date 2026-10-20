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
-- package org.allbinary.game.media.graphics.geography.map.racetrack

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local RaceTrackGeographicMapInterfaceFactoryInterface = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterfaceFactoryInterface")
local RaceTrackRoadsGeographicMapCellHistoryFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local RaceTracksPathPrinter = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTracksPathPrinter")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathGenerator = require("org.allbinary.media.graphics.geography.pathfinding.PathGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DynamicRaceTracksPathPrinter = {}
DynamicRaceTracksPathPrinter.__index = DynamicRaceTracksPathPrinter
DynamicRaceTracksPathPrinter.className = "DynamicRaceTracksPathPrinter"
setmetatable(DynamicRaceTracksPathPrinter, {__index = RaceTracksPathPrinter})

function DynamicRaceTracksPathPrinter:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function DynamicRaceTracksPathPrinter.new()
    local self = setmetatable(RaceTracksPathPrinter.new(), DynamicRaceTracksPathPrinter)
    self:_init_fields()
    return self
end


function DynamicRaceTracksPathPrinter:printAllPaths(raceTrackGeographicMapInterfaceFactoryInterface, pathFindingInfo, size)
        local try_ok, try_error = pcall(function()
            for index = 0, size - 1 do
                local geographicMapInterface = raceTrackGeographicMapInterfaceFactoryInterface:getTrackInstance(SmallIntegerSingletonFactory.getInstance():getAt(index))
                local list = PathGenerator.getInstance():createList(geographicMapInterface, RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance(), pathFindingInfo, 10)
                print("Track " .. tostring(index))
                self:printPaths(list)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.PROCESS, e)
        end
end

return DynamicRaceTracksPathPrinter


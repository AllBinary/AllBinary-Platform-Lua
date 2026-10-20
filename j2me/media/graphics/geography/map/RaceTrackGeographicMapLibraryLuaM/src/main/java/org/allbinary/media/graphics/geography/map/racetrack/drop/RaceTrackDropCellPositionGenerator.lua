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
-- package org.allbinary.media.graphics.geography.map.racetrack.drop

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local BaseDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator")
local BaseRaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local NullRaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.NullRaceTrackGeographicMap")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local RaceTrackGeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
local RaceTrackGeographicMapInterface = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterface")
local RaceTrackRoadsGeographicMapCellHistoryFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

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

local RaceTrackDropCellPositionGenerator = {}
RaceTrackDropCellPositionGenerator.__index = RaceTrackDropCellPositionGenerator
RaceTrackDropCellPositionGenerator.className = "RaceTrackDropCellPositionGenerator"
setmetatable(RaceTrackDropCellPositionGenerator, {__index = BaseDropCellPositionGenerator})

function RaceTrackDropCellPositionGenerator:_init_fields()
    self.list = BasicArrayListD.new()
    self.timeDelayHelper = nil
    self.STRAIGHTAWAY = 4
    self.raceTrackGeographicMap = NullRaceTrackGeographicMap.NULL_RACE_TRACK_GEOGRAPHIC_MAP
    self.raceTrackGeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function RaceTrackDropCellPositionGenerator.new()
    local self = setmetatable(BaseDropCellPositionGenerator.new(), RaceTrackDropCellPositionGenerator)
    self:_init_fields()
        self.timeDelayHelper = TimeDelayHelper.new(10000)
    return self
end


function RaceTrackDropCellPositionGenerator:init()
        self.list:clear()
end


-- throws Exception
function RaceTrackDropCellPositionGenerator:isDropAllowedAt(geographicMapCellPosition)
        local raceTrackGeographicMapCellType = self.raceTrackGeographicMap:getCellTypeAt(geographicMapCellPosition)
        local raceTrackGeographicMapCellTypeFactory = self.raceTrackGeographicMapCellTypeFactory
        if raceTrackGeographicMapCellType == raceTrackGeographicMapCellTypeFactory.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE or raceTrackGeographicMapCellType == raceTrackGeographicMapCellTypeFactory.VERTICAL_STRAIGHT_ROAD_CELL_TYPE then
            return true
        end
        return false
end


-- throws Exception
function RaceTrackDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        self:init()
        local baseRaceTrackGeographicMap = geographicMapInterface
        self.raceTrackGeographicMap = baseRaceTrackGeographicMap
        self.raceTrackGeographicMapCellTypeFactory = baseRaceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local roadGeographicMapCellHistory = RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance()
        local trackedList = roadGeographicMapCellHistory:getTracked()
        local geographicMapCellPosition = nil
        local lastIndex = trackedList:size() - 1
        local total = 0
        local ahead = 0
        for index = lastIndex, 0 + 1, -1 do
            geographicMapCellPosition = trackedList:get(index)
            total = 0
            ahead = index
            while self:isDropAllowedAt(trackedList:get(ahead)) do
                total = total + 1
                if total > self.STRAIGHTAWAY then
                    self.list:add(geographicMapCellPosition)
                    break
                end
                ahead = ahead + 1
                if ahead > lastIndex then
                    break
                end
            end
        end
        local size = self.list:size()
        for index = size - 1, 0, -1 do
            self:drop(allBinaryGameLayerManager, index)
        end
end


-- throws Exception
function RaceTrackDropCellPositionGenerator:processTick(allBinaryLayerManager)
        if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            local index = self.basicArrayListUtil:getRandomIndex(self.list)
            self:drop(allBinaryLayerManager, index)
        end
end


-- throws Exception
function RaceTrackDropCellPositionGenerator:drop(allBinaryLayerManager, index)
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end

return RaceTrackDropCellPositionGenerator


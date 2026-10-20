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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPositionBaseFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory")
local GeographicMapCellPositionFactoryInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
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

local BaseRaceTrackGeographicMap = {}
BaseRaceTrackGeographicMap.__index = BaseRaceTrackGeographicMap
BaseRaceTrackGeographicMap.className = "BaseRaceTrackGeographicMap"
setmetatable(BaseRaceTrackGeographicMap, {__index = BasicGeographicMap})

function BaseRaceTrackGeographicMap:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.raceTrackInfo = nil
    self.raceTrackData = nil
    self.miniGeographicMap = nil
end


function BaseRaceTrackGeographicMap.new(raceTrackInfo, raceTrackData, tiledLayer, miniGeographicMap, geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory)
    local self = setmetatable(BasicGeographicMap.new(raceTrackInfo:getId(), raceTrackInfo:getName(), raceTrackData:getCellTypeIdToGeographicMapCellTypeArray(), tiledLayer, raceTrackInfo:getForegroundBasicColor(), raceTrackInfo:getBackgroundBasicColor(), geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory), BaseRaceTrackGeographicMap)
    self:_init_fields()
        -- super(...) made self above
        self.raceTrackInfo = raceTrackInfo
        self.raceTrackData = raceTrackData
        self.miniGeographicMap = miniGeographicMap
        local miniTiledLayer = self.miniGeographicMap:getAllBinaryTiledLayer()
        if miniTiledLayer:getColumns() ~= self:getGeographicMapCellPositionFactory():getColumns() then
            local error = tostring(StringMaker.new():append("RaceTrackMap has incorrect Mini Map columns: "):appendint(java_int(miniTiledLayer:getColumns())):append(" != "):appendint(java_int(self:getGeographicMapCellPositionFactory():getColumns())))
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR)
            error(java_exception("Exception", error), 0)
        end
        if miniTiledLayer:getRows() ~= self:getGeographicMapCellPositionFactory():getRows() then
            local error = "RaceTrackMap has incorrect Mini Map rows"
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR)
            error(java_exception("Exception", error), 0)
        end
    return self
end


function BaseRaceTrackGeographicMap:getRaceTrackInfo()
        return self.raceTrackInfo
end


function BaseRaceTrackGeographicMap:setRaceTrackInfo(aRaceTrackInfo)
        self.raceTrackInfo = aRaceTrackInfo
end


function BaseRaceTrackGeographicMap:setMiniBasicGeographicMap(miniBasicGeographicMap)
        self.miniGeographicMap = miniBasicGeographicMap
end


function BaseRaceTrackGeographicMap:getMiniBasicGeographicMap()
        return self.miniGeographicMap
end


function BaseRaceTrackGeographicMap:getRaceTrackData()
        return self.raceTrackData
end


function BaseRaceTrackGeographicMap:setRaceTrackData(raceTrackData)
        self.raceTrackData = raceTrackData
end

return BaseRaceTrackGeographicMap


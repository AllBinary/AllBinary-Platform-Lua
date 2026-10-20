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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionBaseFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory")
local GeographicMapCellPositionFactoryInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local BaseRaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackGeographicMap = {}
RaceTrackGeographicMap.__index = RaceTrackGeographicMap
RaceTrackGeographicMap.className = "RaceTrackGeographicMap"
setmetatable(RaceTrackGeographicMap, {__index = BaseRaceTrackGeographicMap})

function RaceTrackGeographicMap:_init_fields()
    self.customMapGenerator = nil
end


function RaceTrackGeographicMap.new(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory, customMapGeneratorBaseFactory)
    local self = setmetatable(BaseRaceTrackGeographicMap.new(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface:getInstance(raceTrackInfo, raceTrackData), BasicGeographicMapFactory.new():getInstance(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface, geographicMapCellTypeFactory), geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory), RaceTrackGeographicMap)
    self:_init_fields()
        -- super(...) made self above
        self.customMapGenerator = customMapGeneratorBaseFactory:create(self)
    return self
end


function RaceTrackGeographicMap:getCustomMapGenerator()
        return self.customMapGenerator
end


-- throws Exception
function RaceTrackGeographicMap:isValid(geographicMapCellPosition)
        local customMapArray = self.customMapGenerator:getCustomMapArray()
        if geographicMapCellPosition:getColumn() >= (customMapArray[1].n or #customMapArray[1]) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Column: ")
            stringBuffer:appendint(java_int(geographicMapCellPosition:getColumn()))
            stringBuffer:append(" not in: ")
            stringBuffer:appendint((customMapArray[1].n or #customMapArray[1]))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            if geographicMapCellPosition:getColumn() == (customMapArray[1].n or #customMapArray[1]) then
                return true
            else
                return false
            end
        elseif geographicMapCellPosition:getRow() > (customMapArray.n or #customMapArray) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Row: ")
            stringBuffer:appendint(java_int(geographicMapCellPosition:getRow()))
            stringBuffer:append(" not in: ")
            stringBuffer:appendint((customMapArray.n or #customMapArray))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            if geographicMapCellPosition:getRow() == (customMapArray.n or #customMapArray) then
                return true
            else
                return false
            end
        end
        return true
end

return RaceTrackGeographicMap


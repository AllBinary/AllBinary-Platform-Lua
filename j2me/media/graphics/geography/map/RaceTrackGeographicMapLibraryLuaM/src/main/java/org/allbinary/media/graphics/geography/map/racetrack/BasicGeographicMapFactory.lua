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

local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPositionBaseFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory")
local GeographicMapCellPositionFactoryInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGeographicMapFactory = {}
BasicGeographicMapFactory.__index = BasicGeographicMapFactory
BasicGeographicMapFactory.className = "BasicGeographicMapFactory"

function BasicGeographicMapFactory.new()
    local self = setmetatable({}, BasicGeographicMapFactory)
    return self
end


-- throws Exception
function BasicGeographicMapFactory:getInstance(raceTrackInfo, raceTrackData, tiledLayerFactoryInterface, geographicMapCellPositionFactoryInterface, geographicMapCellTypeFactory)
        return BasicGeographicMap.new(SmallIntegerSingletonFactory.getInstance():getAt(math.tointeger(raceTrackInfo:getId() // 1) + 100 + 1), raceTrackInfo:getName(), raceTrackData:getCellTypeIdToGeographicMapCellTypeArray(), tiledLayerFactoryInterface:getMiniInstance(raceTrackData), BasicColorFactory.getInstance().CLEAR_COLOR, BasicColorFactory.getInstance().CLEAR_COLOR, geographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory.new(), geographicMapCellTypeFactory)
end

return BasicGeographicMapFactory


-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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

local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local WaypointLayer = require("org.allbinary.game.layer.waypoint.WaypointLayer")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local CustomMapGeneratorBase = require("org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBase")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local CustomMapGenerator = {}
CustomMapGenerator.__index = CustomMapGenerator
CustomMapGenerator.className = "CustomMapGenerator"
setmetatable(CustomMapGenerator, {__index = CustomMapGeneratorBase})

function CustomMapGenerator:_init_fields()
    self.customMapArray = nil
    self.raceTrackGeographicMap = nil
    self.geographicMapCellTypeFactory = nil
    self.dropCellPositionHistory = DropCellPositionHistory.getInstance()
end


function CustomMapGenerator.new(raceTrackGeographicMap)
    local self = setmetatable(CustomMapGeneratorBase.new(), CustomMapGenerator)
    self:_init_fields()
        self.raceTrackGeographicMap = raceTrackGeographicMap
        self.geographicMapCellTypeFactory = self.raceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local mapArray = raceTrackGeographicMap:getRaceTrackData():getMapArray()
        local size2 = (mapArray[1].n or #mapArray[1])
        self.customMapArray = java_new_array(0, (mapArray.n or #mapArray), size2)
        if (mapArray.n or #mapArray) ~= (self.customMapArray.n or #self.customMapArray) or (mapArray[1].n or #mapArray[1]) ~= (self.customMapArray[1].n or #self.customMapArray[1]) then
            error(java_exception("Exception", "Array Incorrect"), 0)
        end
    return self
end


-- throws Exception
function CustomMapGenerator:copyMapIntoCustomMap()
        local mapArray = self.raceTrackGeographicMap:getRaceTrackData():getMapArray()
        local startIndex2 = (mapArray[1].n or #mapArray[1]) - 1
        for index = (mapArray.n or #mapArray) - 1, 0, -1 do
            for index2 = startIndex2, 0, -1 do
                self.customMapArray[index + 1][index2 + 1] = self:getCustomType(index2, index, mapArray[index + 1][index2 + 1])
            end
        end
end


-- throws Exception
function CustomMapGenerator:getCustomType(column, row, currentType)
        local emptyType = self.geographicMapCellTypeFactory:getEmptyType()
        local geographicMapCellPositionFactory = self.raceTrackGeographicMap:getGeographicMapCellPositionFactory()
        local cellPosition = geographicMapCellPositionFactory:getAt(column, row)
        if self.dropCellPositionHistory:isCellPositionWithDrop(cellPosition) then
            local layer = self.dropCellPositionHistory:getLayerInterface(cellPosition)
            if layer == AllBinaryLayer.NULL_ALLBINARY_LAYER then
                return emptyType
            end
            local rtsLayer = layer
            if not (rtsLayer:getType() == WaypointLayer.getStaticType()) then
                return emptyType
            end
        end
        return currentType
end


function CustomMapGenerator:getCustomMapArray()
        return self.customMapArray
end

return CustomMapGenerator


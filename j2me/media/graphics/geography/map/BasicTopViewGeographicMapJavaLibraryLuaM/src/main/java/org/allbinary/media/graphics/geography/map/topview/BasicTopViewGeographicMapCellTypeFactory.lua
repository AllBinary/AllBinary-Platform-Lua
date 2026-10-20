-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.media.graphics.geography.map.topview

local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicTopViewGeographicMapCellTypeFactory = {}
BasicTopViewGeographicMapCellTypeFactory.__index = BasicTopViewGeographicMapCellTypeFactory
BasicTopViewGeographicMapCellTypeFactory.className = "BasicTopViewGeographicMapCellTypeFactory"
setmetatable(BasicTopViewGeographicMapCellTypeFactory, {__index = GeographicMapCellTypeFactory})

function BasicTopViewGeographicMapCellTypeFactory:_init_fields()
    self.BLOCK_CELL_TYPE = nil
    self.OFF_MAP_CELL_TYPE = nil
    self.FLOOR_CELL_TYPE = nil
    self.DOOR_CELL_TYPE = nil
    self.STAIRS_UP_CELL_TYPE = nil
    self.STAIRS_DOWN_CELL_TYPE = nil
    self.OTHER_CELL_TYPE = nil
    self.maxTileId = nil
end


function BasicTopViewGeographicMapCellTypeFactory.new(tileTypeToTileIdsMap, maxTileId)
    local self = setmetatable(GeographicMapCellTypeFactory.new(), BasicTopViewGeographicMapCellTypeFactory)
    self:_init_fields()
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        self.maxTileId = maxTileId
        local basicTopViewGeographicMapStrings = BasicTopViewGeographicMapStrings.getInstance()
        local geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
        local geographicMapCellTypeArray = geographicMapCellTypeFactory:getGeographicMapCellTypeArray()
        local type = 0
        if geographicMapCellTypeArray[type + 1] == nil then
            RaceTrackGeographicMapCellType.new(CommonStrings.getInstance().UNKNOWN, type, 999, 0)
        else
        end
        local BLOCK_CELL_TYPE = BasicTopViewGeographicMapCellType.createType(basicTopViewGeographicMapStrings.DEFAULT, 1, 1)
        local OFF_MAP_CELL_TYPE = BLOCK_CELL_TYPE
        local FLOOR_CELL_TYPE = BLOCK_CELL_TYPE
        local DOOR_CELL_TYPE = BLOCK_CELL_TYPE
        local STAIRS_UP_CELL_TYPE = BLOCK_CELL_TYPE
        local STAIRS_DOWN_CELL_TYPE = BLOCK_CELL_TYPE
        local OTHER_CELL_TYPE = BLOCK_CELL_TYPE
        local keyArray = HashtableUtil.getInstance():getKeysAsArray(tileTypeToTileIdsMap)
        local size = (keyArray.n or #keyArray)
        local idsWithTypeList = nil
        local key = nil
        local basicPlatormGeographicMapCellType = nil
        for index = 0, size - 1 do
            key = keyArray[index + 1]
            idsWithTypeList = tileTypeToTileIdsMap:get(key)
            if (key == basicTopViewGeographicMapStrings.WALL) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.WALL, idsWithTypeList, 1000)
                BLOCK_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.OFF_MAP) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.OFF_MAP, idsWithTypeList, 1001)
                OFF_MAP_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.FLOOR) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.FLOOR, idsWithTypeList, 1)
                FLOOR_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.DOOR) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.DOOR, idsWithTypeList, 1)
                DOOR_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.STAIRS_UP) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.STAIRS_UP, idsWithTypeList, 1)
                STAIRS_UP_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.STAIRS_DOWN) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.STAIRS_DOWN, idsWithTypeList, 1)
                STAIRS_DOWN_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.OTHER) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.OTHER, idsWithTypeList, 1)
                OTHER_CELL_TYPE = basicPlatormGeographicMapCellType
            end
        end
        self.BLOCK_CELL_TYPE = BLOCK_CELL_TYPE
        self.OFF_MAP_CELL_TYPE = OFF_MAP_CELL_TYPE
        self.FLOOR_CELL_TYPE = FLOOR_CELL_TYPE
        self.DOOR_CELL_TYPE = DOOR_CELL_TYPE
        self.STAIRS_UP_CELL_TYPE = STAIRS_UP_CELL_TYPE
        self.STAIRS_DOWN_CELL_TYPE = STAIRS_DOWN_CELL_TYPE
        self.OTHER_CELL_TYPE = OTHER_CELL_TYPE
        type = self.maxTileId - 1
        if geographicMapCellTypeArray[type + 1] == nil then
            RaceTrackGeographicMapCellType.new(commonStrings.START, type, 1, 0)
        else
        end
        type = self.maxTileId - 2
        if geographicMapCellTypeArray[type + 1] == nil then
            RaceTrackGeographicMapCellType.new(commonStrings.START, type, 1, 0)
        else
        end
    return self
end


function BasicTopViewGeographicMapCellTypeFactory:getStartType()
        return self.maxTileId - 1
end


function BasicTopViewGeographicMapCellTypeFactory:getEndType()
        return self.maxTileId - 2
end


function BasicTopViewGeographicMapCellTypeFactory:getEmptyType()
        return self.FLOOR_CELL_TYPE:getTypes()[1]
end


function BasicTopViewGeographicMapCellTypeFactory:isPath(cellType)
        if self.FLOOR_CELL_TYPE:isType(cellType) then
            return true
        end
        return false
end


function BasicTopViewGeographicMapCellTypeFactory:toString()
        return tostring(StringMaker.new():append("key: WALL/BLOCK_CELL_TYPE: "):append(tostring(self.BLOCK_CELL_TYPE)):append("key: FLOOR_CELL_TYPE: "):append(tostring(self.FLOOR_CELL_TYPE)):append("key: OTHER_CELL_TYPE: "):append(tostring(self.OTHER_CELL_TYPE)):append("key: OFF_MAP_CELL_TYPE: "):append(tostring(self.OFF_MAP_CELL_TYPE)):append("key: DOOR_CELL_TYPE: "):append(tostring(self.DOOR_CELL_TYPE)):append("key: STAIRS_DOWN_CELL_TYPE: "):append(tostring(self.STAIRS_DOWN_CELL_TYPE)):append("key: STAIRS_UP_CELL_TYPE: "):append(tostring(self.STAIRS_UP_CELL_TYPE)))
end
BasicTopViewGeographicMapCellTypeFactory.__tostring = function(self) return self:toString() end

return BasicTopViewGeographicMapCellTypeFactory


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

-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local CellPosition = require("org.allbinary.graphics.CellPosition")
local NullUtil = require("org.allbinary.logic.NullUtil")

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

local RaceTrackData = {}
RaceTrackData.__index = RaceTrackData
RaceTrackData.className = "RaceTrackData"

function RaceTrackData:_init_fields()
    self.tileSetImage = NullImage.NULL_IMAGE
    self.miniTileSetImage = NullImage.NULL_IMAGE
    self.cellWidth = 0
    self.cellHeight = 0
    self.miniCellWidth = 0
    self.miniCellHeight = 0
    self.mapArray = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY
    self.cellTypeIdToGeographicMapCellTypeArray = NullUtil.getInstance().NULL_INT_ARRAY
    self.NO_OVER_PASSES_ARRAY = java_new_array(nil, 0)
    self.overPassGeographicMapCellPositionArray = self.NO_OVER_PASSES_ARRAY
    self.id = nil
end


function RaceTrackData.new(id, cellWidth, cellHeight, miniCellWidth, miniCellHeight, cellTypeIdToGeographicMapCellTypeArray, mapArray)
    local self = setmetatable({}, RaceTrackData)
    self:_init_fields()
        self.id = id
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
        self.miniCellWidth = miniCellWidth
        self.miniCellHeight = miniCellHeight
        self.mapArray = mapArray
        self.cellTypeIdToGeographicMapCellTypeArray = cellTypeIdToGeographicMapCellTypeArray
    return self
end


function RaceTrackData:setMapArray(mapArray)
        self.mapArray = mapArray
end


function RaceTrackData:getMapArray()
        return self.mapArray
end


function RaceTrackData:setCellTypeIdToGeographicMapCellTypeArray(cellTypeIdToGeographicMapCellTypeArray)
        self.cellTypeIdToGeographicMapCellTypeArray = cellTypeIdToGeographicMapCellTypeArray
end


function RaceTrackData:getCellTypeIdToGeographicMapCellTypeArray()
        return self.cellTypeIdToGeographicMapCellTypeArray
end


function RaceTrackData:setCellWidth(cellWidth)
        self.cellWidth = cellWidth
end


function RaceTrackData:getCellWidth()
        return self.cellWidth
end


function RaceTrackData:setCellHeight(cellHeight)
        self.cellHeight = cellHeight
end


function RaceTrackData:getCellHeight()
        return self.cellHeight
end


function RaceTrackData:getOverPassGeographicMapCellPositionArray()
        return self.overPassGeographicMapCellPositionArray
end


function RaceTrackData:setOverPassGeographicMapCellPositionArray(overPassGeographicMapCellPositionArray)
        self.overPassGeographicMapCellPositionArray = overPassGeographicMapCellPositionArray
end


function RaceTrackData:getTileSetImage()
        return self.tileSetImage
end


function RaceTrackData:setTileSetImage(tileSetImage)
        self.tileSetImage = tileSetImage
end


function RaceTrackData:getMiniTileSetImage()
        return self.miniTileSetImage
end


function RaceTrackData:setMiniTileSetImage(miniTileSetImage)
        self.miniTileSetImage = miniTileSetImage
end


function RaceTrackData:getMiniCellWidth()
        return self.miniCellWidth
end


function RaceTrackData:setMiniCellWidth(miniCellWidth)
        self.miniCellWidth = miniCellWidth
end


function RaceTrackData:getMiniCellHeight()
        return self.miniCellHeight
end


function RaceTrackData:setMiniCellHeight(miniCellHeight)
        self.miniCellHeight = miniCellHeight
end


function RaceTrackData:setId(id)
        self.id = id
end


function RaceTrackData:getId()
        return self.id
end

return RaceTrackData


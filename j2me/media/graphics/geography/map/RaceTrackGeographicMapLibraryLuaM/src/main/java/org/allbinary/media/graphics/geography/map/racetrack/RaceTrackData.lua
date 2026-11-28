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

local RaceTrackData = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData"] = RaceTrackData

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table RaceTrackData is declared before the requires
RaceTrackData.__index = RaceTrackData
RaceTrackData.className = "RaceTrackData"
RaceTrackData.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData"

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
    if self.id == nil then self.id = nil end
end


function RaceTrackData._jinit(self, id, cellWidth, cellHeight, miniCellWidth, miniCellHeight, cellTypeIdToGeographicMapCellTypeArray, mapArray)
    RaceTrackData._init_fields(self)
        self.id = id
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
        self.miniCellWidth = miniCellWidth
        self.miniCellHeight = miniCellHeight
        self.mapArray = mapArray
        self.cellTypeIdToGeographicMapCellTypeArray = cellTypeIdToGeographicMapCellTypeArray
    return self
end

function RaceTrackData.new(...)
    local self = setmetatable({}, RaceTrackData)
    RaceTrackData._jinit(self, ...)
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


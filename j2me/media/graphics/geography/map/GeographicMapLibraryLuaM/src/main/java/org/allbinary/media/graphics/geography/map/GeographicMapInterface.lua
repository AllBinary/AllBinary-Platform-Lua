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
-- package org.allbinary.media.graphics.geography.map

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local Layer = require("org.allbinary.layer.Layer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local GeographicMapInterface = {}
GeographicMapInterface.__index = GeographicMapInterface
GeographicMapInterface.className = "GeographicMapInterface"


function GeographicMapInterface:getId()
    error("abstract method getId")
end


function GeographicMapInterface:getName()
    error("abstract method getName")
end


function GeographicMapInterface:reset()
    error("abstract method reset")
end


function GeographicMapInterface:getAllBinaryTiledLayer()
    error("abstract method getAllBinaryTiledLayer")
end


-- throws Exception
function GeographicMapInterface:getCellPositionsAt(layer, currentCellPositionArray, cellPositionArray)
    error("abstract method getCellPositionsAt")
end


-- throws Exception
function GeographicMapInterface:getCellPositionAtXY(x, y)
    error("abstract method getCellPositionAtXY")
end


-- throws Exception
function GeographicMapInterface:getCellPositionAtXYNoThrow(x, y)
    error("abstract method getCellPositionAtXYNoThrow")
end


function GeographicMapInterface:getCellTypeFromMapCellTypeInt(cellTypeId)
    error("abstract method getCellTypeFromMapCellTypeInt")
end


-- throws Exception
function GeographicMapInterface:getCellTypeAtXY(x, y)
    error("abstract method getCellTypeAtXY")
end


-- throws Exception
function GeographicMapInterface:getCellTypeAt(geographicMapCellPosition)
    error("abstract method getCellTypeAt")
end


function GeographicMapInterface:getGeographicMapCellPositionFactory()
    error("abstract method getGeographicMapCellPositionFactory")
end


function GeographicMapInterface:getGeographicMapCellPositionFactoryInterface()
    error("abstract method getGeographicMapCellPositionFactoryInterface")
end


function GeographicMapInterface:getForegroundBasicColor()
    error("abstract method getForegroundBasicColor")
end


function GeographicMapInterface:getBackgroundBasicColor()
    error("abstract method getBackgroundBasicColor")
end

return GeographicMapInterface


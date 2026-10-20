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

-- local TiledLayer = require("javax.microedition.lcdui.game.TiledLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TiledLayerFactory = {}
TiledLayerFactory.__index = TiledLayerFactory
TiledLayerFactory.className = "TiledLayerFactory"

function TiledLayerFactory.new()
    local self = setmetatable({}, TiledLayerFactory)
    return self
end


function TiledLayerFactory:getInstance(raceTrackData)
        local mapArray = raceTrackData:getMapArray()
        return TiledLayer.new((mapArray[1].n or #mapArray[1]), (mapArray.n or #mapArray), raceTrackData:getTileSetImage(), raceTrackData:getCellWidth(), raceTrackData:getCellHeight())
end


function TiledLayerFactory:getMiniInstance(raceTrackData)
        local mapArray = raceTrackData:getMapArray()
        return TiledLayer.new((mapArray[1].n or #mapArray[1]), (mapArray.n or #mapArray), raceTrackData:getMiniTileSetImage(), raceTrackData:getMiniCellWidth(), raceTrackData:getMiniCellHeight())
end

return TiledLayerFactory


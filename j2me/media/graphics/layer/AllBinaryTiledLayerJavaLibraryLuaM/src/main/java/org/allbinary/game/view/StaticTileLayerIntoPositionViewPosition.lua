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
-- package org.allbinary.game.view

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local Layer = require("org.allbinary.layer.Layer")
local NullLayer = require("org.allbinary.layer.NullLayer")
local ViewPosition = require("org.allbinary.view.ViewPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StaticTileLayerIntoPositionViewPosition = {}
StaticTileLayerIntoPositionViewPosition.__index = StaticTileLayerIntoPositionViewPosition
StaticTileLayerIntoPositionViewPosition.className = "StaticTileLayerIntoPositionViewPosition"
setmetatable(StaticTileLayerIntoPositionViewPosition, {__index = ViewPosition})


function StaticTileLayerIntoPositionViewPosition.new()
    local self = setmetatable(ViewPosition.new(0, 0, 0), StaticTileLayerIntoPositionViewPosition)
        -- super(...) made self above
    return self
end


function StaticTileLayerIntoPositionViewPosition:getX()
        return ViewPosition.getX(self) - StaticTileLayerIntoPositionViewPosition.tiledLayer:getXP()
end


function StaticTileLayerIntoPositionViewPosition:getY()
        return ViewPosition.getY(self) - StaticTileLayerIntoPositionViewPosition.tiledLayer:getYP()
end


function StaticTileLayerIntoPositionViewPosition:getZ()
        return ViewPosition.getZ(self) - StaticTileLayerIntoPositionViewPosition.tiledLayer:getZP()
end


function StaticTileLayerIntoPositionViewPosition.setTiledLayer(tiledLayer)
        StaticTileLayerIntoPositionViewPosition.tiledLayer = tiledLayer
end

StaticTileLayerIntoPositionViewPosition.tiledLayer = NullLayer.getInstance()
StaticTileLayerIntoPositionViewPosition.layer = AllBinaryLayer.NULL_ALLBINARY_LAYER

return StaticTileLayerIntoPositionViewPosition


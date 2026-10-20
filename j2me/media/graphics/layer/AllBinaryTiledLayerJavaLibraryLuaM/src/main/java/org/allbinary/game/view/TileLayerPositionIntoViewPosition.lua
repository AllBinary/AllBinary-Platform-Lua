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

local TileLayerPositionIntoViewPosition = {}
TileLayerPositionIntoViewPosition.__index = TileLayerPositionIntoViewPosition
TileLayerPositionIntoViewPosition.className = "TileLayerPositionIntoViewPosition"
setmetatable(TileLayerPositionIntoViewPosition, {__index = ViewPosition})

function TileLayerPositionIntoViewPosition:_init_fields()
    self.tiledLayer = NullLayer.getInstance()
end


function TileLayerPositionIntoViewPosition.new()
    local self = setmetatable(ViewPosition.new(0, 0, 0), TileLayerPositionIntoViewPosition)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TileLayerPositionIntoViewPosition:getX()
        return ViewPosition.getX(self) - self.tiledLayer:getXP()
end


function TileLayerPositionIntoViewPosition:getY()
        return ViewPosition.getY(self) - self.tiledLayer:getYP()
end


function TileLayerPositionIntoViewPosition:getZ()
        return ViewPosition.getZ(self) - self.tiledLayer:getZP()
end


function TileLayerPositionIntoViewPosition:setTiledLayer(tiledLayer)
        self.tiledLayer = tiledLayer
end

return TileLayerPositionIntoViewPosition


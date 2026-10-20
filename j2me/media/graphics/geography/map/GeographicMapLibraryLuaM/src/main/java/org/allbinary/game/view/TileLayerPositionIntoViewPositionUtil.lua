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
-- package org.allbinary.game.view

local TileLayerPositionIntoViewPosition = require("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TileLayerPositionIntoViewPositionUtil = {}
TileLayerPositionIntoViewPositionUtil.__index = TileLayerPositionIntoViewPositionUtil
TileLayerPositionIntoViewPositionUtil.className = "TileLayerPositionIntoViewPositionUtil"

function TileLayerPositionIntoViewPositionUtil.new()
    local self = setmetatable({}, TileLayerPositionIntoViewPositionUtil)
    return self
end


function TileLayerPositionIntoViewPositionUtil.init(gameCanvasInterface, viewPosition)
        local geographicMapCompositeInterface = gameCanvasInterface:getLayerManager()
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        viewPosition:setTiledLayer(tiledLayer)
end

return TileLayerPositionIntoViewPositionUtil


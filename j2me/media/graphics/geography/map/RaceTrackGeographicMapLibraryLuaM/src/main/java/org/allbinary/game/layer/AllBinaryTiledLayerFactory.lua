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
-- package org.allbinary.game.layer

-- local TiledLayer = require("javax.microedition.lcdui.game.TiledLayer")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AllBinaryTiledLayerFactoryInterface = require("org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface")
local RaceTrackData = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData")
local RaceTrackInfo = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo")
local TiledLayerFactory = require("org.allbinary.media.graphics.geography.map.racetrack.TiledLayerFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryTiledLayerFactory = {}
AllBinaryTiledLayerFactory.__index = AllBinaryTiledLayerFactory
AllBinaryTiledLayerFactory.className = "AllBinaryTiledLayerFactory"

function AllBinaryTiledLayerFactory.new()
    local self = setmetatable({}, AllBinaryTiledLayerFactory)
    return self
end


-- throws Exception
function AllBinaryTiledLayerFactory:getInstance(raceTrackInfo, raceTrackData)
        local allbinaryTiledLayer = nil
        local tiledLayer = TiledLayerFactory.new():getInstance(raceTrackData)
        allbinaryTiledLayer = AllBinaryJ2METiledLayer.new(raceTrackData:getId(), tiledLayer, raceTrackData:getMapArray(), math.tointeger(BasicColorFactory.getInstance().RED // 1))
        allbinaryTiledLayer:setCells(raceTrackData:getMapArray())
        return allbinaryTiledLayer
end


-- throws Exception
function AllBinaryTiledLayerFactory:getMiniInstance(raceTrackData)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local tiledLayer = TiledLayerFactory.new():getMiniInstance(raceTrackData)
        local allbinaryTiledLayer = AllBinaryJ2METiledLayer.new(smallIntegerSingletonFactory:getAt(math.tointeger(raceTrackData:getId() // 1) + 100 + 1), tiledLayer, raceTrackData:getMapArray(), math.tointeger(BasicColorFactory.getInstance().RED // 1))
        allbinaryTiledLayer:setCells(raceTrackData:getMapArray())
        return allbinaryTiledLayer
end

return AllBinaryTiledLayerFactory


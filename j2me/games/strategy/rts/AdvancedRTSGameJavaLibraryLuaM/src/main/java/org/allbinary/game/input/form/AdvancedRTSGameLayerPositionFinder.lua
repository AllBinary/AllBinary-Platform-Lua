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
-- package org.allbinary.game.input.form

local LayerPositionFinderInterface = require("org.allbinary.game.input.LayerPositionFinderInterface")
local WaypointCellPositionHistory = require("org.allbinary.game.layer.waypoint.WaypointCellPositionHistory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvancedRTSGameLayerPositionFinder = {}
AdvancedRTSGameLayerPositionFinder.__index = AdvancedRTSGameLayerPositionFinder
AdvancedRTSGameLayerPositionFinder.className = "AdvancedRTSGameLayerPositionFinder"


function AdvancedRTSGameLayerPositionFinder.getInstance()
        return AdvancedRTSGameLayerPositionFinder.instance
end


function AdvancedRTSGameLayerPositionFinder.new()
    local self = setmetatable({}, AdvancedRTSGameLayerPositionFinder)
    return self
end


function AdvancedRTSGameLayerPositionFinder:getLayerInterface(geographicMapCellPosition)
        local layerInterface = DropCellPositionHistory.getInstance():getLayerInterface(geographicMapCellPosition)
        if layerInterface == AllBinaryLayer.NULL_ALLBINARY_LAYER then
            layerInterface = WaypointCellPositionHistory.getInstance():getLayerInterface(geographicMapCellPosition)
        end
        return layerInterface
end

AdvancedRTSGameLayerPositionFinder.instance = AdvancedRTSGameLayerPositionFinder.new()

return AdvancedRTSGameLayerPositionFinder


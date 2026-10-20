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
-- package org.allbinary.game.behavior.topview

local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local BasicTopViewGeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local TopViewGameLayerBehavior = require("org.allbinary.game.behavior.topview.TopViewGameLayerBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapTopViewLayerBehavior = {}
GeographicMapTopViewLayerBehavior.__index = GeographicMapTopViewLayerBehavior
GeographicMapTopViewLayerBehavior.className = "GeographicMapTopViewLayerBehavior"
setmetatable(GeographicMapTopViewLayerBehavior, {__index = TopViewGameLayerBehavior})


function GeographicMapTopViewLayerBehavior.new(maxGravityActionIndex)
    local self = setmetatable(TopViewGameLayerBehavior.new(maxGravityActionIndex), GeographicMapTopViewLayerBehavior)
        -- super(...) made self above
    return self
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer)
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPositionList, velocityProperties, layer)
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:gravity(velocityProperties, geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:left(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer)
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:move(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        return false
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)
end


-- throws Exception
function GeographicMapTopViewLayerBehavior:right(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer)
end


function GeographicMapTopViewLayerBehavior:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        local basicTopViewGeographicMapCellTypeFactory = nil
        for index = 0, size - 1 do
            basicTopViewGeographicMapCellTypeFactory = geographicMapInterfaceArray[index + 1]:getGeographicMapCellTypeFactory()
            if basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE:isType(geographicMapCellTypeArray[index + 1]) then
                return true
            end
        end
        return false
end


function GeographicMapTopViewLayerBehavior:isOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray)
        local size = (geographicMapInterfaceArray.n or #geographicMapInterfaceArray)
        local basicTopViewGeographicMapCellTypeFactory = nil
        for index = 0, size - 1 do
            basicTopViewGeographicMapCellTypeFactory = geographicMapInterfaceArray[index + 1]:getGeographicMapCellTypeFactory()
            if basicTopViewGeographicMapCellTypeFactory.OFF_MAP_CELL_TYPE:isType(geographicMapCellTypeArray[index + 1]) then
                return true
            end
        end
        return false
end

return GeographicMapTopViewLayerBehavior


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
-- package org.allbinary.game.layer.geographic.map

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerPartialCellPositionsUtil = {}
LayerPartialCellPositionsUtil.__index = LayerPartialCellPositionsUtil
LayerPartialCellPositionsUtil.className = "LayerPartialCellPositionsUtil"

function LayerPartialCellPositionsUtil.new()
    local self = setmetatable({}, LayerPartialCellPositionsUtil)
    return self
end


-- throws Exception
function LayerPartialCellPositionsUtil:getAll(geographicMapInterface, layerInterface, reusableList)
        reusableList:clear()
        local topLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP(), layerInterface:getYP())
        local topRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth(), layerInterface:getYP())
        local bottomLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP(), layerInterface:getYP() + layerInterface:getHeight())
        local bottomRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth(), layerInterface:getYP() + layerInterface:getHeight())
        if topLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            reusableList:add(topLeftGeographicMapCellPosition)
        end
        if topRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and topLeftGeographicMapCellPosition ~= topRightGeographicMapCellPosition then
            reusableList:add(topRightGeographicMapCellPosition)
        end
        if bottomLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomLeftGeographicMapCellPosition) then
            reusableList:add(bottomLeftGeographicMapCellPosition)
        end
        if bottomRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomRightGeographicMapCellPosition) then
            reusableList:add(bottomRightGeographicMapCellPosition)
        end
        return reusableList
end


-- throws Exception
function LayerPartialCellPositionsUtil:getAllDXY(geographicMapInterface, layerInterface, dx, dy, reusableList)
        reusableList:clear()
        local topLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + dx, layerInterface:getYP() + dy)
        local topRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth() + dx, layerInterface:getYP() + dy)
        local bottomLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + dx, layerInterface:getYP() + layerInterface:getHeight() + dy)
        local bottomRightGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXYNoThrow(layerInterface:getXP() + layerInterface:getWidth() + dx, layerInterface:getYP() + layerInterface:getHeight() + dy)
        if topLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            reusableList:add(topLeftGeographicMapCellPosition)
        end
        if topRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and topLeftGeographicMapCellPosition ~= topRightGeographicMapCellPosition then
            reusableList:add(topRightGeographicMapCellPosition)
        end
        if bottomLeftGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomLeftGeographicMapCellPosition) then
            reusableList:add(bottomLeftGeographicMapCellPosition)
        end
        if bottomRightGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and not reusableList:contains(bottomRightGeographicMapCellPosition) then
            reusableList:add(bottomRightGeographicMapCellPosition)
        end
        return reusableList
end


function LayerPartialCellPositionsUtil.getInstance()
        return LayerPartialCellPositionsUtil.instance
end

LayerPartialCellPositionsUtil.instance = LayerPartialCellPositionsUtil.new()

return LayerPartialCellPositionsUtil


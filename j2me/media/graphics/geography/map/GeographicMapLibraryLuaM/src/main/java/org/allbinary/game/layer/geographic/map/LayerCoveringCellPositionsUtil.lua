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
local CellPositionsUtil = require("org.allbinary.media.graphics.geography.map.CellPositionsUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerCoveringCellPositionsUtil = {}
LayerCoveringCellPositionsUtil.__index = LayerCoveringCellPositionsUtil
LayerCoveringCellPositionsUtil.className = "LayerCoveringCellPositionsUtil"

function LayerCoveringCellPositionsUtil:_init_fields()
    self.cellPositionsUtil = CellPositionsUtil.getInstance()
end

function LayerCoveringCellPositionsUtil.new()
    local self = setmetatable({}, LayerCoveringCellPositionsUtil)
    self:_init_fields()
    return self
end


function LayerCoveringCellPositionsUtil.getInstance()
        return LayerCoveringCellPositionsUtil.instance
end


-- throws Exception
function LayerCoveringCellPositionsUtil:getAllXY(geographicMapInterface, layerInterface, x, y, reusableList)
        local topLeftGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(x, y)
        return self:getAll(geographicMapInterface, topLeftGeographicMapCellPosition, layerInterface, reusableList)
end


-- throws Exception
function LayerCoveringCellPositionsUtil:getAll(geographicMapInterface, topLeftGeographicMapCellPosition, layerInterface, reusableList)
        reusableList:clear()
        local columns = layerInterface:getWidth() / geographicMapInterface:getAllBinaryTiledLayer():getCellWidth()
        local rows = layerInterface:getHeight() / geographicMapInterface:getAllBinaryTiledLayer():getCellHeight()
        if columns == 0 then
            columns = 1
        end
        if rows == 0 then
            rows = 1
        end
        return self.cellPositionsUtil:getAll(geographicMapInterface, topLeftGeographicMapCellPosition, columns, rows, reusableList)
end

LayerCoveringCellPositionsUtil.instance = LayerCoveringCellPositionsUtil.new()

return LayerCoveringCellPositionsUtil


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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CellPositionsUtil = {}
CellPositionsUtil.__index = CellPositionsUtil
CellPositionsUtil.className = "CellPositionsUtil"

function CellPositionsUtil:_init_fields()
    self.reusableSingleThreadedSurroundingList = BasicArrayListS.new(8)
    self.surroundArray = {{-1, -1}, {0, -1}, {1, -1}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}, {-1, 0}}
end

function CellPositionsUtil.new()
    local self = setmetatable({}, CellPositionsUtil)
    self:_init_fields()
    return self
end


function CellPositionsUtil.getInstance()
        return CellPositionsUtil.instance
end


-- throws Exception
function CellPositionsUtil:getAll(geographicMapInterface, topRightGeographicMapCellPosition, columns, rows, reusableList)
        reusableList:clear()
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local lastColumn = topRightGeographicMapCellPosition:getColumn() + columns
        local lastRow = topRightGeographicMapCellPosition:getRow() + rows
        if (columns > 1 and lastColumn > geographicMapInterface:getAllBinaryTiledLayer():getColumns()) or (rows > 1 and lastRow > geographicMapInterface:getAllBinaryTiledLayer():getRows()) then
            return reusableList
        end
        for rowIndex = 0, rows - 1 do
            for columnIndex = 0, columns - 1 do
                local geographicMapCellPosition = geographicMapCellPositionFactory:getAt(topRightGeographicMapCellPosition:getColumn() + columnIndex, topRightGeographicMapCellPosition:getRow() + rowIndex)
                reusableList:add(geographicMapCellPosition)
            end
        end
        return reusableList
end


-- throws Exception
function CellPositionsUtil:getAllSurrounding(geographicMapInterface, occupyList, reusableList)
        reusableList:clear()
        for index = occupyList:size() - 1, 0, -1 do
            local layerGeographicMapCellPosition = occupyList:get(index)
            local surroundingGeographicMapCellPositionList = self:getAllSurroundingAt(geographicMapInterface, layerGeographicMapCellPosition, self.reusableSingleThreadedSurroundingList)
            for index2 = surroundingGeographicMapCellPositionList:size() - 1, 0, -1 do
                local geographicMapCellPosition = surroundingGeographicMapCellPositionList:get(index2)
                if not reusableList:contains(geographicMapCellPosition) and not occupyList:contains(geographicMapCellPosition) then
                    reusableList:add(geographicMapCellPosition)
                end
            end
        end
        return reusableList
end


-- throws Exception
function CellPositionsUtil:getAllSurroundingAt(geographicMapInterface, layerGeographicMapCellPosition, reusableSurroundingList)
        reusableSurroundingList:clear()
        local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local row = 0
        local column = 0
        for index = 0, 8 - 1 do
            column = layerGeographicMapCellPosition:getColumn() + self.surroundArray[index + 1][1]
            row = layerGeographicMapCellPosition:getRow() + self.surroundArray[index + 1][2]
            if tiledLayer:isOnTileLayer(column, row) then
                local geographicMapCellPosition = geographicMapCellPositionFactory:getAt(column, row)
                reusableSurroundingList:add(geographicMapCellPosition)
            end
        end
        return reusableSurroundingList
end

CellPositionsUtil.instance = CellPositionsUtil.new()

return CellPositionsUtil


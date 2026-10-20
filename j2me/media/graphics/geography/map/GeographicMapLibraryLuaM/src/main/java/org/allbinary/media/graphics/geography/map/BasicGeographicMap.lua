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

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local Layer = require("org.allbinary.layer.Layer")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local SimpleGeographicMap = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMap")
local GeographicMapInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGeographicMap = {}
BasicGeographicMap.__index = BasicGeographicMap
BasicGeographicMap.className = "BasicGeographicMap"
setmetatable(BasicGeographicMap, {__index = SimpleGeographicMap})

function BasicGeographicMap:_init_fields()
    self.mathUtil = MathUtil.getInstance()
    self.geographicMapCellPositionFactory = nil
    self.geographicMapCellPositionFactoryInterface = nil
    self.geographicMapCellTypeFactory = nil
end


function BasicGeographicMap.new(id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor, geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory)
    local self = setmetatable(SimpleGeographicMap.new(id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor), BasicGeographicMap)
    self:_init_fields()
        -- super(...) made self above
        self.geographicMapCellPositionFactoryInterface = geographicMapCellPositionFactoryInterface
        self.geographicMapCellPositionFactory = geographicMapCellPositionBaseFactory:getInstance(self)
        self.geographicMapCellTypeFactory = geographicMapCellTypeFactory
    return self
end


-- throws Exception
function BasicGeographicMap:getCellPosition(direction, oldGeographicMapCellPosition)
        do
            local switch_value = direction
            if switch_value == 0 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() - 1, oldGeographicMapCellPosition:getRow())
            elseif switch_value == 1 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() + 1, oldGeographicMapCellPosition:getRow())
            elseif switch_value == 2 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() - 1)
            elseif switch_value == 3 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
            else
                error(java_exception("Exception", "Only Four Directions"), 0)
            end
        end
end


-- throws Exception
function BasicGeographicMap:getCellPositionNoThrow(direction, oldGeographicMapCellPosition)
        do
            local switch_value = direction
            if switch_value == 0 then
                if oldGeographicMapCellPosition:getColumn() - 1 >= 0 then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() - 1, oldGeographicMapCellPosition:getRow())
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
            elseif switch_value == 1 then
                if oldGeographicMapCellPosition:getColumn() + 1 < self:getAllBinaryTiledLayer():getColumns() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() + 1, oldGeographicMapCellPosition:getRow())
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
            elseif switch_value == 2 then
                if oldGeographicMapCellPosition:getRow() - 1 >= 0 then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() - 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
            elseif switch_value == 3 then
                if oldGeographicMapCellPosition:getRow() + 1 < self:getAllBinaryTiledLayer():getRows() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
            else
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            end
        end
end


-- throws Exception
function BasicGeographicMap:isOfFourDirections(oldGeographicMapCellPosition, newGeographicMapCellPosition)
        for index = 0, 4 - 1 do
            if newGeographicMapCellPosition == self:getCellPositionNoThrow(index, oldGeographicMapCellPosition) then
                return true
            end
        end
        return false
end


-- throws Exception
function BasicGeographicMap:getCellPositionAtXY(x, y)
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_column = self.mathUtil:abs(x / allBinaryTiledLayer:getCellHeight())
        local i_row = self.mathUtil:abs(y / allBinaryTiledLayer:getCellWidth())
        return self.geographicMapCellPositionFactory:getAt(i_column, i_row)
end


function BasicGeographicMap:getCellPositionAtXYNoThrow(x, y)
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_column = self.mathUtil:abs(x / allBinaryTiledLayer:getCellHeight())
        local i_row = self.mathUtil:abs(y / allBinaryTiledLayer:getCellWidth())
        if allBinaryTiledLayer:getColumns() > i_column and allBinaryTiledLayer:getRows() > i_row then
            local try_ok, try_error = pcall(function()
                return self.geographicMapCellPositionFactory:getAt(i_column, i_row)
            end)
            if not try_ok then
                local e = try_error
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            end
        else
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        end
end


-- throws Exception
function BasicGeographicMap:isOnMap(geographicMapCellPosition)
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_column = geographicMapCellPosition:getColumn()
        local i_row = geographicMapCellPosition:getRow()
        if allBinaryTiledLayer:getColumns() > i_column and allBinaryTiledLayer:getRows() > i_row then
            return true
        else
            return false
        end
end


-- throws Exception
function BasicGeographicMap:getCellPositionAtNoThrow(x, y, x2, y2, geographicMapCellPositionList)
        geographicMapCellPositionList:clear()
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_columnMin = self.mathUtil:abs(x / allBinaryTiledLayer:getCellHeight())
        local i_rowMin = self.mathUtil:abs(y / allBinaryTiledLayer:getCellWidth())
        local i_columnMax = self.mathUtil:abs(x2 / allBinaryTiledLayer:getCellHeight()) + 1
        local i_rowMax = self.mathUtil:abs(y2 / allBinaryTiledLayer:getCellWidth()) + 1
        for columnIndex = i_columnMin, i_columnMax - 1 do
            for rowIndex = i_rowMin, i_rowMax - 1 do
                if allBinaryTiledLayer:getColumns() > columnIndex and allBinaryTiledLayer:getRows() > rowIndex then
                    geographicMapCellPositionList:add(self.geographicMapCellPositionFactory:getAt(columnIndex, rowIndex))
                end
            end
        end
        return geographicMapCellPositionList
end


-- throws Exception
function BasicGeographicMap:getCellPositionsAt(layer, currentCellPositionArray, cellPositionArray)
        local hasChanged = false
        local size = (cellPositionArray.n or #cellPositionArray)
        local size2 = (cellPositionArray[1].n or #cellPositionArray[1])
        local xPortion = layer:getXP() / (size - 1)
        local yPortion = layer:getYP() / (size - 1)
        for index = 0, size - 1 do
            for index2 = 0, size2 - 1 do
                local x = xPortion * index
                local y = yPortion * index
                cellPositionArray[index + 1][index2 + 1] = self:getCellPositionAtXY(x, y)
                if currentCellPositionArray[index + 1][index2 + 1] ~= cellPositionArray[index + 1][index2 + 1] then
                    hasChanged = true
                end
            end
        end
        return hasChanged
end


-- throws Exception
function BasicGeographicMap:getCellTypeAtXY(x, y)
        local cellPosition = self:getCellPositionAtXY(x, y)
        return self:getCellTypeAt(cellPosition)
end


function BasicGeographicMap:getGeographicMapCellPositionFactory()
        return self.geographicMapCellPositionFactory
end


function BasicGeographicMap:getGeographicMapCellPositionFactoryInterface()
        return self.geographicMapCellPositionFactoryInterface
end


function BasicGeographicMap:getGeographicMapCellTypeFactory()
        return self.geographicMapCellTypeFactory
end

BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY = java_new_array(nil, 0)

return BasicGeographicMap


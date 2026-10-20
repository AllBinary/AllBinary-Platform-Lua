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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

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

local BasicGeographicMapCellPositionFactory = {}
BasicGeographicMapCellPositionFactory.__index = BasicGeographicMapCellPositionFactory
BasicGeographicMapCellPositionFactory.className = "BasicGeographicMapCellPositionFactory"

function BasicGeographicMapCellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.geographicMapCellPositionArray = nil
    self.geographicMapInterface = nil
    self.geographicMapCellPositionFactoryInterface = nil
    self.columns = nil
    self.rows = nil
    self.tiledLayer = nil
end


function BasicGeographicMapCellPositionFactory.new(geographicMapInterface)
    local self = setmetatable({}, BasicGeographicMapCellPositionFactory)
    self:_init_fields()
        self.geographicMapInterface = geographicMapInterface
        self.geographicMapCellPositionFactoryInterface = self.geographicMapInterface:getGeographicMapCellPositionFactoryInterface()
        self.tiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        self.columns = self.tiledLayer:getColumns()
        self.rows = self.tiledLayer:getRows()
        self.geographicMapCellPositionArray = java_new_array(nil, self.rows, self.columns)
        self:init()
    return self
end


-- throws Exception
function BasicGeographicMapCellPositionFactory:init()
        local tiledLayer = self.tiledLayer
        local columns = self:getColumns()
        local rows = self:getRows()
        local width = tiledLayer:getCellWidth()
        local height = tiledLayer:getCellHeight()
        for column = 0, columns - 1 do
            for row = 0, rows - 1 do
                self:createInstance(column, row, width, height)
            end
        end
end


-- throws Exception
function BasicGeographicMapCellPositionFactory:visit(geographicMapCelPositionFactoryInitVisitorInterface)
        local tiledLayer = self.tiledLayer
        local columns = self:getColumns()
        local rows = self:getRows()
        local try_ok, try_error = pcall(function()
            local cellPosition = nil
            for column = 0, columns - 1 do
                for row = 0, rows - 1 do
                    cellPosition = self:getAt(column, row)
                    geographicMapCelPositionFactoryInitVisitorInterface:visit(tiledLayer, cellPosition)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local commonSeps = CommonSeps.getInstance()
            self.logUtil:put(tostring(StringMaker.new():append(commonSeps.BRACKET_OPEN):appendint(rows):append(commonSeps.BRACKET_CLOSE):append(commonSeps.BRACKET_OPEN):appendint(columns):append(commonSeps.BRACKET_CLOSE)), self, "visit", e)
            error(e, 0)
        end
end


-- throws Exception
function BasicGeographicMapCellPositionFactory:getAt(i_column, i_row)
        return self.geographicMapCellPositionArray[i_row + 1][i_column + 1]
end


-- throws Exception
function BasicGeographicMapCellPositionFactory:getInstance(anotherMapGeographicMapCellPosition)
        return self:getAt(anotherMapGeographicMapCellPosition:getColumn(), anotherMapGeographicMapCellPosition:getRow())
end


-- throws Exception
function BasicGeographicMapCellPositionFactory:createInstance(i_column, i_row, width, height)
        local cellPositionCanBeNull = self.geographicMapCellPositionArray[i_row + 1][i_column + 1]
        if cellPositionCanBeNull == nil then
            cellPositionCanBeNull = self.geographicMapCellPositionFactoryInterface:getInstance(self.geographicMapInterface, i_column, i_row, self.columns, self.rows, width, height)
            self.geographicMapCellPositionArray[i_row + 1][i_column + 1] = cellPositionCanBeNull
        end
        return cellPositionCanBeNull
end


function BasicGeographicMapCellPositionFactory:getColumns()
        return self.columns
end


function BasicGeographicMapCellPositionFactory:getRows()
        return self.rows
end

return BasicGeographicMapCellPositionFactory


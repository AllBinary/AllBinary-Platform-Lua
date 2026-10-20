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
-- package org.allbinary.graphics

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local CellPositionFactory = {}
CellPositionFactory.__index = CellPositionFactory
CellPositionFactory.className = "CellPositionFactory"

function CellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NONE = CellPosition.new(-1, -1, -1, -1)
    self.cellPositionArray = java_new_array(nil, 0, 0)
    self.columns = 0
    self.rows = 0
end


function CellPositionFactory.getInstance()
        return CellPositionFactory.SINGLETON
end


function CellPositionFactory.new()
    local self = setmetatable({}, CellPositionFactory)
    self:_init_fields()
    return self
end


function CellPositionFactory:init(columns, rows)
        local commonStrings = CommonStrings.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Init: columns: ")
        stringBuffer:appendint(columns)
        stringBuffer:append(" rows: ")
        stringBuffer:appendint(rows)
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.INIT)
        self.cellPositionArray = java_new_array(nil, columns, rows)
        self.columns = columns
        self.rows = rows
        for column = 0, columns - 1 do
            for row = 0, rows - 1 do
                self:createInstance(column, row)
            end
        end
end


function CellPositionFactory:getInstanceColRow(i_column, i_row)
        local try_ok, try_error = pcall(function()
            return self.cellPositionArray[i_column + 1][i_row + 1]
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(tostring(StringMaker.new():append("columns: "):appendint(self:getColumns()):append(" rows: "):appendint(self:getRows()):append(" col: "):appendint(i_column):append(" row: "):appendint(i_row)), self, commonStrings.GET_INSTANCE, e)
            return self.NONE
        end
end


function CellPositionFactory:createInstance(i_column, i_row)
        local cellPositionCanBeNull = self.cellPositionArray[i_column + 1][i_row + 1]
        if cellPositionCanBeNull == nil then
            cellPositionCanBeNull = CellPosition.new(i_column, i_row, self.columns, self.rows)
            self.cellPositionArray[i_column + 1][i_row + 1] = cellPositionCanBeNull
        end
        return cellPositionCanBeNull
end


function CellPositionFactory:getColumns()
        return self.columns
end


function CellPositionFactory:getRows()
        return self.rows
end

CellPositionFactory.SINGLETON = CellPositionFactory.new()

return CellPositionFactory


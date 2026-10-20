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

local V = require("org.allbinary.graph.V")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CellPosition = {}
CellPosition.__index = CellPosition
CellPosition.className = "CellPosition"
setmetatable(CellPosition, {__index = V})

function CellPosition:_init_fields()
    self.id = nil
    self.column = nil
    self.row = nil
end


function CellPosition.new(column, row, columns, rows)
    local self = setmetatable(V.new(), CellPosition)
    self:_init_fields()
        self.column = column
        self.row = row
        self.id = (row * columns) + column
    return self
end


function CellPosition:getColumn()
        return self.column
end


function CellPosition:getRow()
        return self.row
end


function CellPosition:toString()
        return CellPosition.toStringColRow(self:getColumn(), self:getRow())
end
CellPosition.__tostring = function(self) return self:toString() end


function CellPosition.toStringCellPosition(basicGeographicMapCellPosition)
        return CellPosition.toStringColRow(basicGeographicMapCellPosition:getColumn(), basicGeographicMapCellPosition:getRow())
end


function CellPosition.toStringColRow(i_column, i_row)
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append(commonSeps.PARENTHESIS_OPEN)
        stringBuffer:appendint(i_column)
        stringBuffer:append(commonSeps.COMMA)
        stringBuffer:appendint(i_row)
        stringBuffer:append(commonSeps.PARENTHESIS_CLOSE)
        return tostring(stringBuffer)
end


function CellPosition:getId()
        return self.id
end

return CellPosition


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
-- package org.allbinary.input.motion.button

local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonLocationHelper = {}
TouchButtonLocationHelper.__index = TouchButtonLocationHelper
TouchButtonLocationHelper.className = "TouchButtonLocationHelper"

function TouchButtonLocationHelper:_init_fields()
    self.totalColumns = nil
    self.totalRows = nil
    self.columnsRemainder = nil
    self.rowsRemainder = nil
    self.columnsRemainderHalf = nil
    self.rowsRemainderHalf = nil
end


function TouchButtonLocationHelper.new()
    local self = setmetatable({}, TouchButtonLocationHelper)
    self:_init_fields()
        local buttonSize = CommonButtons.getInstance().STANDARD_BUTTON_SIZE
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.totalColumns = math.floor((displayInfo:getLastWidth() + 0.0) / (buttonSize + 0.0) + 0.5)
        self.totalRows = math.floor((displayInfo:getLastHeight() + 0.0) / (buttonSize + 0.0) + 0.5)
        self.columnsRemainder = displayInfo:getLastWidth() % buttonSize
        self.columnsRemainderHalf = (((self.columnsRemainder) // (1 << (1))))
        self.rowsRemainder = displayInfo:getLastHeight() % buttonSize
        self.rowsRemainderHalf = (((self.rowsRemainder) // (1 << (1))))
    return self
end


function TouchButtonLocationHelper:getTotalColumns()
        return self.totalColumns
end


function TouchButtonLocationHelper:getTotalRows()
        return self.totalRows
end


function TouchButtonLocationHelper:getColumnsRemainder()
        return self.columnsRemainder
end


function TouchButtonLocationHelper:getRowsRemainder()
        return self.rowsRemainder
end


function TouchButtonLocationHelper:getColumnsRemainderHalf()
        return self.columnsRemainderHalf
end


function TouchButtonLocationHelper:getRowsRemainderHalf()
        return self.rowsRemainderHalf
end


function TouchButtonLocationHelper:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("totalColumns: ")
        stringBuffer:appendint(self.totalColumns)
        stringBuffer:append(" totalRows: ")
        stringBuffer:appendint(self.totalRows)
        stringBuffer:append(" columnsRemainder: ")
        stringBuffer:appendint(self.columnsRemainder)
        stringBuffer:append(" rowsRemainder: ")
        stringBuffer:appendint(self.rowsRemainder)
        stringBuffer:append(" columnsRemainderHalf: ")
        stringBuffer:appendint(self.columnsRemainderHalf)
        stringBuffer:append(" rowsRemainderHalf: ")
        stringBuffer:appendint(self.rowsRemainderHalf)
        return tostring(stringBuffer)
end
TouchButtonLocationHelper.__tostring = function(self) return self:toString() end

return TouchButtonLocationHelper


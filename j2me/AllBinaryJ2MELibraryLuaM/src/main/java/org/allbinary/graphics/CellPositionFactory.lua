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

local CellPositionFactory = {}
package.loaded["org.allbinary.graphics.CellPositionFactory"] = CellPositionFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CellPositionFactory is declared before the requires
CellPositionFactory.__index = CellPositionFactory
CellPositionFactory.className = "CellPositionFactory"
CellPositionFactory.javaClassName = "org.allbinary.graphics.CellPositionFactory"

function CellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NONE = CellPosition.new(-1, -1, -1, -1)
    self.cellPositionArray = java_new_array(nil, 0, 0)
    if self.columns == nil then self.columns = 0 end
    if self.rows == nil then self.rows = 0 end
end


function CellPositionFactory.getInstance()
        return CellPositionFactory.SINGLETON
end


function CellPositionFactory._jinit(self)
    CellPositionFactory._init_fields(self)
    return self
end

function CellPositionFactory.new(...)
    local self = setmetatable({}, CellPositionFactory)
    CellPositionFactory._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.cellPositionArray[i_column + 1][i_row + 1] end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(tostring(StringMaker.new():append("columns: "):appendint(self:getColumns()):append(" rows: "):appendint(self:getRows()):append(" col: "):appendint(i_column):append(" row: "):appendint(i_row)), self, commonStrings.GET_INSTANCE, e)
            return self.NONE
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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


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

local BasicGeographicMapCellPositionFactory = {}
package.loaded["org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory"] = BasicGeographicMapCellPositionFactory

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
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionFactoryInitVisitorInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface")
local GeographicMapCellPositionFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")

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

-- class table BasicGeographicMapCellPositionFactory is declared before the requires
BasicGeographicMapCellPositionFactory.__index = BasicGeographicMapCellPositionFactory
BasicGeographicMapCellPositionFactory.className = "BasicGeographicMapCellPositionFactory"
BasicGeographicMapCellPositionFactory.javaClassName = "org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory"

function BasicGeographicMapCellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.geographicMapCellPositionArray == nil then self.geographicMapCellPositionArray = nil end
    if self.geographicMapInterface == nil then self.geographicMapInterface = nil end
    if self.geographicMapCellPositionFactoryInterface == nil then self.geographicMapCellPositionFactoryInterface = nil end
    if self.columns == nil then self.columns = nil end
    if self.rows == nil then self.rows = nil end
    if self.tiledLayer == nil then self.tiledLayer = nil end
end


function BasicGeographicMapCellPositionFactory._jinit(self, geographicMapInterface)
    BasicGeographicMapCellPositionFactory._init_fields(self)
        self.geographicMapInterface = geographicMapInterface
        self.geographicMapCellPositionFactoryInterface = self.geographicMapInterface:getGeographicMapCellPositionFactoryInterface()
        self.tiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        self.columns = self.tiledLayer:getColumns()
        self.rows = self.tiledLayer:getRows()
        self.geographicMapCellPositionArray = java_new_array(nil, self.rows, self.columns)
        self:init()
    return self
end

function BasicGeographicMapCellPositionFactory.new(...)
    local self = setmetatable({}, BasicGeographicMapCellPositionFactory)
    BasicGeographicMapCellPositionFactory._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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


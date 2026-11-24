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

local SimpleGeographicMap = {}
package.loaded["org.allbinary.media.graphics.geography.map.SimpleGeographicMap"] = SimpleGeographicMap

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

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")

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

-- class table SimpleGeographicMap is declared before the requires
SimpleGeographicMap.__index = SimpleGeographicMap
SimpleGeographicMap.className = "SimpleGeographicMap"
SimpleGeographicMap.javaClassName = "org.allbinary.media.graphics.geography.map.SimpleGeographicMap"

function SimpleGeographicMap:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    if self.id == nil then self.id = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.cellTypeIdToGeographicMapCellType == nil then self.cellTypeIdToGeographicMapCellType = nil end
    if self.tiledLayer == nil then self.tiledLayer = nil end
    self.foregroundBasicColor = BasicColorFactory.getInstance().NULL_COLOR
    self.backgroundBasicColor = BasicColorFactory.getInstance().NULL_COLOR
    self.geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
end


function SimpleGeographicMap._jinit(self, id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor)
    SimpleGeographicMap._init_fields(self)
        self.id = id
        self.name_f = name
        self.cellTypeIdToGeographicMapCellType = cellTypeIdToGeographicMapCellType
        self.tiledLayer = tiledLayer
        self:setBackgroundBasicColor(backgroundBasicColor)
        self:setForegroundBasicColor(foregroundBasicColor)
    return self
end

function SimpleGeographicMap.new(...)
    local self = setmetatable({}, SimpleGeographicMap)
    SimpleGeographicMap._jinit(self, ...)
    return self
end


function SimpleGeographicMap:getId()
        return self.id
end


function SimpleGeographicMap:getName()
        return self.name_f
end


function SimpleGeographicMap:reset()
end


function SimpleGeographicMap:getAllBinaryTiledLayer()
        return self.tiledLayer
end


-- throws Exception
function SimpleGeographicMap:getCellTypeAt(cellPosition)
        local i_column = cellPosition:getColumn()
        local i_row = cellPosition:getRow()
        local cellTypeId = self.tiledLayer:getCell(i_column, i_row)
        if cellTypeId < 0 then
            cellTypeId = self.tiledLayer:getAnimatedTile(cellTypeId)
        end
        return self.geographicMapCellTypeFactory:get(self.cellTypeIdToGeographicMapCellType[cellTypeId + 1])
end


function SimpleGeographicMap:getCellTypeFromMapCellTypeInt(cellTypeId)
        return self.cellTypeIdToGeographicMapCellType[cellTypeId + 1]
end


function SimpleGeographicMap:getForegroundBasicColor()
        return self.foregroundBasicColor
end


function SimpleGeographicMap:setForegroundBasicColor(foregroundBasicColor)
        self.foregroundBasicColor = foregroundBasicColor
end


function SimpleGeographicMap:getBackgroundBasicColor()
        return self.backgroundBasicColor
end


function SimpleGeographicMap:setBackgroundBasicColor(backgroundBasicColor)
        self.backgroundBasicColor = backgroundBasicColor
end

return SimpleGeographicMap


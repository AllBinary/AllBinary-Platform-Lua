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
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimpleGeographicMap = {}
SimpleGeographicMap.__index = SimpleGeographicMap
SimpleGeographicMap.className = "SimpleGeographicMap"

function SimpleGeographicMap:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.id = nil
    self.name = nil
    self.cellTypeIdToGeographicMapCellType = nil
    self.tiledLayer = nil
    self.foregroundBasicColor = BasicColorFactory.getInstance().NULL_COLOR
    self.backgroundBasicColor = BasicColorFactory.getInstance().NULL_COLOR
    self.geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
end


function SimpleGeographicMap.new(id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor)
    local self = setmetatable({}, SimpleGeographicMap)
    self:_init_fields()
        self.id = id
        self.name = name
        self.cellTypeIdToGeographicMapCellType = cellTypeIdToGeographicMapCellType
        self.tiledLayer = tiledLayer
        self:setBackgroundBasicColor(backgroundBasicColor)
        self:setForegroundBasicColor(foregroundBasicColor)
    return self
end


function SimpleGeographicMap:getId()
        return self.id
end


function SimpleGeographicMap:getName()
        return self.name
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


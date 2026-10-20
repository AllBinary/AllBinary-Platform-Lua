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

local AllBinaryGameCanvasInterface = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPositionTracking = {}
GeographicMapCellPositionTracking.__index = GeographicMapCellPositionTracking
GeographicMapCellPositionTracking.className = "GeographicMapCellPositionTracking"

function GeographicMapCellPositionTracking:_init_fields()
    self.currentGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.newGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.currentCellType = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE
end


function GeographicMapCellPositionTracking.new()
    local self = setmetatable({}, GeographicMapCellPositionTracking)
    self:_init_fields()
    return self
end


-- throws Exception
function GeographicMapCellPositionTracking:getCurrentOverCellType(geographicMap)
        local geographicMapCellPosition = self.currentGeographicMapCellPosition
        if geographicMapCellPosition ~= self.previousGeographicMapCellPosition then
            self.currentCellType = geographicMap:getCellTypeAt(geographicMapCellPosition)
        end
        return self.currentCellType
end


-- throws Exception
function GeographicMapCellPositionTracking:updateStart(gameCanvasInterface, layer)
        if gameCanvasInterface ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            local geographicMapCompositeInterface = gameCanvasInterface:getLayerManager()
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            self.newGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(layer:getXP() + layer:getHalfWidth(), layer:getYP() + layer:getHalfHeight())
            if self.newGeographicMapCellPosition ~= self.currentGeographicMapCellPosition then
                self.currentGeographicMapCellPosition = self.newGeographicMapCellPosition
                return true
            end
        end
        return false
end


function GeographicMapCellPositionTracking:updateEnd()
        if self.currentGeographicMapCellPosition ~= self.previousGeographicMapCellPosition then
            self.previousGeographicMapCellPosition = self.currentGeographicMapCellPosition
            return true
        end
        return false
end


function GeographicMapCellPositionTracking:getPreviousGeographicMapCellPosition()
        return self.previousGeographicMapCellPosition
end


function GeographicMapCellPositionTracking:getCurrentGeographicMapCellPosition()
        return self.currentGeographicMapCellPosition
end

return GeographicMapCellPositionTracking


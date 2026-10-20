-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local Layer = require("org.allbinary.layer.Layer")
local NamedInterface = require("org.allbinary.layer.NamedInterface")
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

local AllBinaryTiledLayer = {}
AllBinaryTiledLayer.__index = AllBinaryTiledLayer
AllBinaryTiledLayer.className = "AllBinaryTiledLayer"
setmetatable(AllBinaryTiledLayer, {__index = Layer})

function AllBinaryTiledLayer:_init_fields()
    self.cellWidth = nil
    self.cellHeight = nil
    self.halfWidth = nil
    self.halfHeight = nil
    self.halfCellWidth = nil
    self.halfCellHeight = nil
    self.dataId = nil
end


function AllBinaryTiledLayer.new(dataId, width, height, cellWidth, cellHeight)
    local self = setmetatable(Layer.new(0, 0), AllBinaryTiledLayer)
    self:_init_fields()
        -- super(...) made self above
        self.dataId = dataId
        self:setLayerWidth(width)
        self:setLayerHeight(height)
        Layer.setPosition(self, 0, 0, 0)
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
        self.halfWidth = (((self:getWidth()) // (1 << (1))))
        self.halfHeight = (((self:getHeight()) // (1 << (1))))
        self.halfCellWidth = (((cellWidth) // (1 << (1))))
        self.halfCellHeight = (((cellHeight) // (1 << (1))))
    return self
end


function AllBinaryTiledLayer:setCells(mapTwoDArray)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Start: r: ")
        stringBuffer:appendint((mapTwoDArray.n or #mapTwoDArray))
        stringBuffer:append(" c: ")
        stringBuffer:appendint((mapTwoDArray[1].n or #mapTwoDArray[1]))
        stringBuffer:append(" rows: ")
        stringBuffer:appendint(self:getRows())
        stringBuffer:append(" columns: ")
        stringBuffer:appendint(self:getColumns())
        self.logUtil:putF(tostring(stringBuffer), self, "setCells")
        local rows = self:getRows()
        local columns = self:getColumns()
        for col = 0, columns - 1 do
            for row = 0, rows - 1 do
                self:setCell(col, row, mapTwoDArray[row + 1][col + 1])
            end
        end
end


function AllBinaryTiledLayer:updateCells(mapTwoDArray, fromTileId, toTileId)
        local rows = self:getRows()
        local columns = self:getColumns()
        for col = 0, columns - 1 do
            for row = 0, rows - 1 do
                if fromTileId == mapTwoDArray[row + 1][col + 1] then
                    mapTwoDArray[row + 1][col + 1] = toTileId
                    self:setCell(col, row, mapTwoDArray[row + 1][col + 1])
                end
            end
        end
end


function AllBinaryTiledLayer:getName()
        return getmetatable(self).className
end


function AllBinaryTiledLayer:paint(graphics)
end


function AllBinaryTiledLayer:paintThreed(graphics)
end


function AllBinaryTiledLayer:getX2()
        return self.x + self:getWidth()
end


function AllBinaryTiledLayer:getY2()
        return self.y + self:getHeight()
end


function AllBinaryTiledLayer:getZ2()
        return java_int((self.z + self:getDepth()))
end


function AllBinaryTiledLayer:getCellWidth()
        return self.cellWidth
end


function AllBinaryTiledLayer:getCellHeight()
        return self.cellHeight
end


function AllBinaryTiledLayer:getCell(col, row)
        return -1
end


function AllBinaryTiledLayer:getColumns()
        return -1
end


function AllBinaryTiledLayer:getRows()
        return -1
end


function AllBinaryTiledLayer:setCell(col, row, tileIndex)
end


function AllBinaryTiledLayer:getHalfWidth()
        return self.halfWidth
end


function AllBinaryTiledLayer:getHalfHeight()
        return self.halfHeight
end


function AllBinaryTiledLayer:getDataId()
        return self.dataId
end


function AllBinaryTiledLayer:getHalfCellWidth()
        return self.halfCellWidth
end


function AllBinaryTiledLayer:getHalfCellHeight()
        return self.halfCellHeight
end


function AllBinaryTiledLayer:isOnTileLayer(column, row)
        if self:getColumns() > column and self:getRows() > row and row >= 0 and column >= 0 then
            return true
        else
            return false
        end
end


function AllBinaryTiledLayer:getAnimatedTile(animationTileIndex)
        return animationTileIndex
end

return AllBinaryTiledLayer


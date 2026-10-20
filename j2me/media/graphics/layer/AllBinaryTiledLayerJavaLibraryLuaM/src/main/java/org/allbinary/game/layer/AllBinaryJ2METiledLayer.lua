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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local TiledLayer = require("javax.microedition.lcdui.game.TiledLayer")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryJ2METiledLayer = {}
AllBinaryJ2METiledLayer.__index = AllBinaryJ2METiledLayer
AllBinaryJ2METiledLayer.className = "AllBinaryJ2METiledLayer"
setmetatable(AllBinaryJ2METiledLayer, {__index = AllBinaryTiledLayer})

function AllBinaryJ2METiledLayer:_init_fields()
    self.tiledLayerP = nil
    self.debugColor = nil
    self.font2 = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, 4)
end


function AllBinaryJ2METiledLayer.new(dataId, tiledLayer, mapTwoDArray, debugColor)
    local self = setmetatable(AllBinaryTiledLayer.new(dataId, tiledLayer:getWidth(), tiledLayer:getHeight(), tiledLayer:getCellWidth(), tiledLayer:getCellHeight()), AllBinaryJ2METiledLayer)
    self:_init_fields()
        -- super(...) made self above
        self.tiledLayerP = tiledLayer
        self.debugColor = debugColor
        self:setCells(mapTwoDArray)
    return self
end


function AllBinaryJ2METiledLayer:paint(graphics)
        self.tiledLayerP:paint(graphics)
end


function AllBinaryJ2METiledLayer:paintDebug(graphics)
        local font = graphics:getFont()
        graphics:setFont(self.font2)
        graphics:setColor(self.debugColor)
        local x = self.tiledLayerP:getX()
        local y = self.tiledLayerP:getY()
        local firstColumn = 0
        local firstRow = 0
        local totalColumns = self.tiledLayerP:getColumns()
        local totalRows = self.tiledLayerP:getRows()
        local x0 = x
        local tile = 0
        local tileHeight = self.tiledLayerP:getCellHeight()
        local tileWidth = self.tiledLayerP:getCellWidth()
        local commonSeps = CommonSeps.getInstance()
        local stringMaker = StringMaker.new()
        do
            local rowIndex = firstRow
            while rowIndex < totalRows do
            x = x0
            do
                local columnIndex = firstColumn
                while columnIndex < totalColumns do
                tile = self.tiledLayerP:getCell(columnIndex, rowIndex)
                if tile < 0 then
                    tile = self.tiledLayerP:getAnimatedTile(tile)
                end
                if tile == 0 then
                    goto continue_N66931
                end
                tile = tile - 1
                stringMaker:delete(0, stringMaker:length())
                graphics:drawString(tostring(stringMaker:appendint(columnIndex):append(commonSeps.COMMA):appendint(rowIndex):append(commonSeps.COLON):appendint(tile)), x + 5, y + 10, 0)
                ::continue_N66931::
                columnIndex = columnIndex + 1
                x = x + (tileWidth)
                end
            end
            rowIndex = rowIndex + 1
            y = y + (tileHeight)
            end
        end
        graphics:setFont(font)
end


function AllBinaryJ2METiledLayer:moveDXY(dx, dy)
        self.tiledLayerP:move(dx, dy)
        AllBinaryTiledLayer.moveDXY(self, -dx, -dy)
end


function AllBinaryJ2METiledLayer:setPosition(x, y, z)
        self.tiledLayerP:setPosition(x, y)
        AllBinaryTiledLayer.setPosition(self, -x, -y, z)
end


function AllBinaryJ2METiledLayer:getTiledLayer()
        return self.tiledLayerP
end


function AllBinaryJ2METiledLayer:getCellWidth()
        return self.tiledLayerP:getCellWidth()
end


function AllBinaryJ2METiledLayer:getCellHeight()
        return self.tiledLayerP:getCellHeight()
end


function AllBinaryJ2METiledLayer:getCell(col, row)
        return self.tiledLayerP:getCell(col, row)
end


function AllBinaryJ2METiledLayer:getColumns()
        return self.tiledLayerP:getColumns()
end


function AllBinaryJ2METiledLayer:getRows()
        return self.tiledLayerP:getRows()
end


function AllBinaryJ2METiledLayer:setCell(col, row, index)
        self.tiledLayerP:setCell(col, row, index)
end


function AllBinaryJ2METiledLayer:getAnimatedTile(animationTileIndex)
        return self.tiledLayerP:getAnimatedTile(animationTileIndex)
end

return AllBinaryJ2METiledLayer


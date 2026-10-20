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
-- package org.allbinary.media.graphics.geography.map.drop

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local NullUtil = require("org.allbinary.logic.NullUtil")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BaseDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnyRandomDropCellPositionGenerator = {}
AnyRandomDropCellPositionGenerator.__index = AnyRandomDropCellPositionGenerator
AnyRandomDropCellPositionGenerator.className = "AnyRandomDropCellPositionGenerator"
setmetatable(AnyRandomDropCellPositionGenerator, {__index = BaseDropCellPositionGenerator})

function AnyRandomDropCellPositionGenerator:_init_fields()
    self.list = BasicArrayListD.new()
    self.geographicMapInterface = NullUtil.getInstance().NULL_OBJECT
end

function AnyRandomDropCellPositionGenerator.new()
    local self = setmetatable(BaseDropCellPositionGenerator.new(), AnyRandomDropCellPositionGenerator)
    self:_init_fields()
    return self
end


-- throws Exception
function AnyRandomDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        self.geographicMapInterface = geographicMapInterface
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local randomFactory = MyRandomFactory.getInstance()
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local total = tiledLayer:getColumns() * tiledLayer:getRows()
        local randomColumn = 0
        local randomRow = 0
        local geographicMapCellPosition = nil
        do
            local index = total
            while (function() index = index - 1 return index end)() >= 0 do
            randomColumn = randomFactory:getAbsoluteNextInt(tiledLayer:getColumns())
            randomRow = randomFactory:getAbsoluteNextInt(tiledLayer:getRows())
            geographicMapCellPosition = basicGeographicMapCellPositionFactory:getAt(randomColumn, randomRow)
            if self:isDropAllowedAt(geographicMapCellPosition) then
                self.list:add(geographicMapCellPosition)
            end
            end
        end
end


-- throws Exception
function AnyRandomDropCellPositionGenerator:processTick(allBinaryLayerManager)
end

return AnyRandomDropCellPositionGenerator


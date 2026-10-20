-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.behavior.topview

local MultiGeographicMapBehavior = require("org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local BasicTerrainInfo = require("org.allbinary.game.terrain.BasicTerrainInfo")
local TerrainEvent = require("org.allbinary.game.terrain.TerrainEvent")
local TerrainEventCircularStaticPool = require("org.allbinary.game.terrain.TerrainEventCircularStaticPool")
local TerrainEventHandler = require("org.allbinary.game.terrain.TerrainEventHandler")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local TopViewCharacterBehavior = require("org.allbinary.game.behavior.topview.TopViewCharacterBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NonPlayerTopViewCharacterBehavior = {}
NonPlayerTopViewCharacterBehavior.__index = NonPlayerTopViewCharacterBehavior
NonPlayerTopViewCharacterBehavior.className = "NonPlayerTopViewCharacterBehavior"
setmetatable(NonPlayerTopViewCharacterBehavior, {__index = TopViewCharacterBehavior})

function NonPlayerTopViewCharacterBehavior:_init_fields()
    self.geographicMapBehavior = MultiGeographicMapBehavior.new()
    self.CLIFF = BasicTerrainInfo.new(AngleFactory.getInstance().DOWN)
end

function NonPlayerTopViewCharacterBehavior.new()
    local self = setmetatable(TopViewCharacterBehavior.new(), NonPlayerTopViewCharacterBehavior)
    self:_init_fields()
    return self
end


-- throws Exception
function NonPlayerTopViewCharacterBehavior:terrainEvent(layer, direction, x, y, geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
        local maxColumns = geographicMapInterfaceArray[1]:getAllBinaryTiledLayer():getColumns()
        if geographicMapCellPosition:getColumn() > 0 and geographicMapCellPosition:getColumn() < maxColumns then
            local nextTerrainGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            local geographicMapCellPositionFactory = geographicMapInterfaceArray[1]:getGeographicMapCellPositionFactory()
            if direction == DirectionFactory.getInstance().LEFT then
                nextTerrainGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(geographicMapCellPosition:getColumn() - 1, geographicMapCellPosition:getRow())
            elseif direction == DirectionFactory.getInstance().RIGHT then
                nextTerrainGeographicMapCellPosition = geographicMapCellPositionFactory:getAt(geographicMapCellPosition:getColumn() + 1, geographicMapCellPosition:getRow())
            end
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, nextTerrainGeographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if not hasSolidBlock then
                local terrainEvent = TerrainEventCircularStaticPool.getInstance():getNext(self.CLIFF)
                TerrainEventHandler.getInstance(layer):fireEvent(terrainEvent)
            end
        end
end


function NonPlayerTopViewCharacterBehavior:terrainMove(layer, geographicMapInterfaceArray, x, y)
        layer:moveDXY(x, y)
end

return NonPlayerTopViewCharacterBehavior


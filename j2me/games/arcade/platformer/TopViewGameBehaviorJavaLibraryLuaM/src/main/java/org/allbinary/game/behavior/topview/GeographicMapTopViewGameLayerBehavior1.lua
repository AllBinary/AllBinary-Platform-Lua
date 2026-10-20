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
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local GravityUtil = require("org.allbinary.game.physics.acceleration.GravityUtil")
local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local GeographicMapTopViewLayerBehavior = require("org.allbinary.game.behavior.topview.GeographicMapTopViewLayerBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapTopViewGameLayerBehavior1 = {}
GeographicMapTopViewGameLayerBehavior1.__index = GeographicMapTopViewGameLayerBehavior1
GeographicMapTopViewGameLayerBehavior1.className = "GeographicMapTopViewGameLayerBehavior1"
setmetatable(GeographicMapTopViewGameLayerBehavior1, {__index = GeographicMapTopViewLayerBehavior})

function GeographicMapTopViewGameLayerBehavior1:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gravityUtil = GravityUtil.getInstance()
    self.geographicMapBehavior = MultiGeographicMapBehavior.new()
    self.autoStepBlocks = nil
    self.offsetY = nil
    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


function GeographicMapTopViewGameLayerBehavior1.new(maxGravityActionIndex, autoStepBlocks, offsetY)
    local self = setmetatable(GeographicMapTopViewLayerBehavior.new(maxGravityActionIndex), GeographicMapTopViewGameLayerBehavior1)
    self:_init_fields()
        -- super(...) made self above
        self.autoStepBlocks = autoStepBlocks
        self.offsetY = offsetY
    return self
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:gravity(velocityProperties, geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if not hasSolidBlock then
                self.gravityUtil:process(velocityProperties, self.gravityUtil.GAME_GRAVITY_VELOCITY)
                velocityProperties:limitXYToForwardAndReverseMaxVelocity()
                self:gravity()
            else
            end
        end
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:getPosition(geographicMapInterfaceArray, layer, x, y)
        local xCellPosition = layer:getXP() + -x + layer:getWidth()
        local yCellPosition = layer:getYP() + -y + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:getLeftPosition(geographicMapInterfaceArray, layer)
        local xCellPosition = layer:getXP()
        local yCellPosition = layer:getYP() + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:getRightPosition(geographicMapInterfaceArray, layer)
        local xCellPosition = layer:getXP() + layer:getWidth()
        local yCellPosition = layer:getYP() + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        local geographicMapCellPosition = self:getPosition(geographicMapInterfaceArray, layer, x, y)
        if self.previousGeographicMapCellPosition ~= geographicMapCellPosition and geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            local possibleStepGeographicMapCellPosition = geographicMapCellPosition
            local tiledLayer = geographicMapInterfaceArray[1]:getAllBinaryTiledLayer()
            if possibleStepGeographicMapCellPosition:getColumn() > 0 and possibleStepGeographicMapCellPosition:getRow() > 0 and possibleStepGeographicMapCellPosition:getColumn() < tiledLayer:getColumns() and possibleStepGeographicMapCellPosition:getRow() < tiledLayer:getRows() then
                self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)
                local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
                if hasSolidBlock then
                    velocityProperties:getVelocityXBasicDecimalP():setint(0)
                    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                else
                    self.previousGeographicMapCellPosition = possibleStepGeographicMapCellPosition
                    return possibleStepGeographicMapCellPosition
                end
            end
        end
        self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            local topViewCharacterInterface = (layer)
            topViewCharacterInterface:terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y)
        else
        end
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:move(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        local geographicMapCellPosition = self:getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        self:moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)
        if geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            return false
        else
            return true
        end
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:left(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer)
        local geographicMapCellPosition = self:getLeftPosition(geographicMapInterfaceArray, layer)
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            local possibleStepGeographicMapCellPosition = geographicMapInterfaceArray[1]:getGeographicMapCellPositionFactory():getAt(geographicMapCellPosition:getColumn(), geographicMapCellPosition:getRow() - 1)
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if hasSolidBlock then
                if self.autoStepBlocks then
                    local topViewCharacterInterface = (layer)
                    topViewCharacterInterface:leftp()
                else
                    velocityProperties:getVelocityXBasicDecimalP():setint(0)
                end
            else
                local topViewCharacterInterface = (layer)
                topViewCharacterInterface:leftp()
            end
        end
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior1:right(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer)
        local geographicMapCellPosition = self:getRightPosition(geographicMapInterfaceArray, layer)
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
            local possibleStepGeographicMapCellPosition = geographicMapInterfaceArray[1]:getGeographicMapCellPositionFactory():getAt(geographicMapCellPosition:getColumn(), geographicMapCellPosition:getRow() - 1)
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if hasSolidBlock then
                if self.autoStepBlocks then
                    local topViewCharacterInterface = (layer)
                    topViewCharacterInterface:rightp()
                else
                    velocityProperties:getVelocityXBasicDecimalP():setint(0)
                end
            else
                local topViewCharacterInterface = (layer)
                topViewCharacterInterface:rightp()
            end
        end
end

return GeographicMapTopViewGameLayerBehavior1


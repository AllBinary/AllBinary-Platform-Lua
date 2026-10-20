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
-- package org.allbinary.media.graphics.geography.map.racetrack.drop

local GroupCommonFactory = require("org.allbinary.game.identification.GroupCommonFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local LayerCoveringCellPositionsUtil = require("org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil")
local GPoint = require("org.allbinary.graphics.GPoint")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local StdUtil = require("org.allbinary.logic.StdUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapDirectionUtil = require("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local DropCellPositionGeneratorInterface = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionGeneratorInterface")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local BaseRaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local RaceTrackGeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local RaceTrackDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackDropCellPositionGenerator")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackAdjacentDropCellPositionGenerator = {}
RaceTrackAdjacentDropCellPositionGenerator.__index = RaceTrackAdjacentDropCellPositionGenerator
RaceTrackAdjacentDropCellPositionGenerator.className = "RaceTrackAdjacentDropCellPositionGenerator"
setmetatable(RaceTrackAdjacentDropCellPositionGenerator, {__index = RaceTrackDropCellPositionGenerator})

function RaceTrackAdjacentDropCellPositionGenerator:_init_fields()
    self.layerCoveringCellPositionsUtil = LayerCoveringCellPositionsUtil.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.surroundingCellPositions = java_new_array(nil, 4)
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.geographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance()
end


function RaceTrackAdjacentDropCellPositionGenerator.getInstance()
        return RaceTrackAdjacentDropCellPositionGenerator.SINGLETON
end


function RaceTrackAdjacentDropCellPositionGenerator.new()
    local self = setmetatable(RaceTrackDropCellPositionGenerator.new(), RaceTrackAdjacentDropCellPositionGenerator)
    self:_init_fields()
    return self
end


-- throws Exception
function RaceTrackAdjacentDropCellPositionGenerator:getFirstNonRoadAdjacentCellPosition(column, row)
        local nonRoadGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        local geographicMapCellPositionFactory = self.raceTrackGeographicMap:getGeographicMapCellPositionFactory()
        self.surroundingCellPositions[1] = geographicMapCellPositionFactory:getAt(column, row - 1)
        self.surroundingCellPositions[2] = geographicMapCellPositionFactory:getAt(column, row + 1)
        self.surroundingCellPositions[3] = geographicMapCellPositionFactory:getAt(column - 1, row)
        self.surroundingCellPositions[4] = geographicMapCellPositionFactory:getAt(column + 1, row)
        local baseRaceTrackGeographicMap = self.raceTrackGeographicMap
        local raceTrackGeographicMapCellTypeFactory = baseRaceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local geographicMapCellPosition = nil
        local raceTrackGeographicMapCellType = nil
        do
            local index = (self.surroundingCellPositions.n or #self.surroundingCellPositions)
            while (function() index = index - 1 return index end)() >= 0 do
            geographicMapCellPosition = self.surroundingCellPositions[index + 1]
            raceTrackGeographicMapCellType = self.raceTrackGeographicMap:getCellTypeAt(geographicMapCellPosition)
            if not raceTrackGeographicMapCellTypeFactory:isPath(raceTrackGeographicMapCellType) then
                nonRoadGeographicMapCellPosition = geographicMapCellPosition
                break
            end
            end
        end
        return nonRoadGeographicMapCellPosition
end


-- throws Exception
function RaceTrackAdjacentDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        self.hashtable:put(AllBinaryGameLayerManager.ID, allBinaryGameLayerManager)
        RaceTrackDropCellPositionGenerator.update(self, allBinaryGameLayerManager, geographicMapInterface)
end


-- throws Exception
function RaceTrackAdjacentDropCellPositionGenerator:drop(allBinaryLayerManager, index)
        local geographicMapCellPosition = self.list:get(index)
        local randomGeographicMapCellPosition = self:getFirstNonRoadAdjacentCellPosition(geographicMapCellPosition:getColumn(), geographicMapCellPosition:getRow())
        if randomGeographicMapCellPosition == nil then
            return
        end
        local dropCellPositionHistory = DropCellPositionHistory.getInstance()
        if not dropCellPositionHistory:isCellPositionWithDrop(geographicMapCellPosition) then
            local direction = self.geographicMapDirectionUtil:getDirectionFromCellPositionToAdjacentCellPosition(randomGeographicMapCellPosition, geographicMapCellPosition)
            local objectCanBeNull = self.hashtable:get(self.groupCommonFactory.ID)
            if objectCanBeNull ~= nil then
            else
                self.hashtable:put(self.groupCommonFactory.ID, BasicGroupFactory.getInstance().NONE_ARRAY)
            end
            self.hashtable:put(DirectionFactory.getInstance().NAME, direction)
            local point = randomGeographicMapCellPosition:getPoint()
            local x = point:getX()
            local y = point:getY()
            local z = point:getZ()
            local layerInterface = RaceTrackAdjacentDropLayerFactory.getInstance():getRandomInstance():getNextInstance(self.hashtable, x, y, z)
            local baseRaceTrackGeographicMap = self.raceTrackGeographicMap
            local list = self.layerCoveringCellPositionsUtil:getAll(baseRaceTrackGeographicMap, randomGeographicMapCellPosition, layerInterface, BasicArrayListD.new())
            if dropCellPositionHistory:anyCellPositionWithDrop(list) then
                return
            end
            local geographicMapCellType = nil
            do
                local index2 = list:size()
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                geographicMapCellType = self.raceTrackGeographicMap:getCellTypeAt(list:get(index2))
                if self.raceTrackGeographicMapCellTypeFactory:isPath(geographicMapCellType) then
                    return
                end
                end
            end
            dropCellPositionHistory:addAll(list, layerInterface)
            allBinaryLayerManager:append(layerInterface)
        end
end

RaceTrackAdjacentDropCellPositionGenerator.SINGLETON = RaceTrackAdjacentDropCellPositionGenerator.new()

return RaceTrackAdjacentDropCellPositionGenerator


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
-- package org.allbinary.game.ai.path

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapDirectionUtil = require("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local GeographicMapCellPathHistoryInfo = require("org.allbinary.media.graphics.geography.pathfinding.GeographicMapCellPathHistoryInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicAIProcessor = {}
BasicAIProcessor.__index = BasicAIProcessor
BasicAIProcessor.className = "BasicAIProcessor"

function BasicAIProcessor:_init_fields()
    self.name = nil
    self.geographicMapCellHistory = nil
    self.geographicMapCellPositionBasicArrayList = nil
    self.geographicMapCellPathHistoryInfo = nil
    self.basicAI = nil
    self.geographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance()
end


function BasicAIProcessor.new(name, geographicMapCellHistory, geographicMapCellPathHistoryInfo, chosenPathList, angleInfo, seed)
    local self = setmetatable({}, BasicAIProcessor)
    self:_init_fields()
        self.name = name
        self.geographicMapCellHistory = geographicMapCellHistory
        self.geographicMapCellPositionBasicArrayList = chosenPathList
        self.geographicMapCellPathHistoryInfo = geographicMapCellPathHistoryInfo
        self:setName(name)
        self:setNewPath(geographicMapCellHistory, chosenPathList)
        self.basicAI = BasicDirectionAIHelper.new(self:getName(), angleInfo)
    return self
end


function BasicAIProcessor:setNewPath(geographicMapCellHistory, chosenPathList)
        self:setGeographicMapCellHistory(geographicMapCellHistory)
        self.geographicMapCellPositionBasicArrayList = chosenPathList
        self:init()
end


function BasicAIProcessor:init()
        self.geographicMapCellPathHistoryInfo = GeographicMapCellPathHistoryInfo.new()
        self.geographicMapCellPathHistoryInfo:setPreviousOnPathGeographicMapCellPosition(self.geographicMapCellPositionBasicArrayList:get(self.geographicMapCellPositionBasicArrayList:size() - 1))
        self.geographicMapCellPathHistoryInfo:setNextOnPathGeographicMapCellPosition(self.geographicMapCellPositionBasicArrayList:get(self.geographicMapCellPositionBasicArrayList:size() - 1))
        self:update()
end


-- throws Exception
function BasicAIProcessor:goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition)
        local keyDirection = -1
        local goToGeographicMapCellPosition = self.geographicMapCellPathHistoryInfo:getNextChosenOnPathGeographicMapCellPosition()
        local geographicMapDirectionData = self.geographicMapDirectionUtil:getDirectionFromCellPositionToAdjacentCellPosition(currentGeographicMapCellPosition, goToGeographicMapCellPosition)
        if geographicMapDirectionData == DirectionFactory.getInstance().NOT_BORDERED_WITH then
            geographicMapDirectionData = self.geographicMapDirectionUtil:getDirectionFromCellPositionToCellPosition(currentGeographicMapCellPosition, goToGeographicMapCellPosition)
        end
        keyDirection = self.basicAI:getAIKeyPressedFromDirection(geographicMapDirectionData)
        return keyDirection
end


function BasicAIProcessor:update()
        self.geographicMapCellPathHistoryInfo:setNextUnvisitedOnPathGeographicMapCellPosition(self:getGeographicMapCellHistory():getFirstUnvisited())
        self.geographicMapCellPathHistoryInfo:setNextChosenOnPathGeographicMapCellPosition(self.geographicMapCellPathHistoryInfo:getNextUnvisitedOnPathGeographicMapCellPosition())
end


-- throws Exception
function BasicAIProcessor:processAI(myManager, currentGeographicMapCellPosition)
        local keyDirection = -1
        if self.geographicMapCellPositionBasicArrayList:contains(currentGeographicMapCellPosition) then
            self:update()
            keyDirection = self:goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition)
            self.geographicMapCellPathHistoryInfo:setPreviousOnPathGeographicMapCellPosition(currentGeographicMapCellPosition)
        else
            keyDirection = self:goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition)
        end
        return keyDirection
end


function BasicAIProcessor:getName()
        return self.name
end


function BasicAIProcessor:setName(name)
        self.name = name
end


function BasicAIProcessor:getGeographicMapCellPathHistoryInfo()
        return self.geographicMapCellPathHistoryInfo
end


function BasicAIProcessor:setGeographicMapCellPathHistoryInfo(geographicMapCellPathHistoryInfo)
        self.geographicMapCellPathHistoryInfo = geographicMapCellPathHistoryInfo
end


function BasicAIProcessor:getGeographicMapCellHistory()
        return self.geographicMapCellHistory
end


function BasicAIProcessor:setGeographicMapCellHistory(geographicMapCellHistory)
        self.geographicMapCellHistory = geographicMapCellHistory
end

return BasicAIProcessor


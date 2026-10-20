-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.input.form

local AdvancedPlayerOwnedRTSLayers = require("org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers")
local AdvancedRTSPlayerLayerInterface = require("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local BuildingEventHandler = require("org.allbinary.game.layer.building.event.BuildingEventHandler")
local LocalPlayerBuildingEventHandler = require("org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler")
local WaypointCellPositionHistory = require("org.allbinary.game.layer.waypoint.WaypointCellPositionHistory")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local BuildingRTSFormInput = require("org.allbinary.game.input.form.BuildingRTSFormInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BuildingAdvancedRTSFormInput = {}
BuildingAdvancedRTSFormInput.__index = BuildingAdvancedRTSFormInput
BuildingAdvancedRTSFormInput.className = "BuildingAdvancedRTSFormInput"
setmetatable(BuildingAdvancedRTSFormInput, {__index = BuildingRTSFormInput})

function BuildingAdvancedRTSFormInput:_init_fields()
    self.atLeastOneHouseGameNotificationEvent = nil
    self.BUILD_BUILDING_RTS_LAYER_EVENT = RTSLayerEvent.new(NullPathFindingLayer.NULL_PATH_FINDING_LAYER)
end


function BuildingAdvancedRTSFormInput.new(groupInterface, isUnitProducer)
    local self = setmetatable(BuildingRTSFormInput.new(groupInterface, isUnitProducer), BuildingAdvancedRTSFormInput)
    self:_init_fields()
        -- super(...) made self above
        local basicColorFactory = BasicColorFactory.getInstance()
        self.atLeastOneHouseGameNotificationEvent = GameNotificationEvent.new(self, "Build At Least One House First", SmallIntegerSingletonFactory.getInstance():getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
    return self
end


-- throws Exception
function BuildingAdvancedRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        BuildingRTSFormInput.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.atLeastOneHouseGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


function BuildingAdvancedRTSFormInput:isPositionBlocked()
        if DropCellPositionHistory.getInstance():isCellPositionWithDrop(self:getSelectedGeographicCellPosition()) or WaypointCellPositionHistory.getInstance():isCellPositionWithDrop(self:getSelectedGeographicCellPosition()) then
            return true
        else
            return false
        end
end


-- throws Exception
function BuildingAdvancedRTSFormInput:isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface)
        local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
        local advancedPlayerOwnedRTSLayers = advancedRTSPlayerLayerInterface:getAdvancedPlayerOwnedRTSLayers()
        local totalHouses = advancedPlayerOwnedRTSLayers:getHouseList():size()
        if totalHouses < 1 and layerInterface:getName():indexOf(" House") < 0 then
            rtsPlayerLayerInterface:add(ErrorSound.getInstance())
            if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                GameNotificationEventHandler.getInstance():fireEvent(self.atLeastOneHouseGameNotificationEvent)
            end
            return false
        end
        return BuildingRTSFormInput.isBuildAttemptValid(self, rtsPlayerLayerInterface, layerInterface)
end


-- throws Exception
function BuildingAdvancedRTSFormInput:add(rtsPlayerLayerInterface, layerManager, layerInterface)
        self.BUILD_BUILDING_RTS_LAYER_EVENT:setRtsLayer(layerInterface)
        BuildingEventHandler.getInstance():fireEvent(self.BUILD_BUILDING_RTS_LAYER_EVENT)
        if (rtsPlayerLayerInterface):isLocalPlayer() then
            LocalPlayerBuildingEventHandler.getInstance():fireEvent(self.BUILD_BUILDING_RTS_LAYER_EVENT)
        end
        BuildingRTSFormInput.add(self, rtsPlayerLayerInterface, layerManager, layerInterface)
end

return BuildingAdvancedRTSFormInput


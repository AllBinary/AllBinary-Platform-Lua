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
-- package org.allbinary.game.layer.building

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local ExplosionBasicSound = require("org.allbinary.ag.weapon.media.audio.ExplosionBasicSound")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = require("org.allbinary.animation.NullIndexedAnimationFactory")
local GroupFactory = require("org.allbinary.game.identification.GroupFactory")
local NullRTSFormInputFactory = require("org.allbinary.game.input.form.NullRTSFormInputFactory")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local VisibleCellPositionsSingleton = require("org.allbinary.game.input.form.VisibleCellPositionsSingleton")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSPlayerLayerInterface = require("org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface")
local AdvancedRTSProperties = require("org.allbinary.game.layer.AdvancedRTSProperties")
local CollidableRTSBehavior = require("org.allbinary.game.layer.CollidableRTSBehavior")
local RTSLayerUtil = require("org.allbinary.game.layer.RTSLayerUtil")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local Waypoint = require("org.allbinary.game.layer.waypoint.Waypoint")
local TileLayerPositionIntoViewPosition = require("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local RotationAnimationInterfaceCompositeInterface = require("org.allbinary.animation.RotationAnimationInterfaceCompositeInterface")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local DamageFloaters = require("org.allbinary.game.combat.damage.DamageFloaters")
local Health = require("org.allbinary.game.health.Health")
local Group = require("org.allbinary.game.identification.Group")
local GeographicMapCellPositionAreaBase = require("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = require("org.allbinary.game.tracking.TrackingEventListenerInterface")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = require("org.allbinary.media.audio.SelectSound")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapDirectionUtil = require("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BuildingLayer = {}
BuildingLayer.__index = BuildingLayer
BuildingLayer.className = "BuildingLayer"
setmetatable(BuildingLayer, {__index = AdvancedRTSGameLayer})

function BuildingLayer:_init_fields()
    self.buildingLevelCost = 0
    self.productivity = 0
    self.efficiency = nil
    self.efficiencyPerLevel = nil
    self.trackingEvent = nil
    self.damageFloaters = nil
    self.damageFloatersPaintableInterface = nil
    self.healthBar = nil
    self.pathsHashtable = nil
    self.local_ = false
    self.timeDelayHelper = TimeDelayHelper.new(3000)
end


-- throws Exception
function BuildingLayer.createSimulated()
        local nullAnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance()
        local nullIndexedAnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance()
        return BuildingLayer.new(RemoteInfo.REMOTE_INFO, SimulatedBuildingPropertiesFactory.getInstance(), AdvancedRTSProperties.createPropertiesSimulated(), GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0)
end


function BuildingLayer.new(remoteInfo, buildingPropertiesFactory, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y)
    local self = setmetatable(AdvancedRTSGameLayer.new(remoteInfo, NullPathFindingLayer.NULL_PATH_FINDING_LAYER, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, TileLayerPositionIntoViewPosition.new()), BuildingLayer)
    self:_init_fields()
        -- super(...) made self above
        self:setCollidableInferface(CollidableRTSBehavior.new(true))
        self:getWaypointBehavior():setWaypoint(Waypoint.new(self, SelectSound.getInstance()))
        self.damageFloaters = buildingPropertiesFactory:getDamageFloaters(self)
        self.damageFloatersPaintableInterface = buildingPropertiesFactory.damageFloatersPaintableInterface
        self.healthBar = buildingPropertiesFactory:getHealthBar(self)
        self.pathsHashtable = buildingPropertiesFactory:getHashtable()
        self:setMaxLevel(30)
        self:setProductivity(1)
        self:setEfficiency(self:calculateEfficiency())
        self.efficiencyPerLevel = buildingPropertiesFactory:getEfficiencyPerLevel(self)
        self.efficiency = self.efficiencyPerLevel
        self:generateMoveOutOfBuildAreaPaths()
        self.trackingEvent = buildingPropertiesFactory:getTrackingEvent(self)
    return self
end


function BuildingLayer:initVisibility(rtsPlayerLayerInterface)
        local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
        if advancedRTSPlayerLayerInterface:isLocalPlayer() then
            self.local_ = true
            self:addVisibility()
        else
            self.local_ = false
        end
        AdvancedRTSGameLayer.initVisibility(self, rtsPlayerLayerInterface)
end


-- throws Exception
function BuildingLayer:construct(rtsPlayerLayerInterface)
        AdvancedRTSGameLayer.construct(self, rtsPlayerLayerInterface)
        TrackingEventHandler.getInstance():addListenerInterface(self)
end


function BuildingLayer:onMovement(trackingEvent)
        local try_ok, try_error = pcall(function()
            local layerInterface = trackingEvent:getLayerInterface()
            if layerInterface:getGroupInterface()[1] ~= self:getGroupInterface()[1] then
                layerInterface:onMovementFound(self.trackingEvent)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onMovement", e)
        end
end


-- throws Exception
function BuildingLayer:processBuiltTick(allBinaryLayerManager)
        if self:getHealthInterface():isDamaged() then
            self:setAnimationInterface(self.destroyAnimationInterface)
        end
        if not self:getHealthInterface():isAlive() then
            if self:isReadyForExplosion() then
                local currentFrame = self.destroyAnimationInterface:getFrame()
                local size = self.destroyAnimationInterface:getSize() - 1
                if currentFrame == size and not self.timeDelayHelper:isTimeTNT() then
                    if not self:getHealthInterface():isAlive() then
                        self:setDestroyed(true)
                    end
                else
                    self.destroyAnimationInterface:nextFrame()
                end
            else
                self:setAnimationInterface(self.destroyAnimationInterface)
                SecondaryPlayerQueueFactory.getInstance():add(ExplosionBasicSound.getInstance())
                self.shakeListener:onSmallShakeEvent()
                self.vibration:vibrate(self.duration, 0, 0)
                self.timeDelayHelper:setStartTimeTNT()
                self:setReadyForExplosion(true)
            end
        else
            AdvancedRTSGameLayer.processBuiltTick(self, allBinaryLayerManager)
        end
        self.indexedButShouldBeRotationAnimationInterface:nextFrame()
end


function BuildingLayer:calculateEfficiency()
        return self.efficiencyPerLevel
end


function BuildingLayer:getCost()
        local total = RTSLayerUtil.getInstance():getCostExponential(java_int((self:getLevel() * self:getBuildingLevelCost())))
        return total
end


function BuildingLayer:getDowngradeCost()
        local downgradeCost = RTSLayerUtil.getInstance():getCostExponential(java_int(((self:getLevel() - 1) * self:getBuildingLevelCost())))
        self.logUtil:putF("Cost: " .. tostring(downgradeCost), self, "getDowngradeCost")
        return java_idiv(downgradeCost * 9, 10)
end


function BuildingLayer:getUpgradeCost()
        local upgradeCost = RTSLayerUtil.getInstance():getCostExponential(java_int(((self:getLevel() + 1) * self:getBuildingLevelCost())))
        return upgradeCost
end


function BuildingLayer:downgrade()
        AdvancedRTSGameLayer.downgrade(self)
        self:setProductivity(self:getProductivity() - 1)
        self:setEfficiency(self:getEfficiency() - self:calculateEfficiency())
        self:getHealthInterface():setMaxHealth(self:getHealthInterface():getMaxHealth() - ((self:getLevel() + 1) * 100))
end


function BuildingLayer:upgrade()
        AdvancedRTSGameLayer.upgrade(self)
        self:setProductivity(self:getProductivity() + 1)
        self:setEfficiency(self:getEfficiency() + self:calculateEfficiency())
        self:getHealthInterface():setMaxHealth(self:getHealthInterface():getMaxHealth() + (self:getLevel() * 100))
end


function BuildingLayer:getBuildingLevelCost()
        return self.buildingLevelCost
end


function BuildingLayer:setBuildingLevelCost(buildingLevelCost)
        self.buildingLevelCost = buildingLevelCost
end


function BuildingLayer:getProductivity()
        return self.productivity
end


function BuildingLayer:setProductivity(productivity)
        self.productivity = productivity
end


function BuildingLayer:getEfficiency()
        return self.efficiency
end


function BuildingLayer:setEfficiency(efficiency)
        self.efficiency = efficiency
end


-- throws Exception
function BuildingLayer:generateMoveOutOfBuildAreaPaths()
        local occupyList = self.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        local surroundList = self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
        local NO_DIRECTION = DirectionFactory.getInstance().NO_DIRECTION
        local geographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance()
        local pathsList = nil
        local occupyGeographicMapCellPosition = nil
        local surroundGeographicMapCellPosition = nil
        local list = nil
        for index2 = occupyList:size() - 1, 0, -1 do
            pathsList = BasicArrayListD.new()
            occupyGeographicMapCellPosition = occupyList:get(index2)
            for index = surroundList:size() - 1, 0, -1 do
                surroundGeographicMapCellPosition = surroundList:get(index)
                if geographicMapDirectionUtil:getEightDirectionFromCellPositionToAdjacentCellPosition(surroundGeographicMapCellPosition, occupyGeographicMapCellPosition) ~= NO_DIRECTION then
                    list = BasicArrayListS.new(1)
                    list:add(surroundGeographicMapCellPosition)
                    pathsList:add(list)
                end
            end
            self.pathsHashtable:put(occupyGeographicMapCellPosition, pathsList)
        end
end


function BuildingLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
        local pathsList = self.pathsHashtable:get(geographicMapCellPosition)
        return pathsList
end


function BuildingLayer:getEndGeographicMapCellPositionList()
        return self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
end


function BuildingLayer:shouldHandleStartSameAsEnd()
        return false
end


function BuildingLayer:paint(graphics)
        if self:isVisible() then
            AdvancedRTSGameLayer.paint(self, graphics)
            self.damageFloatersPaintableInterface:paint(graphics)
            self.healthBar:paint(graphics)
        end
end


-- throws Exception
function BuildingLayer:damage(damage, damageType)
        AdvancedRTSGameLayer.damage(self, damage, damageType)
        self.damageFloaters:add(damage)
        if damage > 0 then
            self:getHealthInterface():damage(damage)
        end
end


-- throws Exception
function BuildingLayer:getDamage(damageType)
        return 0
end


function BuildingLayer:addVisibility()
        local geographicMapCellPositionArea = self.geographicMapCellPositionAreaBase
        local occupyList = geographicMapCellPositionArea:getOccupyingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():addStationaryCellPositions(occupyList)
        local surroundList = geographicMapCellPositionArea:getSurroundingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():addStationaryCellPositions(surroundList)
end


function BuildingLayer:removeVisibility()
        local occupyList = self.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():removeStationaryCellPositions(occupyList)
        local surroundList = self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
        VisibleCellPositionsSingleton.getInstance():removeStationaryCellPositions(surroundList)
end


-- throws Exception
function BuildingLayer:setDestroyed(destroyed)
        AdvancedRTSGameLayer.setDestroyed(self, destroyed)
        if self:isDestroyed() then
            DropCellPositionHistory.getInstance():removeAll(self)
            TrackingEventHandler.getInstance():removeListener(self)
            if self.local_ then
                self:removeVisibility()
            end
            if not self:getHealthInterface():isAlive() then
                local damage = self:getHealthInterface():getMaxHealth()
                if damage > 10 then
                    SecondaryPlayerQueueFactory.getInstance():add(ExplosionBasicSound.getInstance())
                    if damage < 100 then
                        self.shakeListener:onSmallShakeEvent()
                        self.vibration:vibrate(self.duration, 0, 0)
                    elseif damage < 1000 then
                        self.shakeListener:onMediumShakeEvent()
                        self.vibration:vibrate(self.duration * 2, 0, 0)
                    elseif damage < 3000 then
                        self.shakeListener:onLargeShakeEvent()
                        self.vibration:vibrate(self.duration * 4, 0, 0)
                    end
                end
            end
        end
end


function BuildingLayer:createHudPaintable()
        local buildingInfoHudPaintable = BuildingInfoHudPaintable.getInstance()
        buildingInfoHudPaintable:setBasicColorP(self.allBinaryGameLayerManagerP:getForegroundBasicColor())
        buildingInfoHudPaintable:setRtsLayer(self)
        return buildingInfoHudPaintable
end


function BuildingLayer:getHudPaintable()
        local buildingInfoHudPaintable = BuildingInfoHudPaintable.getInstance()
        return buildingInfoHudPaintable
end


function BuildingLayer:getType()
        return BuildingLayer.getStaticType()
end


function BuildingLayer.getStaticType()
        return 2
end

return BuildingLayer


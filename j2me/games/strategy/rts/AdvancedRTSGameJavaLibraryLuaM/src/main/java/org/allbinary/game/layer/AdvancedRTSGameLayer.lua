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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = require("org.allbinary.animation.NullIndexedAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local ShakeAnimationListener = require("org.allbinary.animation.transition.shake.ShakeAnimationListener")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local GameTypeFactory = require("org.allbinary.game.GameTypeFactory")
local DestroyedEvent = require("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local DestroyedEventHandler = require("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local DestroyedEventListenerInterface = require("org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface")
local Health = require("org.allbinary.game.health.Health")
local Group = require("org.allbinary.game.identification.Group")
local GroupFactory = require("org.allbinary.game.identification.GroupFactory")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local NullRTSFormInputFactory = require("org.allbinary.game.input.form.NullRTSFormInputFactory")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local BuildingEventHandler = require("org.allbinary.game.layer.building.event.BuildingEventHandler")
local UnitLayer = require("org.allbinary.game.layer.unit.UnitLayer")
local Waypoint2LogHelper = require("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local Waypoint2SelectedLogHelper = require("org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper")
local WaypointBase = require("org.allbinary.game.layer.waypoint.WaypointBase")
local WaypointLogHelper = require("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = require("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")
local WaypointRunnableSelectedLogHelper = require("org.allbinary.game.layer.waypoint.WaypointRunnableSelectedLogHelper")
local WaypointSelectedLogHelper = require("org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local NullTickable = require("org.allbinary.game.tick.NullTickable")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local TileLayerPositionIntoViewPosition = require("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local FrameUtil = require("org.allbinary.math.FrameUtil")
local AllBinaryVibrationME = require("org.allbinary.media.AllBinaryVibrationME")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local GeographicMapDirectionUtil = require("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvancedRTSGameLayer = {}
AdvancedRTSGameLayer.__index = AdvancedRTSGameLayer
AdvancedRTSGameLayer.className = "AdvancedRTSGameLayer"
setmetatable(AdvancedRTSGameLayer, {__index = RTSLayer})

function AdvancedRTSGameLayer:_init_fields()
    self.shakeListener = nil
    self.vibration = nil
    self.duration = nil
    self.parentLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.waypointBehaviorBase = NullTickable.getInstance()
end


-- throws Exception
function AdvancedRTSGameLayer.createSimulated()
        local nullAnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance()
        local nullIndexedAnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance()
        return AdvancedRTSGameLayer.new(RemoteInfo.REMOTE_INFO, NullPathFindingLayer.NULL_PATH_FINDING_LAYER, AdvancedRTSProperties.createPropertiesSimulated(), GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0, TileLayerPositionIntoViewPosition.new())
end


function AdvancedRTSGameLayer.new(remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition)
    local self = setmetatable(RTSLayer.new(remoteInfo, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition), AdvancedRTSGameLayer)
    self:_init_fields()
        -- super(...) made self above
        self:setVisible(false)
        self:setWaypointBehavior(WaypointBehaviorBase.new())
        self.shakeListener = advancedRTSProperties.shakeListener
        self.vibration = advancedRTSProperties.vibration
        self.duration = advancedRTSProperties.duration
        self:setParentLayer(parentLayer)
    return self
end


-- throws Exception
function AdvancedRTSGameLayer:updateWaypointBehavior(geographicMapInterface)
        RTSLayer.updateWaypointBehavior(self, geographicMapInterface)
        self:getWaypointBehavior():getWaypoint():setAllBinaryGameLayerManager(self.allBinaryGameLayerManagerP)
end


function AdvancedRTSGameLayer:initVisibility(rtsPlayerLayerInterface)
        local advancedRTSPlayerLayerInterface = rtsPlayerLayerInterface
        if advancedRTSPlayerLayerInterface:isLocalPlayer() or advancedRTSPlayerLayerInterface:getGameType() == GameTypeFactory.getInstance().BOT then
            self:setVisible(true)
        else
            self:setVisible(false)
        end
end


-- throws Exception
function AdvancedRTSGameLayer:construct(rtsPlayerLayerInterface)
        RTSLayer.construct(self, rtsPlayerLayerInterface)
        self:initVisibility(rtsPlayerLayerInterface)
        BuildingEventHandler.getInstance():addListenerInterface(self:getWaypointBehavior():getWaypoint())
end


-- throws Exception
function AdvancedRTSGameLayer:setDestroyed(destroyed)
        RTSLayer.setDestroyed(self, destroyed)
        if self:isDestroyed() then
            BuildingEventHandler.getInstance():removeListener(self:getWaypointBehavior():getWaypoint())
            BuildingEventHandler.getInstance():removeListener(self)
            DestroyedEventHandler.getInstance():addListener(self)
            RTSLayerUtil.getInstance():destroyAndClear(self:getWaypointBehavior():getOwnedWaypointList())
        end
end


function AdvancedRTSGameLayer:getParentLayer()
        return self.parentLayer
end


function AdvancedRTSGameLayer:setParentLayer(parentLayer)
        self.parentLayer = parentLayer
end


function AdvancedRTSGameLayer:getWaypointBehavior()
        return self.waypointBehaviorBase
end


function AdvancedRTSGameLayer:setWaypointBehavior(unitWaypointHelper)
        self.waypointBehaviorBase = unitWaypointHelper
end


function AdvancedRTSGameLayer:getWaypointLogHelper()
        return self.waypointLogHelperP
end


function AdvancedRTSGameLayer:getWaypoint2LogHelper()
        return self.waypoint2LogHelperP
end


function AdvancedRTSGameLayer:getWaypointRunnableLogHelper()
        return self.waypointRunnableLogHelperP
end


function AdvancedRTSGameLayer:shouldAddWaypointFromBuilding()
        if self.parentLayer ~= NullPathFindingLayer.NULL_PATH_FINDING_LAYER then
            local parentAdvancedRTSGameLayer = self.parentLayer
            if parentAdvancedRTSGameLayer:getType() ~= UnitLayer.getStaticType() then
                return true
            end
        end
        return false
end


function AdvancedRTSGameLayer:isWaypointListEmptyOrOnlyTargets()
        if self:getType() ~= UnitLayer.getStaticType() then
            return true
        end
        return false
end


-- throws Exception
function AdvancedRTSGameLayer:buildingChase(allbinaryLayer, cellPosition)
        local geographicMapCellPosition = self:getCurrentGeographicMapCellPosition()
        local buildingDirection = GeographicMapDirectionUtil.getInstance():getDirectionFromCellPositionToAdjacentCellPosition(geographicMapCellPosition, cellPosition)
        local angleInfo = self:getRotationAnimationInterface():getAngleInfoP()
        local angle = FrameUtil.getInstance():adjustAngleToFrameAngle(angleInfo:getAngle() + 90)
        local gameKeyEventFactory = GameKeyEventFactory.getInstance()
        if buildingDirection == DirectionFactory.getInstance().UP then
            self.rtsLayer2LogHelper:buildingAbove(self)
            if angle > 180 and angle < 360 then
                self.rtsLayer2LogHelper:buildingChaseLeft(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle <= 190 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseRight(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle >= 170 then
                    return true
                end
            end
        elseif buildingDirection == DirectionFactory.getInstance().DOWN then
            self.rtsLayer2LogHelper:buildingDown(self)
            if angle > 180 and angle < 360 then
                self.rtsLayer2LogHelper:buildingChaseLeft(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle > 315 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseRight(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle < 45 then
                    return true
                end
            end
        elseif buildingDirection == DirectionFactory.getInstance().LEFT then
            self.rtsLayer2LogHelper:buildingLeft()
            if angle > 90 and angle < 270 then
                self.rtsLayer2LogHelper:buildingChaseDown(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle < 135 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseUp(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle > 45 then
                    return true
                end
            end
        elseif buildingDirection == DirectionFactory.getInstance().RIGHT then
            self.rtsLayer2LogHelper:buildingRight()
            if angle > 90 and angle < 270 then
                self.rtsLayer2LogHelper:buildingChaseDown(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                if angle > 225 then
                    return true
                end
            else
                self.rtsLayer2LogHelper:buildingChaseUp(self, angle)
                self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                if angle < 315 and angle > 180 then
                    return true
                end
            end
        else
            return true
        end
        return false
end


-- throws Exception
function AdvancedRTSGameLayer:getSurroundingGeographicMapCellPositionList()
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.geographicMapCellPositionAreaBase:update(geographicMapInterface)
        return self.geographicMapCellPositionAreaBase:getSurroundingGeographicMapCellPositionList()
end


function AdvancedRTSGameLayer:setSelected(selected)
        RTSLayer.setSelected(self, selected)
        if self.debug then
            if selected then
                self.waypointLogHelperP = WaypointSelectedLogHelper.getInstance()
                self.waypoint2LogHelperP = Waypoint2SelectedLogHelper.getInstance()
                self.waypointRunnableLogHelperP = WaypointRunnableSelectedLogHelper.getInstance()
            else
                self.waypointLogHelperP = WaypointLogHelper.getInstance()
                self.waypoint2LogHelperP = Waypoint2LogHelper.getInstance()
                self.waypointRunnableLogHelperP = WaypointRunnableLogHelper.getInstance()
            end
        end
end


function AdvancedRTSGameLayer:onDestroyed(destroyedEvent)
        local try_ok, try_error = pcall(function()
            local layerInterface = destroyedEvent:getLayerInterface()
            if layerInterface == self then
                DestroyedEventHandler.getInstance():removeListener(self)
                local waypoint = self:getWaypointBehavior():getWaypoint()
                waypoint:reset()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onDestroyed", e)
        end
end

return AdvancedRTSGameLayer


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
-- package org.allbinary.game.layer.unit

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local ExplosionBasicSound = require("org.allbinary.ag.weapon.media.audio.ExplosionBasicSound")
local Animation = require("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = require("org.allbinary.animation.NullIndexedAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local CaptionAnimationHelper = require("org.allbinary.animation.caption.CaptionAnimationHelper")
local CaptionAnimationHelperBase = require("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local AdjustedCircleAnimation = require("org.allbinary.animation.vector.AdjustedCircleAnimation")
local Direction = require("org.allbinary.direction.Direction")
local DamageFloaters = require("org.allbinary.game.combat.damage.DamageFloaters")
local PtsDamageFloaters = require("org.allbinary.game.combat.damage.PtsDamageFloaters")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local Health = require("org.allbinary.game.health.Health")
local HealthBar = require("org.allbinary.game.health.HealthBar")
local HealthBarTwodAnimation = require("org.allbinary.game.health.HealthBarTwodAnimation")
local Group = require("org.allbinary.game.identification.Group")
local GroupCommonFactory = require("org.allbinary.game.identification.GroupCommonFactory")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local GameKeyEventUtil = require("org.allbinary.game.input.event.GameKeyEventUtil")
local VisibleCellPositionsSingleton = require("org.allbinary.game.input.form.VisibleCellPositionsSingleton")
local WaypointRTSFormInput = require("org.allbinary.game.input.form.WaypointRTSFormInput")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local AdvancedRTSProperties = require("org.allbinary.game.layer.AdvancedRTSProperties")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local CaptionResources = require("org.allbinary.game.layer.CaptionResources")
local LinePathRelativeAnimation = require("org.allbinary.game.layer.LinePathRelativeAnimation")
local PathAnimation = require("org.allbinary.game.layer.PathAnimation")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayer2LogHelper = require("org.allbinary.game.layer.RTSLayer2LogHelper")
local RTSLayer2SelectedLogHelper = require("org.allbinary.game.layer.RTSLayer2SelectedLogHelper")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local RTSLayerHudPaintable = require("org.allbinary.game.layer.RTSLayerHudPaintable")
local RTSLayerLogHelper = require("org.allbinary.game.layer.RTSLayerLogHelper")
local RTSLayerSelectedLogHelper = require("org.allbinary.game.layer.RTSLayerSelectedLogHelper")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local SensorActionFactory = require("org.allbinary.game.layer.SensorActionFactory")
local SteeringVisitor = require("org.allbinary.game.layer.SteeringVisitor")
local TiledLayerUtil = require("org.allbinary.game.layer.TiledLayerUtil")
local VehicleFrictionProperties = require("org.allbinary.game.layer.VehicleFrictionProperties")
local VehicleProperties = require("org.allbinary.game.layer.VehicleProperties")
local WaypointBehaviorBase = require("org.allbinary.game.layer.WaypointBehaviorBase")
local BuildingLayer = require("org.allbinary.game.layer.building.BuildingLayer")
local BuildingEventHandler = require("org.allbinary.game.layer.building.event.BuildingEventHandler")
local BuildingEventListenerInterface = require("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local CapitalEvent = require("org.allbinary.game.layer.capital.event.CapitalEvent")
local CapitalEventHandlerFactory = require("org.allbinary.game.layer.capital.event.CapitalEventHandlerFactory")
local LayerPartialCellPositionsUtil = require("org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil")
local SpecialDownGameInputProcessor = require("org.allbinary.game.layer.special.SpecialDownGameInputProcessor")
local SpecialFireGameInputProcessor = require("org.allbinary.game.layer.special.SpecialFireGameInputProcessor")
local SpecialLeftGameInputProcessor = require("org.allbinary.game.layer.special.SpecialLeftGameInputProcessor")
local SpecialRightGameInputProcessor = require("org.allbinary.game.layer.special.SpecialRightGameInputProcessor")
local SpecialUpGameInputProcessor = require("org.allbinary.game.layer.special.SpecialUpGameInputProcessor")
local MultipassNoCacheWaypoint = require("org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint")
local NoCacheWaypoint = require("org.allbinary.game.layer.waypoint.NoCacheWaypoint")
local WaypointBase = require("org.allbinary.game.layer.waypoint.WaypointBase")
local WaypointEventHandlerFactory = require("org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local BasicWeaponPart = require("org.allbinary.game.part.weapon.BasicWeaponPart")
local SalvoInterface = require("org.allbinary.game.part.weapon.SalvoInterface")
local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = require("org.allbinary.game.tracking.TrackingEventListenerInterface")
local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local Layer = require("org.allbinary.layer.Layer")
local LayerInterfaceFactoryInterface = require("org.allbinary.layer.LayerInterfaceFactoryInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local FrameUtil = require("org.allbinary.math.FrameUtil")
local LayerDistanceUtil = require("org.allbinary.math.LayerDistanceUtil")
local NamedAngle = require("org.allbinary.math.NamedAngle")
local AttackSound = require("org.allbinary.media.audio.AttackSound")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local Sound = require("org.allbinary.media.audio.Sound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local DropCellPositionHistory = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local RaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local UnitLayer = {}
UnitLayer.__index = UnitLayer
UnitLayer.className = "UnitLayer"
setmetatable(UnitLayer, {__index = AdvancedRTSGameLayer})

function UnitLayer:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.groupCommonFactory = GroupCommonFactory.getInstance()
    self.layerPartialCellPositionsUtil = LayerPartialCellPositionsUtil.getInstance()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
    self.angleFactory = AngleFactory.getInstance()
    self.cellPositionFactory = CellPositionFactory.getInstance()
    self.maxResourceLoad = nil
    self.vehicleProperties = nil
    self.accelerationBasicDecimal = BasicDecimal.new(1600)
    self.decelerationBasicDecimal = BasicDecimal.new(-1000)
    self.trackingEvent = nil
    self.damageFloaters = nil
    self.damageFloatersPaintableInterface = nil
    self.healthBar = nil
    self.moveSoundInterface = nil
    self.initResourceAnimation = nil
    self.resourceAnimation = NullIndexedAnimationFactory.getFactoryInstance():getInstance(0)
    self.initPathAnimation = nil
    self.pathAnimation = NullAnimationFactory.getFactoryInstance():getInstance(0)
    self.captionAnimationHelper = CaptionAnimationHelper.new(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(CaptionResources.getInstance().RESOURCE):getInstance(0), -23, -25, 6, 0)
    self.decalAnimation = nil
    self.waypointLayerInterfaceFactoryInterface = nil
    self.resourceLoad = 0
    self.weaponRange = 0
    self.rtsLogHelper = RTSLayerLogHelper.getInstance()
    self.rotationAnimationInterfaceP = nil
    self.movementAngle = self.angleFactory.NOT_ANGLE
    self.steeringInsideGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.sensorGeographicMapCellPositionList = BasicArrayListD.new()
    self.CAPITAL_EVENT = CapitalEvent.new(self)
end


function UnitLayer.new(remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, vehicleProperties, healthInterface, maxResourceLoad, moveSoundInterface, waypointLayerInterfaceFactoryInterface, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, decalAnimationInterfaceFactoryInterface, resourceAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, direction, x, y, z, viewPosition)
    local self = setmetatable(AdvancedRTSGameLayer.new(remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, healthInterface, WaypointRTSFormInput.new(groupInterface, true), animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition), UnitLayer)
    self:_init_fields()
        -- super(...) made self above
        self:setCollidableInferface(CollidableUnitBehavior.new(true))
        self.waypointLayerInterfaceFactoryInterface = waypointLayerInterfaceFactoryInterface
        self.maxResourceLoad = math.tointeger(maxResourceLoad // 1)
        self.moveSoundInterface = moveSoundInterface
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().DAMAGE_FLOATERS) then
            self.damageFloaters = PtsDamageFloaters.new(self)
            self.damageFloatersPaintableInterface = self.damageFloaters
        else
            self.damageFloatersPaintableInterface = NullPaintable.getInstance()
            self.damageFloaters = DamageFloaters.new()
        end
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().HEALTH_BARS) then
            self.healthBar = HealthBar.new(self, self:getHealthInterface(), HealthBarTwodAnimation.new(self, BasicHudFactory.getInstance().BOTTOMLEFT), -1)
        else
            self.healthBar = NullPaintable.getInstance()
        end
        self.decalAnimation = decalAnimationInterfaceFactoryInterface:getInstance(0)
        self.initResourceAnimation = resourceAnimationInterfaceFactoryInterface:getInstance(0)
        self.initResourceAnimation:setFrameByDirection(direction)
        self.decalAnimation:setFrameByDirection(direction)
        self.rotationAnimationInterfaceP = self.indexedButShouldBeRotationAnimationInterface
        self.rotationAnimationInterfaceP:setFrameByDirection(direction)
        self:setMaxLevel(12)
        self.vehicleProperties = vehicleProperties
        self.trackingEvent = TrackingEvent.new(self)
        self.initPathAnimation = PathAnimation.new(self, LinePathRelativeAnimation.getInstance())
    return self
end


-- throws Exception
function UnitLayer:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        AdvancedRTSGameLayer.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        self.initPathAnimation:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
end


-- throws Exception
function UnitLayer:updateWaypointBehavior(geographicMapInterface)
        local hashtable = StdUtil.getInstance():createHashtable()
        hashtable:put(self.groupCommonFactory.ID, self:getGroupInterface())
        hashtable:put(Layer.ID, self)
        hashtable:put(AllBinaryGameLayerManager.ID, self.allBinaryGameLayerManagerP)
        self:setWaypointBehavior(UnitWaypointBehavior2.new(self, self.waypointLayerInterfaceFactoryInterface:getNextInstance(hashtable, self.x, self.y, self.z)))
        local features = Features.getInstance()
        local waypoint = (function() if J2MEUtil.isHTML() then return MultipassNoCacheWaypoint.new(self, AttackSound.getInstance()) else return NoCacheWaypoint.new(self, AttackSound.getInstance()) end end)()
        self:getWaypointBehavior():setWaypoint(waypoint)
        AdvancedRTSGameLayer.updateWaypointBehavior(self, geographicMapInterface)
        self:initRangeHack()
end


-- throws Exception
function UnitLayer:construct(rtsPlayerLayerInterface)
        AdvancedRTSGameLayer.construct(self, rtsPlayerLayerInterface)
        TrackingEventHandler.getInstance():addListenerInterface(self)
        WaypointEventHandlerFactory.getInstance(self:getGroupInterface()[1]):addListenerInterface(self:getUnitWaypointBehavior())
        BuildingEventHandler.getInstance():addListenerInterface(self)
        self:getUnitWaypointBehavior():setCurrentPathGeographicMapCellPosition(self:getCurrentGeographicMapCellPosition())
        self:updateSensorGeographicMapCellPositionList()
        self:getUnitWaypointBehavior():setLastPathGeographicMapCellPosition(self:getUnitWaypointBehavior():getCurrentPathGeographicMapCellPosition())
end


-- throws Exception
function UnitLayer:updateSensorGeographicMapCellPositionList()
        if VisibleCellPositionsSingleton.getInstance():shouldProcess() then
            local currentGeographicMapCellPosition = self:getCurrentGeographicMapCellPosition()
            self.sensorGeographicMapCellPositionList:clear()
            self.sensorGeographicMapCellPositionList:add(currentGeographicMapCellPosition)
            local sensorRange = self.weaponRange * UnitLayer.SENSOR_RANGE_MULTIPLIER
            local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
            local totalCells = (sensorRange / tiledLayer:getCellHeight()) / 2
            local geographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
            local column = currentGeographicMapCellPosition:getColumn()
            local row = currentGeographicMapCellPosition:getRow()
            local lastColumn = column + totalCells
            local lastRow = row + totalCells
            if lastColumn > tiledLayer:getColumns() then
                lastColumn = tiledLayer:getColumns()
            end
            if lastRow > tiledLayer:getRows() then
                lastRow = tiledLayer:getRows()
            end
            local firstColumn = column - totalCells
            local firstRow = row - totalCells
            if firstColumn < 0 then
                firstColumn = 0
            end
            if firstRow < 0 then
                firstRow = 0
            end
            for index = lastColumn - 1, firstColumn, -1 do
                for index2 = lastRow - 1, firstRow, -1 do
                    local geographicMapCellPosition = geographicMapCellPositionFactory:getAt(index, index2)
                    if not self.sensorGeographicMapCellPositionList:contains(geographicMapCellPosition) then
                        self.sensorGeographicMapCellPositionList:add(geographicMapCellPosition)
                    end
                end
            end
        end
end


function UnitLayer:getSensorGeographicMapCellPositionList()
        return self.sensorGeographicMapCellPositionList
end


function UnitLayer:select()
        self.pathAnimation = self.initPathAnimation
        AdvancedRTSGameLayer.select(self)
end


function UnitLayer:deselect()
        self.pathAnimation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        AdvancedRTSGameLayer.deselect(self)
end


function UnitLayer:setSelected(selected)
        AdvancedRTSGameLayer.setSelected(self, selected)
        if selected then
            if self.debug then
                self.rtsLogHelper = RTSLayerSelectedLogHelper.getInstance()
            end
            self.rtsLayer2LogHelper = RTSLayer2SelectedLogHelper.getInstance()
        else
            if self.debug then
                self.rtsLogHelper = RTSLayerLogHelper.getInstance()
            end
            self.rtsLayer2LogHelper = RTSLayer2LogHelper.getInstance()
        end
end


-- throws Exception
function UnitLayer:setClosestGeographicMapCellHistory(pathsList)
        self.rtsLogHelper:setClosestGeographicMapCellHistory(self, pathsList)
        local closestIndex = -1
        local shortestDistance = Integer.MAX_VALUE
        local currentDistance = Integer.MAX_VALUE
        for index = pathsList:size() - 1, 0, -1 do
            local geographicMapCellPositionBasicArrayList = pathsList:get(index)
            local geographicMapCellPosition = geographicMapCellPositionBasicArrayList:get(geographicMapCellPositionBasicArrayList:size() - 1)
            currentDistance = self.layerDistanceUtil:getDistanceAt(self, geographicMapCellPosition:getMidPoint())
            if currentDistance < shortestDistance then
                shortestDistance = currentDistance
                closestIndex = index
            end
        end
        if closestIndex >= 0 then
            local geographicMapCellPositionBasicArrayList = pathsList:get(closestIndex)
            local geographicMapCellPosition = geographicMapCellPositionBasicArrayList:get(0)
            self:teleportTo(geographicMapCellPosition)
        end
end


-- throws Exception
function UnitLayer:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
        geographicMapCellHistory:trackAll(geographicMapCellPositionBasicArrayList)
end


function UnitLayer:onMovement(trackingEvent)
        local try_ok, try_error = pcall(function()
            local layerInterface = trackingEvent:getLayerInterface()
            if layerInterface:getGroupInterface()[1] ~= self:getGroupInterface()[1] then
                self:getUnitWaypointBehavior():getPossibleTargetList():add(layerInterface)
                layerInterface:onMovementFound(self:getTrackingEvent())
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "onMovement", e)
        end
end


-- throws Exception
function UnitLayer:onMovementFound(trackingEvent)
        local layerInterface = trackingEvent:getLayerInterface()
        if layerInterface:getGroupInterface()[1] ~= self:getGroupInterface()[1] then
            self:getUnitWaypointBehavior():getPossibleTargetList():add(layerInterface)
        end
end


function UnitLayer:initRangeHack()
        local basicWeaponPart = self:getPartInterfaceArray()[1]
        local weaponProperties = basicWeaponPart:getWeaponProperties()
        self.weaponRange = weaponProperties:getRange()
        self.initRangeAnimation = AdjustedCircleAnimation.createW(self.weaponRange, self.weaponRange, self:getWidth(), self.basicColorFactory.GREEN)
        local sensorRange = self.weaponRange * UnitLayer.SENSOR_RANGE_MULTIPLIER
        self.initSensorRangeAnimation = AdjustedCircleAnimation.createW(sensorRange, sensorRange, self:getWidth(), self.basicColorFactory.RED)
        self:getUnitWaypointBehavior():initRange(self.weaponRange)
        self.fireTimeHelper.delay = (java_int(weaponProperties:getReloadTime()))
end


-- throws Exception
function UnitLayer:processBuiltTick(allBinaryLayerManager)
        if not self:getHealthInterface():isAlive() then
            if self:isReadyForExplosion() then
                local currentFrame = self.destroyAnimationInterface:getFrame()
                local size = self.destroyAnimationInterface:getSize() - 1
                if currentFrame == size then
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
                self:setReadyForExplosion(true)
            end
        else
            AdvancedRTSGameLayer.processBuiltTick(self, allBinaryLayerManager)
        end
        self.captionAnimationHelper:tick()
        self:getUnitWaypointBehavior():processTick(allBinaryLayerManager)
end


function UnitLayer:teleportTo(geographicMapCellPosition)
        local point = geographicMapCellPosition:getMidPoint()
        self:setPosition(point:getX() - self:getHalfWidth(), point:getY() - self:getHalfHeight(), self.z)
end


-- throws Exception
function UnitLayer:getCurrentGeographicMapCellPosition()
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local geographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(self.x + self:getHalfWidth(), self.y + self:getHalfHeight())
        local raceTrackGeographicMap = geographicMapInterface
        if not raceTrackGeographicMap:isValid(geographicMapCellPosition) then
            error(java_exception("Exception", "Position is not really on the map: " .. tostring(geographicMapCellPosition)), 0)
        end
        return geographicMapCellPosition
end


-- throws Exception
function UnitLayer:fire(layerManager, gameKeyEvent)
        if self.fireTimeHelper:isTimeTNT() then
            self:fireAll(layerManager)
        else
            self:reload()
        end
end


-- throws Exception
function UnitLayer:left()
        self.initResourceAnimation:previousRotation()
        self.decalAnimation:previousRotation()
        self.rotationAnimationInterfaceP:previousRotation()
end


-- throws Exception
function UnitLayer:right()
        self.initResourceAnimation:nextRotation()
        self.decalAnimation:nextRotation()
        self.rotationAnimationInterfaceP:nextRotation()
end


function UnitLayer:down()
        local velocityProperties = self:getVehicleProperties():getVelocityProperties()
        if not velocityProperties:isOverXYMaxForwardVelocity() then
            self:accelerate(self.decelerationBasicDecimal)
        end
end


function UnitLayer:up()
        local velocityProperties = self:getVehicleProperties():getVelocityProperties()
        if not velocityProperties:isOverXYMaxForwardVelocity() then
            self:accelerate(self.accelerationBasicDecimal)
        end
end


function UnitLayer:initInputProcessors()
        self.inputProcessorArray[Canvas.RIGHT + 1] = SpecialRightGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.LEFT + 1] = SpecialLeftGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM0 + 1] = SpecialFireGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_POUND + 1] = self.inputProcessorArray[Canvas.KEY_NUM0 + 1]
        self.inputProcessorArray[Canvas.DOWN + 1] = SpecialDownGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.UP + 1] = SpecialUpGameInputProcessor.new(self)
        AdvancedRTSGameLayer.initInputProcessors(self)
end


-- throws Exception
function UnitLayer:processInput(layerManager)
        local list = self:getGameKeyEventList()
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list:get(index)
            local key = GameKeyEventUtil.getKey(anyType)
            self.inputProcessorArray[key + 1]:processEvent(layerManager, GameKeyEvent.NONE)
        end
        list:clear()
        self:groundFriction()
        self:move()
end


function UnitLayer:accelerate(accelerate)
        self:getVehicleProperties():getVelocityProperties():addVelocityi(accelerate:getUnscaled(), java_int(self.rotationAnimationInterfaceP:getAngleInfoP():getAngle()), 90)
end


-- throws Exception
function UnitLayer:fireAll(layerManager)
        local angleInfo = self.rotationAnimationInterfaceP:getAngleInfoP()
        local angle = java_int((angleInfo:getAngle() + self.slightAngle))
        self.hashtable:put(SmallIntegerSingletonFactory.getInstance():getAt(1), SmallIntegerSingletonFactory.getInstance():getAt(java_int(AngleFactory.getInstance():getAt(angle):getValue())))
        local salvoInterface = self:getPartInterfaceArray()[1]
        salvoInterface:process(layerManager, angle, 90)
end


function UnitLayer:downgrade()
        if self:getLevel() > 1 then
            AdvancedRTSGameLayer.downgrade(self)
        end
end


function UnitLayer:upgrade()
        AdvancedRTSGameLayer.upgrade(self)
        self:initRangeHack()
end


function UnitLayer:groundFriction()
        local vehicleFrictionProperties = self:getVehicleProperties():getVehicleFrictionProperties()
        self:getVehicleProperties():getVehicleFrictionProperties():friction(self:getVehicleProperties():getVelocityProperties(), vehicleFrictionProperties:getTireFrictionNominator())
end


-- throws Exception
function UnitLayer:trackTo(reason)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        local point = nextUnvisitedPathGeographicMapCellPosition:getMidPoint()
        local dx = (self:getXP() + self:getHalfWidth()) - point:getX()
        local dy = (self:getYP() + self:getHalfHeight()) - point:getY()
        self.rtsLogHelper:trackTo(self, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason)
        self:trackToDXY(dx, dy)
end


-- throws Exception
function UnitLayer:trackToDXY(dx, dy)
        local angleOfTarget = 0
        self:trackToDXYTargetAngle(dx, dy, angleOfTarget)
end


-- throws Exception
function UnitLayer:turnTo(dx, dy, targetAngle)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        local evading = false
        if self:getUnitWaypointBehavior():getSensorAction() == SensorActionFactory.getInstance().EVADE then
            self.rtsLogHelper:evade(self)
            evading = true
            targetAngle = targetAngle + (180)
        end
        local angleInfo = self.rotationAnimationInterfaceP:getAngleInfoP()
        local angle = FrameUtil.getInstance():adjustAngleToFrameAngle(angleInfo:getAngle() - 270)
        self.rtsLogHelper:turnTo(self, dx, dy, angleInfo, angle, self.movementAngle, evading, targetAngle)
        local gameKeyEventFactory = GameKeyEventFactory.getInstance()
        if dx == 0 and dy == 0 then
            self.rtsLogHelper:doneMoving(self)
            return true
        elseif (java_int(self.movementAngle:getValue())) == angle then
            if dx > 0 and self.movementAngle == self.angleFactory.LEFT then
                self.rtsLogHelper:movingLeft(self)
                return false
            end
            if dx < 0 and self.movementAngle == self.angleFactory.RIGHT then
                self.rtsLogHelper:movingRight(self)
                return false
            end
            if dy > 0 and self.movementAngle == self.angleFactory.UP then
                self.rtsLogHelper:movingUp(self)
                return false
            end
            if dy < 0 and self.movementAngle == self.angleFactory.DOWN then
                self.rtsLogHelper:movingDown(self)
                return false
            end
            self.rtsLogHelper:currentMoveEnded(self)
            if self.movementAngle == self.angleFactory.LEFT or self.movementAngle == self.angleFactory.RIGHT then
                self:handleDeltalY(dx, dy)
            elseif self.movementAngle == self.angleFactory.UP or self.movementAngle == self.angleFactory.DOWN then
                self:handleDeltalX(dx, dy)
            end
            return true
        else
            if nextUnvisitedPathGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
                if self.steeringInsideGeographicMapCellPosition ~= nextUnvisitedPathGeographicMapCellPosition then
                    if math.abs(dx) > math.abs(dy) and dy ~= 0 then
                        self:handleDeltalY(dx, dy)
                    elseif dx ~= 0 then
                        self:handleDeltalX(dx, dy)
                    else
                        self:handleDeltalY(dx, dy)
                    end
                end
                local deltaAngle2 = self.movementAngle:getValue() - angle
                if deltaAngle2 > 0 then
                    self.rtsLogHelper:rotateRight(self)
                    self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.RIGHT))
                else
                    self.rtsLogHelper:rotateLeft(self)
                    self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.LEFT))
                end
                return true
            else
                self.rtsLogHelper:noRotation(self)
            end
            return false
        end
end


function UnitLayer:handleDeltalX(dx, dy)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        if dx > 0 then
            self.movementAngle = self.angleFactory.LEFT
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        else
            self.movementAngle = self.angleFactory.RIGHT
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        end
        self.rtsLogHelper:handle(self, self.movementAngle)
end


function UnitLayer:handleDeltalY(dx, dy)
        local waypointBehaviorBase = self.waypointBehaviorBase
        local nextUnvisitedPathGeographicMapCellPosition = waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        if dy > 0 then
            self.movementAngle = self.angleFactory.UP
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        else
            self.movementAngle = self.angleFactory.DOWN
            self.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition
        end
        self.rtsLogHelper:handle(self, self.movementAngle)
end


-- throws Exception
function UnitLayer:trackToDXYTargetAngle(dx, dy, targetAngle)
        local list = self:getUnitWaypointBehavior():getSteeringVisitorList()
        if list:size() > 0 then
            for index = list:size() - 1, 0, -1 do
                local steeringVisitor = list:get(index)
                local anyType = steeringVisitor:visit(self)
                if anyType == nil then
                    list:removeAt(index)
                end
            end
            self:fireOrMove()
        elseif not self:turnTo(dx, dy, targetAngle) then
            self:fireOrMove()
        end
end


-- throws Exception
function UnitLayer:fireOrMove()
        local gameKeyEventFactory = GameKeyEventFactory.getInstance()
        if self:getUnitWaypointBehavior():needToMove() then
            self.rtsLayer2LogHelper:steeringUp(self)
            if self.showMoreCaptionStates and not self.captionAnimationHelper:isShowing() then
                self.captionAnimationHelper:update(UnitLayer.MOVE, self.basicColorFactory.GREEN)
            end
            self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.UP))
        else
            self.captionAnimationHelper:update(CommonPhoneStrings.getInstance().FIRE, self.basicColorFactory.RED)
            self.rtsLayer2LogHelper:steeringFireOrStop(self)
            self:allStop()
            self:getGameKeyEventList():add(gameKeyEventFactory:getInstanceForKey(self, Canvas.KEY_NUM0))
            TrackingEventHandler.getInstance():fireEvent(self:getTrackingEvent())
        end
end


function UnitLayer:move()
        local try_ok, try_error = pcall(function()
            local velocityProperties = self:getVehicleProperties():getVelocityProperties()
            local velocityXScaled = java_int(velocityProperties:getVelocityXBasicDecimalP():getScaled())
            local velocityYScaled = java_int(velocityProperties:getVelocityYBasicDecimalP():getScaled())
            self:getUnitWaypointBehavior():move()
            if velocityXScaled ~= 0 or velocityYScaled ~= 0 then
                self:getUnitWaypointBehavior():setMoving(true)
                local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
                local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
                self.layerPartialCellPositionsUtil:getAllDXY(geographicMapInterface, self, velocityXScaled, velocityYScaled, UnitLayer.getPartialpositionlist())
                local cellPosition = DropCellPositionHistory.getInstance():getCellPositionWithDrop(UnitLayer.getPartialpositionlist())
                if cellPosition == self.cellPositionFactory.NONE then
                    local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
                    local tiledLayerUtil = TiledLayerUtil.getInstance()
                    local x = self.x + velocityXScaled
                    local y = self.y + velocityYScaled
                    x = tiledLayerUtil:keepOnMapX(tiledLayer, x, self:getWidth())
                    y = tiledLayerUtil:keepOnMapY(tiledLayer, y, self:getHeight())
                    self:setPosition(x, y, self.z)
                else
                    local allbinaryLayer = DropCellPositionHistory.getInstance():getLayerInterface(cellPosition)
                    self:getUnitWaypointBehavior():setMovingFromStopped(false)
                    self:getUnitWaypointBehavior():addBuildingChase(allbinaryLayer, cellPosition)
                end
            end
            if self:getUnitWaypointBehavior():isMoving() then
                TrackingEventHandler.getInstance():fireEvent(self:getTrackingEvent())
            else
                self:getUnitWaypointBehavior():setMovingFromStopped(false)
            end
            if self:getUnitWaypointBehavior():isMovingFromStopped() and self:isVisible() then
                SecondaryPlayerQueueFactory.getInstance():add(self.moveSoundInterface)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "move", e)
        end
end


function UnitLayer:allStop()
        local velocityProperties = self:getVehicleProperties():getVelocityProperties()
        velocityProperties:getVelocityXBasicDecimalP():setint(0)
        velocityProperties:getVelocityYBasicDecimalP():setint(0)
end


function UnitLayer:paint(graphics)
        if self:isVisible() then
            AdvancedRTSGameLayer.paint(self, graphics)
            local viewPosition = self:getViewPosition()
            local viewX = viewPosition:getX()
            local viewY = viewPosition:getY()
            self.decalAnimation:paintXY(graphics, viewX, viewY)
            self.rangeAnimation:paintXY(graphics, viewX, viewY)
            self.sensorRangeAnimation:paintXY(graphics, viewX, viewY)
            self.damageFloatersPaintableInterface:paint(graphics)
            self.healthBar:paint(graphics)
            self.captionAnimationHelper:paintXY(graphics, viewX, viewY)
            self.pathAnimation:paintXY(graphics, viewX, viewY)
            self.resourceAnimation:paintXY(graphics, viewX, viewY)
        end
end


-- throws Exception
function UnitLayer:onBuildingEvent(event)
        local buildingLayer = event:getRtsLayer()
        self:getUnitWaypointBehavior():moveAwayFromBuilding(buildingLayer)
end


function UnitLayer:getVehicleProperties()
        return self.vehicleProperties
end


-- throws Exception
function UnitLayer:damage(damage, damageType)
        AdvancedRTSGameLayer.damage(self, damage, damageType)
        self.damageFloaters:add(damage)
        if damage > 0 then
            self:getHealthInterface():damage(damage)
        end
end


-- throws Exception
function UnitLayer:getDamage(damageType)
        return 0
end


-- throws Exception
function UnitLayer:setDestroyed(destroyed)
        self.logUtil:putF(self.commonStrings.START, self, "setDestroyed")
        AdvancedRTSGameLayer.setDestroyed(self, destroyed)
        if self:isDestroyed() then
            WaypointEventHandlerFactory.getInstance(self:getGroupInterface()[1]):removeListener(self:getUnitWaypointBehavior())
            TrackingEventHandler.getInstance():removeListener(self)
            BuildingEventHandler.getInstance():removeListener(self)
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


function UnitLayer:getLoad()
        return self.resourceLoad
end


-- throws Exception
function UnitLayer:clearResourceAnimation()
        self.resourceAnimation = NullIndexedAnimationFactory.getFactoryInstance():getInstance(0)
end


-- throws Exception
function UnitLayer:setLoad(resource)
        if resource > 0 then
            self.resourceAnimation = self.initResourceAnimation
        else
            self:clearResourceAnimation()
        end
        self.resourceLoad = resource
end


function UnitLayer:addLoad(resource)
        self.resourceLoad = self.resourceLoad + (resource)
end


-- throws Exception
function UnitLayer:handleCost(ownerLayer)
        if self:getLoad() > 0 then
            self.CAPITAL_EVENT:setValue(self:getLoad())
            CapitalEventHandlerFactory.getInstance(ownerLayer:getGroupInterface()[1]):fireEvent(self.CAPITAL_EVENT)
            self:setLoad(0)
        end
end


function UnitLayer:createHudPaintable()
        local rtsLayerHudPaintable = RTSLayerHudPaintable.getInstance()
        rtsLayerHudPaintable:setBasicColorP(self.allBinaryGameLayerManagerP:getForegroundBasicColor())
        rtsLayerHudPaintable:setRtsLayer(self)
        return rtsLayerHudPaintable
end


function UnitLayer:getHudPaintable()
        local rtsLayerHudPaintable = RTSLayerHudPaintable.getInstance()
        return rtsLayerHudPaintable
end


function UnitLayer:getType()
        return UnitLayer.getStaticType()
end


function UnitLayer.getStaticType()
        return 1
end


function UnitLayer:getUnitWaypointBehavior()
        return self:getWaypointBehavior()
end


function UnitLayer:getTrackingEvent()
        return self.trackingEvent
end


function UnitLayer:getCaptionAnimationHelper()
        return self.captionAnimationHelper
end


function UnitLayer:isSelfUpgradeable()
        return false
end


function UnitLayer:getMaxResourceLoad()
        return self.maxResourceLoad
end


function UnitLayer.getPartialpositionlist()
        return UnitLayer.partialPositionList
end

UnitLayer.partialPositionList = BasicArrayListS.new(4)
UnitLayer.SENSOR_RANGE_MULTIPLIER = 6
UnitLayer.MOVE = "Moving"

return UnitLayer


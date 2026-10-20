-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local MultiPlayerGameLayer = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer")
local Animation = require("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local NullIndexedAnimationFactory = require("org.allbinary.animation.NullIndexedAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local CaptionAnimationHelperBase = require("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local DestroyedLayerProcessor = require("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local Health = require("org.allbinary.game.health.Health")
local Group = require("org.allbinary.game.identification.Group")
local GroupFactory = require("org.allbinary.game.identification.GroupFactory")
local GameInputInterface = require("org.allbinary.game.input.GameInputInterface")
local GameInputProcessor = require("org.allbinary.game.input.GameInputProcessor")
local GameInputProcessorUtil = require("org.allbinary.game.input.GameInputProcessorUtil")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local NullRTSFormInputFactory = require("org.allbinary.game.input.form.NullRTSFormInputFactory")
local Waypoint2LogHelper = require("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local WaypointLogHelper = require("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = require("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local TileLayerPositionIntoViewPosition = require("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ViewPositionEventHandler = require("org.allbinary.view.event.ViewPositionEventHandler")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LayerDistanceUtil = require("org.allbinary.math.LayerDistanceUtil")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local RTSInterface = require("org.allbinary.game.layer.RTSInterface")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")

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

local RTSLayer = {}
RTSLayer.__index = RTSLayer
RTSLayer.className = "RTSLayer"
setmetatable(RTSLayer, {__index = MultiPlayerGameLayer})

function RTSLayer:_init_fields()
    self.debug = true
    self.showMoreCaptionStates = self.debug
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.rtsLayer2LogHelper = RTSLayer2LogHelper.getInstance()
    self.waypointLogHelperP = WaypointLogHelper.getInstance()
    self.waypoint2LogHelperP = Waypoint2LogHelper.getInstance()
    self.waypointRunnableLogHelperP = WaypointRunnableLogHelper.getInstance()
    self.rtsFormInput = nil
    self.verticleBuildAnimationInterface = nil
    self.rangeAnimation = nil
    self.initRangeAnimation = nil
    self.sensorRangeAnimation = nil
    self.initSensorRangeAnimation = nil
    self.baseAnimationInterface = nil
    self.buildFrameTimeHelper = TimeDelayHelper.new(50)
    self.buildAnimationInterface = nil
    self.animationInterface = nil
    self.initAnimationInterface = nil
    self.indexedButShouldBeRotationAnimationInterface = nil
    self.emptyAnimationInterface = nil
    self.destroyAnimationInterface = nil
    self.fireTimeHelper = TimeDelayHelper.new(700)
    self.rootName = nil
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.BUILD_VALUE = 63
    self.geographicMapCellPositionAreaBase = nil
    self.healthInterface = Health.NULL_HEALTH
    self.level = 1
    self.maxLevel = 1
    self.hackVerticleBuild = self.BUILD_VALUE
    self.slightAngle = 0
    self.percentCompleteP = 0
    self.destroyed = false
    self.selected = false
    self.rtsLayerUtil = RTSLayerUtil.getInstance()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
end


-- throws Exception
function RTSLayer.createSimulatedInstance(remoteInfo)
        local nullAnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance()
        local nullIndexedAnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance()
        return RTSLayer.new(RemoteInfo.REMOTE_INFO, GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0, TileLayerPositionIntoViewPosition.new())
end


function RTSLayer.new(remoteInfo, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition)
    local self = setmetatable(MultiPlayerGameLayer.new(remoteInfo, groupInterface, name, rectangle, viewPosition), RTSLayer)
    self:_init_fields()
        -- super(...) made self above
        self:initInputProcessors()
        self.rootName = rootName
        self.healthInterface = healthInterface
        self.rtsFormInput = rtsFormInput
        self:setPosition(x, y, self.z)
        self.verticleBuildAnimationInterface = verticleBuildAnimationInterfaceFactoryInterface:getInstance(0)
        self.buildAnimationInterface = buildAnimationInterfaceFactoryInterface:getInstance(0)
        self.baseAnimationInterface = baseAnimationInterfaceFactoryInterface:getInstance(0)
        self.emptyAnimationInterface = emptyAnimationInterfaceFactoryInterface:getInstance(0)
        self.indexedButShouldBeRotationAnimationInterface = animationInterfaceFactoryInterface:getInstance(0)
        self.initAnimationInterface = self.indexedButShouldBeRotationAnimationInterface
        self.destroyAnimationInterface = proceduralAnimationInterfaceFactoryInterface:getInstanceAnimation(self.indexedButShouldBeRotationAnimationInterface)
        local animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        self.rangeAnimation = animation
        self.initRangeAnimation = animation
        self.sensorRangeAnimation = animation
        self.initSensorRangeAnimation = animation
        self.animationInterface = self.initAnimationInterface
        self.geographicMapCellPositionAreaBase = GeographicMapCellPositionArea.new(self)
    return self
end


-- throws Exception
function RTSLayer:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        MultiPlayerGameLayer.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local viewPosition2 = self:getViewPosition()
        viewPosition2:setTiledLayer(tiledLayer)
        self:updateWaypointBehavior(geographicMapInterface)
end


-- throws Exception
function RTSLayer:updateWaypointBehavior(geographicMapInterface)
        self.geographicMapCellPositionAreaBase:update(geographicMapInterface)
end


-- throws Exception
function RTSLayer:construct(rtsPlayerLayerInterface)
        ViewPositionEventHandler.getInstance():addListener(self)
        self.animationInterface = self.buildAnimationInterface
        self.hackVerticleBuild = 0
end


function RTSLayer:select()
        self.rangeAnimation = self.initRangeAnimation
        self.sensorRangeAnimation = self.initSensorRangeAnimation
        self:setSelected(true)
end


function RTSLayer:deselect()
        local animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        self.rangeAnimation = animation
        self.sensorRangeAnimation = animation
        self:setSelected(false)
end


function RTSLayer:setSelected(selected)
        self.selected = selected
end


function RTSLayer:isSelected()
        return self.selected
end


function RTSLayer:getPercentComplete()
        return self.percentCompleteP
end


function RTSLayer:getScrollSelectionForm()
        return ScrollSelectionForm.getNullScrollSelectionForm()
end


function RTSLayer:initInputProcessors()
        GameInputProcessorUtil.init(self.inputProcessorArray)
end


-- throws Exception
function RTSLayer:processBuiltTick(allBinaryLayerManager)
        self.animationInterface = self.indexedButShouldBeRotationAnimationInterface
end


function RTSLayer:processTick(allBinaryLayerManager)
        local try_ok, try_error = pcall(function()
            if self:isCompleted() then
                self:processBuiltTick(allBinaryLayerManager)
            else
                self:build()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "processTick", e)
        end
end


-- throws Exception
function RTSLayer:processInput(layerManager)
end


function RTSLayer:reload()
end


function RTSLayer:onMovement(trackingEvent)
end


-- throws Exception
function RTSLayer:onMovementFound(trackingEvent)
end


function RTSLayer:paint(graphics)
        MultiPlayerGameLayer.paintFirst(self, graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self:getAnimationInterface():paintXY(graphics, viewX, viewY)
end


-- throws Exception
function RTSLayer:damage(damage, damageType)
end


function RTSLayer:getSourceId()
        return RTSLayer.id
end


function RTSLayer:downgrade()
        self.rtsLayerUtil:downgrade(self)
end


function RTSLayer:upgrade()
        self.rtsLayerUtil:upgrade(self)
end


function RTSLayer:isCompleted()
        if self.hackVerticleBuild < self.BUILD_VALUE then
            return false
        else
            return true
        end
end


-- throws Exception
function RTSLayer:build()
        if self.buildFrameTimeHelper:isTimeTNT() then
            self.animationInterface = self.buildAnimationInterface
            self.verticleBuildAnimationInterface:nextFrame()
            self.hackVerticleBuild = self.hackVerticleBuild + 1
        end
        self.percentCompleteP = java_idiv(100 * self.hackVerticleBuild, self.BUILD_VALUE)
        self:getHudPaintable():updateInfo()
end


function RTSLayer:isSelfUpgradeable()
        return true
end


function RTSLayer:getCost()
        return self.rtsLayerUtil:getCost(self)
end


function RTSLayer:getDowngradeCost()
        return self.rtsLayerUtil:getDowngradeCost(self)
end


function RTSLayer:getUpgradeCost()
        return self.rtsLayerUtil:getUpgradeCost(self)
end


function RTSLayer:isUpgradeable()
        if self:getLevel() < self:getMaxLevel() then
            return true
        else
            return false
        end
end


function RTSLayer:isDowngradeable()
        if self:getLevel() > 1 then
            return true
        else
            return false
        end
end


function RTSLayer:getLevel()
        return self.level
end


function RTSLayer:setLevel(level)
        self.level = level
end


function RTSLayer:getVerticleBuildAnimationInterface()
        return self.verticleBuildAnimationInterface
end


function RTSLayer:getAnimationInterface()
        return self.animationInterface
end


function RTSLayer:setAnimationInterface(animationInterface)
        self.animationInterface = animationInterface
end


-- throws Exception
function RTSLayer:setTarget(targetGameLayer)
        local anotherTargetDistance = self.layerDistanceUtil:getDistance(self, targetGameLayer)
        local waypointBehaviorBase = self:getWaypointBehavior()
        waypointBehaviorBase:setTargetWithDistance(targetGameLayer, anotherTargetDistance)
end


function RTSLayer:createHudPaintable()
        error(java_exception("RuntimeException"), 0)
end


function RTSLayer:getHudPaintable()
        error(java_exception("RuntimeException"), 0)
end


function RTSLayer:getMaxLevel()
        return self.maxLevel
end


function RTSLayer:setMaxLevel(maxLevel)
        self.maxLevel = maxLevel
end


function RTSLayer:getHealthInterface()
        return self.healthInterface
end


function RTSLayer:setHealthInterface(healthInterface)
        self.healthInterface = healthInterface
end


function RTSLayer:getRTSFormInput()
        return self.rtsFormInput
end


-- throws Exception
function RTSLayer:isDestroyed()
        return self.destroyed
end


-- throws Exception
function RTSLayer:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            DestroyedLayerProcessor.getInstance():add(self)
            ViewPositionEventHandler.getInstance():removeListener(self)
        end
end


function RTSLayer:getEndGeographicMapCellPositionList()
        return self.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
end


function RTSLayer:getGeographicMapCellPositionArea()
        return self.geographicMapCellPositionAreaBase
end


function RTSLayer:shouldHandleStartSameAsEnd()
        return true
end


-- throws Exception
function RTSLayer:handleCost(ownerLayer)
end


function RTSLayer:getWaypointBehavior()
        error(java_exception("RuntimeException"), 0)
end


function RTSLayer:getParentLayer()
        error(java_exception("RuntimeException"), 0)
end


function RTSLayer:getRTSLayer2LogHelper()
        return self.rtsLayer2LogHelper
end


function RTSLayer:getWaypointLogHelper()
        return self.waypointLogHelperP
end


function RTSLayer:getWaypoint2LogHelper()
        return self.waypoint2LogHelperP
end


function RTSLayer:getWaypointRunnableLogHelper()
        return self.waypointRunnableLogHelperP
end


function RTSLayer:shouldAddWaypointFromBuilding()
        return false
end


function RTSLayer:getCaptionAnimationHelper()
        error(java_exception("RuntimeException"), 0)
end


function RTSLayer:isShowMoreCaptionStates()
        return self.showMoreCaptionStates
end


-- throws Exception
function RTSLayer:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
end


-- throws Exception
function RTSLayer:getCurrentGeographicMapCellPosition()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function RTSLayer:getTopLeftGeographicMapCellPosition()
        error(java_exception("RuntimeException"), 0)
end


function RTSLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function RTSLayer:setClosestGeographicMapCellHistory(pathsList)
end


function RTSLayer:teleportTo(geographicMapCellPosition)
end


-- throws Exception
function RTSLayer:setLoad(resource)
end


-- throws Exception
function RTSLayer:getSurroundingGeographicMapCellPositionList()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function RTSLayer:trackTo(reason)
end


-- throws Exception
function RTSLayer:trackToDXY(dx, dy)
end


function RTSLayer:isWaypointListEmptyOrOnlyTargets()
        return false
end


function RTSLayer:getTrackingEvent()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function RTSLayer:buildingChase(allbinaryLayer, cellPosition)
        return false
end


function RTSLayer:allStop()
end


function RTSLayer.getMinStaticType()
        return 1
end


function RTSLayer.getMaxStaticType()
        return 4
end


function RTSLayer.isRTSLayer(layerInterface)
        if layerInterface:getType() >= RTSLayer.getMinStaticType() and layerInterface:getType() <= RTSLayer.getMaxStaticType() then
            return true
        end
        return false
end


function RTSLayer:implmentsTickableInterface()
        return true
end


function RTSLayer:implmentsGameInputInterface()
        return true
end


function RTSLayer:getRootName()
        return self.rootName
end


function RTSLayer:getRotationAnimationInterface()
        return self.indexedButShouldBeRotationAnimationInterface
end


function RTSLayer:setFrame(index)
        self:getRotationAnimationInterface():setFrame(index)
end


function RTSLayer:setRotationAnimationInterface(rotationAnimationInterface)
        self.indexedButShouldBeRotationAnimationInterface = rotationAnimationInterface
end

RTSLayer.id = 0
RTSLayer.MAIN_INDEX = 0
RTSLayer.SECONDARY_INDEX = 1

return RTSLayer


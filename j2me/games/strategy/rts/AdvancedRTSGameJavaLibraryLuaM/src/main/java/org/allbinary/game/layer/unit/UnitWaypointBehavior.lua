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

local PrimaryWaypointHelper = require("org.allbinary.game.input.form.PrimaryWaypointHelper")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local SensorAction = require("org.allbinary.game.layer.SensorAction")
local SensorActionFactory = require("org.allbinary.game.layer.SensorActionFactory")
local WaypointBehaviorBase = require("org.allbinary.game.layer.WaypointBehaviorBase")
local BuildingLayer = require("org.allbinary.game.layer.building.BuildingLayer")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local WaypointEventListenerInterface = require("org.allbinary.game.layer.waypoint.event.WaypointEventListenerInterface")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

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

local UnitWaypointBehavior = {}
UnitWaypointBehavior.__index = UnitWaypointBehavior
UnitWaypointBehavior.className = "UnitWaypointBehavior"
setmetatable(UnitWaypointBehavior, {__index = WaypointBehaviorBase})

function UnitWaypointBehavior:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.longWeaponRange = 0
    self.sensorAction = SensorActionFactory.getInstance().ATTACK
    self.completeTimeDelayHelper = nil
    self.currentGeographicMapCellHistoryP = nil
    self.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.currentPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.FAKE_WAYPOINT_LAYER = nil
    self.targetList = nil
    self.possibleTargetList = nil
    self.associatedAdvancedRTSGameLayer = nil
    self.moving = false
    self.movingFromStopped = false
    self.waypointPathsListP = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.currentTargetDistance = Integer.MAX_VALUE
    self.currentTargetLayerInterfaceP = CollidableDestroyableDamageableLayer.getNullInstance()
    self.trackingWaypoint = false
    self.repeatedToLong = TimeDelayHelper.new(22000)
end


function UnitWaypointBehavior.new(associatedAdvancedRTSGameLayer, fakeWaypoint)
    local self = setmetatable(WaypointBehaviorBase.new(), UnitWaypointBehavior)
    self:_init_fields()
        self.associatedAdvancedRTSGameLayer = associatedAdvancedRTSGameLayer
        self.completeTimeDelayHelper = TimeDelayHelper.new(30000)
        self.targetList = BasicArrayListD.new()
        self.possibleTargetList = BasicArrayListD.new()
        self:setWaypointPathsList(BasicArrayListUtil.getInstance():getImmutableInstance())
        self.currentGeographicMapCellHistoryP = GeographicMapCellHistory.new()
        self.FAKE_WAYPOINT_LAYER = fakeWaypoint
    return self
end


function UnitWaypointBehavior:initRange(weaponRange)
        self.longWeaponRange = java_idiv(weaponRange, 2)
end


function UnitWaypointBehavior:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function UnitWaypointBehavior:onWaypointEvent(event)
        local advancedRTSGameLayer = event:getRtsLayer()
        self.associatedAdvancedRTSGameLayer.waypointLogHelperP:onWaypointEvent(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        if self.associatedAdvancedRTSGameLayer:isSelected() then
            self:addWaypointFromUser(advancedRTSGameLayer)
        elseif advancedRTSGameLayer:shouldAddWaypointFromBuilding() then
            self:addWaypointFromBuilding(advancedRTSGameLayer)
        end
end


-- throws Exception
function UnitWaypointBehavior:addWaypointFromUser(advancedRTSGameLayer)
end


-- throws Exception
function UnitWaypointBehavior:addWaypointFromBuilding(advancedRTSGameLayer)
        if advancedRTSGameLayer == PrimaryWaypointHelper.getInstance():getWaypointLayer() or advancedRTSGameLayer:getParentLayer() == self.associatedAdvancedRTSGameLayer:getParentLayer() then
            if not self.targetList:contains(advancedRTSGameLayer) then
                self.associatedAdvancedRTSGameLayer.waypointLogHelperP:addWaypointFromBuilding(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
                if advancedRTSGameLayer:isDestroyed() then
                    error(java_exception("Exception", "Trying to add a dead: " .. tostring(advancedRTSGameLayer)), 0)
                end
                self.targetList:add(advancedRTSGameLayer)
                self.associatedAdvancedRTSGameLayer.waypointLogHelperP:addWaypointFromBuildingList(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, self.targetList)
            end
        end
end


function UnitWaypointBehavior:isWaypointListEmptyOrOnlyTargets()
        return false
end


-- throws Exception
function UnitWaypointBehavior:insertWaypoint(index, rtsLayer)
        if self:canInsertWaypoint(index, rtsLayer) then
            self.associatedAdvancedRTSGameLayer.waypointLogHelperP:insertWaypoint(self.associatedAdvancedRTSGameLayer, index, rtsLayer, self:getName())
            if rtsLayer:isDestroyed() then
                error(java_exception("Exception", "Trying to add a dead: " .. tostring(rtsLayer)), 0)
            end
            self.targetList:addAt(index, rtsLayer)
            self.associatedAdvancedRTSGameLayer.waypointLogHelperP:insertWaypointList(self.associatedAdvancedRTSGameLayer, index, rtsLayer, self:getName(), self.targetList)
            return true
        end
        return false
end


function UnitWaypointBehavior:move()
        if self:isMoving() then
            self:setMovingFromStopped(false)
        else
            self:setMovingFromStopped(true)
        end
        self:setMoving(false)
end


-- throws Exception
function UnitWaypointBehavior:setRandomGeographicMapCellHistory(pathsList)
        local size = pathsList:size()
        self.associatedAdvancedRTSGameLayer.waypointLogHelperP:setRandomGeographicMapCellHistoryList(self.associatedAdvancedRTSGameLayer, pathsList)
        if size > 0 then
            local geographicMapCellPositionBasicArrayList = BasicArrayListUtil.getInstance():getRandom(pathsList)
            self:setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
        end
end


-- throws Exception
function UnitWaypointBehavior:setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
        self.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        if self.associatedAdvancedRTSGameLayer.showMoreCaptionStates then
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(UnitWaypointBehavior.PATHING, BasicColorFactory.getInstance().GREEN)
        end
        self.currentGeographicMapCellHistoryP:init()
        self.associatedAdvancedRTSGameLayer:init(self.currentGeographicMapCellHistoryP, geographicMapCellPositionBasicArrayList)
        self:setTrackingWaypoint(true)
        self:getCompleteTimeDelayHelper():setStartTimeTNT()
end


function UnitWaypointBehavior:canInsertWaypoint(index, rtsLayer)
        if self.targetList:size() > 4 then
        elseif self.targetList:contains(rtsLayer) then
        else
            return true
        end
        return false
end


-- throws Exception
function UnitWaypointBehavior:addBuildingChase(allbinaryLayer, cellPosition)
end


-- throws Exception
function UnitWaypointBehavior:moveAwayFromBuilding(buildingLayer)
        local geographicMapCellPosition = self.associatedAdvancedRTSGameLayer:getCurrentGeographicMapCellPosition()
        local list = buildingLayer.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        if list:contains(geographicMapCellPosition) then
            if self:insertWaypoint(0, self.FAKE_WAYPOINT_LAYER) then
                self.associatedAdvancedRTSGameLayer.waypointLogHelperP:moveAwayFromBuilding(self.associatedAdvancedRTSGameLayer)
                self:setCurrentTargetLayerInterface(self.FAKE_WAYPOINT_LAYER)
                local pathsList = buildingLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
                self.associatedAdvancedRTSGameLayer:setClosestGeographicMapCellHistory(pathsList)
            end
        end
end


function UnitWaypointBehavior:needToMove()
        self.associatedAdvancedRTSGameLayer.waypointLogHelperP:needToMove(self.associatedAdvancedRTSGameLayer, self)
        if self:isTrackingWaypoint() or self.sensorAction == SensorActionFactory.getInstance().EVADE or (self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() and self:getCurrentTargetDistance() >= self.longWeaponRange + self.currentTargetLayerInterfaceP:getHalfHeight()) then
            self.repeatedToLong:setStartTimeTNT()
            return true
        end
        if self.repeatedToLong:isTimeTNT() then
            local message = "Repeating too long: " .. tostring(self:getMovementLogicAsString())
            ForcedLogUtil.log(message, self.associatedAdvancedRTSGameLayer)
        end
        return false
end


function UnitWaypointBehavior:getMovementLogicAsString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("isTrackingWaypoint: ")
        stringBuffer:appendboolean(self:isTrackingWaypoint())
        stringBuffer:append(" sensorAction: ")
        stringBuffer:append(self.sensorAction.name)
        stringBuffer:append(" getCurrentTargetLayerInterface: ")
        stringBuffer:append(StringUtil.getInstance():toString(self.currentTargetLayerInterfaceP))
        if self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            stringBuffer:append(" Target Range: ")
            stringBuffer:appendint(self:getCurrentTargetDistance())
            stringBuffer:append(" >= ")
            stringBuffer:appendint(java_int(self.longWeaponRange + self.currentTargetLayerInterfaceP:getHalfHeight()))
        end
        return tostring(stringBuffer)
end


function UnitWaypointBehavior:isMovingFromStopped()
        return self.movingFromStopped
end


function UnitWaypointBehavior:setMovingFromStopped(movingFromStopped)
        self.movingFromStopped = movingFromStopped
end


function UnitWaypointBehavior:setWaypointPathsList(waypointPathsList)
        self.waypointPathsListP = waypointPathsList
end


function UnitWaypointBehavior:getWaypointPathsList()
        return self.waypointPathsListP
end


function UnitWaypointBehavior:isMoving()
        return self.moving
end


function UnitWaypointBehavior:setMoving(moving)
        self.moving = moving
end


function UnitWaypointBehavior:isTrackingWaypoint()
        return self.trackingWaypoint
end


function UnitWaypointBehavior:getPossibleTargetList()
        return self.possibleTargetList
end


function UnitWaypointBehavior:setLastPathGeographicMapCellPosition(lastPathGeographicMapCellPosition)
        self.lastPathGeographicMapCellPosition = lastPathGeographicMapCellPosition
end


function UnitWaypointBehavior:getLastPathGeographicMapCellPosition()
        return self.lastPathGeographicMapCellPosition
end


function UnitWaypointBehavior:setCurrentPathGeographicMapCellPosition(currentPathGeographicMapCellPosition)
        self.currentPathGeographicMapCellPosition = currentPathGeographicMapCellPosition
end


function UnitWaypointBehavior:getCurrentPathGeographicMapCellPosition()
        return self.currentPathGeographicMapCellPosition
end


function UnitWaypointBehavior:setSensorAction(sensorAction)
        self.sensorAction = sensorAction
end


function UnitWaypointBehavior:getSensorAction()
        return self.sensorAction
end


function UnitWaypointBehavior:setCurrentTargetLayerInterface(currentTargetLayerInterface)
        self.currentTargetLayerInterfaceP = currentTargetLayerInterface
end


function UnitWaypointBehavior:getCurrentTargetLayerInterface()
        return self.currentTargetLayerInterfaceP
end


function UnitWaypointBehavior:setCurrentTargetDistance(currentTargetDistance)
        self.currentTargetDistance = currentTargetDistance
end


function UnitWaypointBehavior:getCurrentTargetDistance()
        return self.currentTargetDistance
end


function UnitWaypointBehavior:getCompleteTimeDelayHelper()
        return self.completeTimeDelayHelper
end


function UnitWaypointBehavior:getCurrentGeographicMapCellHistory()
        return self.currentGeographicMapCellHistoryP
end


function UnitWaypointBehavior:setTrackingWaypoint(trackingWaypoint)
        self.trackingWaypoint = trackingWaypoint
end

UnitWaypointBehavior.PATHING = "Pathing"

return UnitWaypointBehavior


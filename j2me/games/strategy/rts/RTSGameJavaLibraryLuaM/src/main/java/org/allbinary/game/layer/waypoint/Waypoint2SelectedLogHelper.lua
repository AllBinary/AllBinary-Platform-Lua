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
-- package org.allbinary.game.layer.waypoint

local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointBehaviorBase = require("org.allbinary.game.layer.WaypointBehaviorBase")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Waypoint2LogHelper = require("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Waypoint2SelectedLogHelper = {}
Waypoint2SelectedLogHelper.__index = Waypoint2SelectedLogHelper
Waypoint2SelectedLogHelper.className = "Waypoint2SelectedLogHelper"
setmetatable(Waypoint2SelectedLogHelper, {__index = Waypoint2LogHelper})

function Waypoint2SelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.positionStrings = PositionStrings.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.ENEMY_POSSIBLE_TARGET = " Enemy Possible Target: "
    self.CLOSE_RANGE = "closeRange: "
    self.SENSOR_RANGE = " sensorRange: "
    self.ONLY_TARGETS = " Only Targets: "
    self.SHORTER_THAN_CURRENT_TARGET_DISTANCE = " isShorterThanCurrentTargetDistance: "
    self.CURRENT_TARGET_DESTROYED = " isCurrentTargetDestroyed: "
    self.CURRENT_TARGET_NOT_AVAILABLE = " isCurrentTargetNotAvailable: "
    self.PROCESS_POSSIBLE_TARGET = "selected: processPossibleTarget1"
end

function Waypoint2SelectedLogHelper.new()
    local self = setmetatable(Waypoint2LogHelper.new(), Waypoint2SelectedLogHelper)
    self:_init_fields()
    return self
end


function Waypoint2SelectedLogHelper.getInstance()
        return Waypoint2SelectedLogHelper.instanceC
end


function Waypoint2SelectedLogHelper:initRange(associatedAdvancedRTSGameLayer, closeRange, sensorRange)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.CLOSE_RANGE)
        stringBuffer:appendint(closeRange)
        stringBuffer:append(self.SENSOR_RANGE)
        stringBuffer:appendint(sensorRange)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: initRange")
end


function Waypoint2SelectedLogHelper:processPossibleTarget(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed)
        if waypointBehaviorBase:isWaypointListEmptyOrOnlyTargets() and waypointBehaviorBase:isInSensorRange(layerInterface, anotherTargetDistance) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
            stringBuffer:append(self.ONLY_TARGETS)
            stringBuffer:appendboolean(waypointBehaviorBase:isWaypointListEmptyOrOnlyTargets())
            stringBuffer:append(self.SHORTER_THAN_CURRENT_TARGET_DISTANCE)
            stringBuffer:appendboolean(isShorterThanCurrentTargetDistance)
            stringBuffer:append(self.CURRENT_TARGET_DESTROYED)
            stringBuffer:appendboolean(isCurrentTargetDestroyed)
            stringBuffer:append(self.CURRENT_TARGET_NOT_AVAILABLE)
            stringBuffer:appendboolean((waypointBehaviorBase:getCurrentTargetLayerInterface() == nil))
            self.logUtil:putF(tostring(stringBuffer), self, self.PROCESS_POSSIBLE_TARGET)
        end
end


function Waypoint2SelectedLogHelper:processSetTarget(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetingStateString())
        stringBuffer:append(self.ENEMY_POSSIBLE_TARGET)
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" anotherTargetDistance: ")
        stringBuffer:appendint(anotherTargetDistance)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processPossibleTarget2")
end


function Waypoint2SelectedLogHelper:processPossibleTargetCloser(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetingStateString())
        stringBuffer:append(self.ENEMY_POSSIBLE_TARGET)
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" anotherTargetDistance: ")
        stringBuffer:appendint(anotherTargetDistance)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processPossibleTarget3")
end


function Waypoint2SelectedLogHelper:setTarget(associatedAdvancedRTSGameLayer, waypointBehaviorBase, layerInterface, anotherTargetDistance)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointBehaviorBase:getName())
        stringBuffer:append(" targeting: ")
        stringBuffer:append(layerInterface:getName())
        stringBuffer:append(" at: ")
        stringBuffer:appendint(anotherTargetDistance)
        stringBuffer:append(" instead of: ")
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetingStateString())
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setTarget")
end


function Waypoint2SelectedLogHelper:setTargetPath(associatedAdvancedRTSGameLayer)
        self.logUtil:putF("Target Destroyed", self, "selected: setTargetPath")
end


function Waypoint2SelectedLogHelper:setTargetPathIgnoreNewPath(associatedAdvancedRTSGameLayer, waypointBehaviorBase)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Set Path To Target: ")
        stringBuffer:append(waypointBehaviorBase:getCurrentTargetLayerInterface():getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentTargetLayerInterface()))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setTargetPath")
end


function Waypoint2SelectedLogHelper:processWaypoint(associatedAdvancedRTSGameLayer, waypointBehaviorBase, targetLayer, size)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Size: ")
        stringBuffer:appendint(size)
        stringBuffer:append(" Waypoint: ")
        stringBuffer:append(targetLayer:getName())
        stringBuffer:append(" Target: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentTargetLayerInterface()))
        stringBuffer:append(" isTrackingWaypoint: ")
        stringBuffer:appendboolean(waypointBehaviorBase:isTrackingWaypoint())
        stringBuffer:append(" WaypointOverridesAttacking: ")
        stringBuffer:appendboolean(waypointBehaviorBase:isWaypointOverridesAttacking())
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processWaypoint")
end


function Waypoint2SelectedLogHelper:processWaypointTracked(associatedAdvancedRTSGameLayer, waypointBehaviorBase)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" currentPathGeographicMapCellPosition: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentPathGeographicMapCellPosition()))
        stringBuffer:append(" nextUnvisitedPathGeographicMapCellPosition: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()))
        stringBuffer:append(" Tracked: ")
        stringBuffer:append(self.stringUtil:toString(waypointBehaviorBase:getCurrentGeographicMapCellHistory():getTracked()))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processWaypoint")
end


function Waypoint2SelectedLogHelper:processWaypointTrackedVisit(associatedAdvancedRTSGameLayer, geographicMapCellPosition)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Visited: ")
        stringBuffer:append(self.stringUtil:toString(geographicMapCellPosition))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processWaypoint")
end


function Waypoint2SelectedLogHelper:processWaypointTrackedWithoutProgress(associatedAdvancedRTSGameLayer, reason)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(reason)), self, "turnTo")
end


function Waypoint2SelectedLogHelper:wander(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(associatedAdvancedRTSGameLayer:getName(), self, "wander")
end


function Waypoint2SelectedLogHelper:targetDestroyed(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Target Destroyed")), self, "selected: processTargeting")
end


function Waypoint2SelectedLogHelper:processTargeting(associatedAdvancedRTSGameLayer, dx, dy)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DX_LABEL)
        stringBuffer:appendint(dx)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DY_LABEL)
        stringBuffer:appendint(dy)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processTargeting")
end


function Waypoint2SelectedLogHelper:processTargetingNonWayPoint(associatedAdvancedRTSGameLayer, dx, dy)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Targeting Non Waypoint ")
        stringBuffer:append(self.positionStrings.DX_LABEL)
        stringBuffer:appendint(dx)
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(self.positionStrings.DY_LABEL)
        stringBuffer:appendint(dy)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: processTargeting")
end


function Waypoint2SelectedLogHelper:removeWaypoint(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, waypointLayer, reason)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(unitWaypointBehavior2:getName())
        stringBuffer:append(" remove: ")
        stringBuffer:append(waypointLayer:getName())
        stringBuffer:append(" because: ")
        stringBuffer:append(reason)
        self.logUtil:putF(tostring(stringBuffer), self, "selected: removeWaypoint")
end


function Waypoint2SelectedLogHelper:removeWaypointList(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, list)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(unitWaypointBehavior2:getName())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:append(self.stringUtil:toString(list))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: removeWaypoint")
end


function Waypoint2SelectedLogHelper:removeWaypointClear(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Clearing removed waypoint")), self, "selected: removeWaypoint")
end


function Waypoint2SelectedLogHelper:clearTarget(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Cleared Target")), self, "selected: clearTarget")
end


function Waypoint2SelectedLogHelper:addWaypointFromUser(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Adding Waypoint to Selected: ")
        stringBuffer:append(advancedRTSGameLayer:getName())
        if advancedRTSGameLayer:getParentLayer() ~= nil then
            stringBuffer:append(" With Parent: ")
            stringBuffer:append(advancedRTSGameLayer:getParentLayer():getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "selected: onWaypointEvent")
end


function Waypoint2SelectedLogHelper:targetMovedSoRetarget(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" - target moved so retargeting")), self, "turnTo")
end

Waypoint2SelectedLogHelper.instanceC = Waypoint2SelectedLogHelper.new()

return Waypoint2SelectedLogHelper


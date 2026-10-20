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

local J2MEUtil = require("org.allbinary.J2MEUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local SteeringVisitor = require("org.allbinary.game.layer.SteeringVisitor")
local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local MultipassWaypointPathRunnable = require("org.allbinary.game.layer.MultipassWaypointPathRunnable")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local WaypointPathRunnable = require("org.allbinary.game.layer.WaypointPathRunnable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointPathRunnableBase = require("org.allbinary.game.layer.WaypointPathRunnableBase")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local WaypointBase = require("org.allbinary.game.layer.waypoint.WaypointBase")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local NullUtil = require("org.allbinary.logic.NullUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local LayerDistanceUtil = require("org.allbinary.math.LayerDistanceUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local SimpleGeographicMapCellPositionFactory = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local PathFindingThreadPool = require("org.allbinary.thread.PathFindingThreadPool")
local ThreadPool = require("org.allbinary.thread.ThreadPool")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local UnitWaypointBehavior = require("org.allbinary.game.layer.unit.UnitWaypointBehavior")

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

local UnitWaypointBehavior2 = {}
UnitWaypointBehavior2.__index = UnitWaypointBehavior2
UnitWaypointBehavior2.className = "UnitWaypointBehavior2"
setmetatable(UnitWaypointBehavior2, {__index = UnitWaypointBehavior})
local BuildingSteeringVisitor = {}
    BuildingSteeringVisitor.__index = BuildingSteeringVisitor
    BuildingSteeringVisitor.className = "BuildingSteeringVisitor"
    setmetatable(BuildingSteeringVisitor, {__index = SteeringVisitor})
    UnitWaypointBehavior2.BuildingSteeringVisitor = BuildingSteeringVisitor

    function BuildingSteeringVisitor:_init_fields()
        self.positionList = BasicArrayListD.new()
    end

    function BuildingSteeringVisitor.new()
        local self = setmetatable(SteeringVisitor.new(), BuildingSteeringVisitor)
        self:_init_fields()
        return self
    end
    

    function UnitWaypointBehavior2:visit(anyType)
            local logUtil = LogUtil.getInstance()
            local try_ok, try_error = pcall(function()
                if self:getList():size() > 0 then
                    local allbinaryLayer = self:getList():get(0)
                    local cellPosition = self:getPositionList():get(0)
                    local clear = self:buildingChase(allbinaryLayer, cellPosition)
                    if clear then
                        self:getList():clear()
                        self.positionList:clear()
                        return NullUtil.getInstance().NULL_OBJECT
                    end
                    return BooleanFactory.getInstance().FALSE
                end
                return NullUtil.getInstance().NULL_OBJECT
            end)
            if not try_ok then
                local e = try_error
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, "visit", e)
                return NullUtil.getInstance().NULL_OBJECT
            end
    end
    

    function UnitWaypointBehavior2:getPositionList()
            return self.positionList
    end


function UnitWaypointBehavior2:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.unitWaypointStrings = UnitWaypointStrings.getInstance()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
    self.pathFindingThreadPool = PathFindingThreadPool.getInstance()
    self.progressTimeDelayHelper = nil
    self.wanderPathsList = nil
    self.waypointPathRunnable = nil
    self.sensorRange = 0
    self.closeRange = 0
    self.nextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.afterNextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.waitingOnTargetPath = false
    self.waitingOnWaypointPath = false
    self.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance()
    self.buildingSteeringVisitor = BuildingSteeringVisitor.new()
end


function UnitWaypointBehavior2.new(ownerAdvancedRTSGameLayer, fakeWaypoint)
    local self = setmetatable(UnitWaypointBehavior.new(ownerAdvancedRTSGameLayer, fakeWaypoint), UnitWaypointBehavior2)
    self:_init_fields()
        -- super(...) made self above
        self.progressTimeDelayHelper = TimeDelayHelper.new(5000)
        self.wanderPathsList = BasicArrayListD.new()
        local features = Features.getInstance()
        self.waypointPathRunnable = (function() if J2MEUtil.isHTML() then return MultipassWaypointPathRunnable.new() else return WaypointPathRunnable.new() end end)()
    return self
end


function UnitWaypointBehavior2:initRange(weaponRange)
        UnitWaypointBehavior.initRange(self, weaponRange)
        self.closeRange = weaponRange
        self.sensorRange = weaponRange * 4
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:initRange(self.associatedAdvancedRTSGameLayer, self.closeRange, self.sensorRange)
end


function UnitWaypointBehavior2:getNextUnvisitedPathGeographicMapCellPosition()
        return self.nextUnvisitedPathGeographicMapCellPosition
end


function UnitWaypointBehavior2:isRunning()
        if self.waypointPathRunnable:isRunning() then
            return true
        else
            return false
        end
end


-- throws Exception
function UnitWaypointBehavior2:processTick(allBinaryLayerManager)
        if self.waypointPathRunnable:isRunning() then
            if self.waypointPathsListP ~= UnitWaypointBehavior2.runningWaypointPathList then
                self.waypointPathRunnable:setRunning(false)
                if self.waitingOnTargetPath then
                    self:setTargetPath()
                elseif self.waitingOnWaypointPath then
                    self:setWaypointPath(self.waypointPathRunnable:getTargetLayer())
                else
                    error(java_exception("Exception", "Should not happen"), 0)
                end
            else
                return
            end
        end
        self:processTargetList()
        if not self.waypointPathRunnable:isRunning() then
            self:processWaypoint()
        else
            return
        end
        if not self.waypointPathRunnable:isRunning() then
            self:processTargeting()
        else
            return
        end
        if not self.waypointPathRunnable:isRunning() then
            self:teleportIfNoProgress()
        else
            return
        end
end


-- throws Exception
function UnitWaypointBehavior2:onEnemyMovement(layerInterface)
        local anotherTargetDistance = self.layerDistanceUtil:getDistance(self.associatedAdvancedRTSGameLayer, layerInterface)
        if layerInterface == self.currentTargetLayerInterfaceP then
            self:setCurrentTargetDistance(anotherTargetDistance)
        else
            self:processPossibleTarget(layerInterface, anotherTargetDistance)
        end
end


-- throws Exception
function UnitWaypointBehavior2:processPossibleTarget(layerInterface, anotherTargetDistance)
        local isShorterThanCurrentTargetDistance = self:getCurrentTargetDistance() > anotherTargetDistance
        local isCurrentTargetDestroyed = self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() and self.currentTargetLayerInterfaceP:isDestroyed()
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processPossibleTarget(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed)
        if self:isWaypointListEmptyOrOnlyTargets() and self:isInSensorRange(layerInterface, anotherTargetDistance) and (isShorterThanCurrentTargetDistance or isCurrentTargetDestroyed) then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processSetTarget(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance)
            self:setTarget(layerInterface, anotherTargetDistance)
        elseif self:isCloseRange(layerInterface, anotherTargetDistance) and (isShorterThanCurrentTargetDistance or isCurrentTargetDestroyed) then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processPossibleTargetCloser(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance)
            self:setTarget(layerInterface, anotherTargetDistance)
        end
end


-- throws Exception
function UnitWaypointBehavior2:teleportIfNoProgress()
        if self:isTrackingWaypoint() or self.associatedAdvancedRTSGameLayer:getParentLayer():isDestroyed() then
            if self.progressTimeDelayHelper:isTimeTNT() and self.nextUnvisitedPathGeographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION then
                self.associatedAdvancedRTSGameLayer:teleportTo(self.nextUnvisitedPathGeographicMapCellPosition)
            end
            if self:getCompleteTimeDelayHelper():isTimeTNT() then
                local geographicMapCellPosition = self.currentGeographicMapCellHistoryP:getTracked():get(self.currentGeographicMapCellHistoryP:getSize() - 1)
                self.associatedAdvancedRTSGameLayer:teleportTo(geographicMapCellPosition)
            end
        end
end


-- throws Exception
function UnitWaypointBehavior2:setTarget(layerInterface, anotherTargetDistance)
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:setTarget(self.associatedAdvancedRTSGameLayer, self, layerInterface, anotherTargetDistance)
        self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.TARGET, BasicColorFactory.getInstance().GREEN)
        self.associatedAdvancedRTSGameLayer:setLoad(0)
        self:setCurrentTargetDistance(anotherTargetDistance)
        self:setCurrentTargetLayerInterface(layerInterface)
        self:setTrackingWaypoint(false)
        self.targetList:clear()
        if not self:isCloseRange(layerInterface, anotherTargetDistance) and self:canInsertWaypoint(0, self.currentTargetLayerInterfaceP) then
            local geographicMapCellPosition = self.associatedAdvancedRTSGameLayer:getCurrentGeographicMapCellPosition()
            local pathFindingLayerInterface = (self.currentTargetLayerInterfaceP)
            local waypoint = pathFindingLayerInterface:getWaypointBehavior():getWaypoint()
            local list = waypoint:getPathsListFromCacheOnly(geographicMapCellPosition)
            self:setWaypointPathsList(list)
            if self.waypointPathsListP == nil then
                self.targetWithoutCachedPathLayerInterface = self.currentTargetLayerInterfaceP
            elseif self.waypointPathsListP:size() ~= 0 then
                self:setTargetPath()
            end
        end
end


-- throws Exception
function UnitWaypointBehavior2:setTargetPath()
        if self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            if self.currentTargetLayerInterfaceP:isDestroyed() then
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:setTargetPath(self.associatedAdvancedRTSGameLayer)
                self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.KILL, self.basicColorFactory.ORANGE)
                self:clearTarget()
                return
            end
            if self.currentTargetLayerInterfaceP == self.waypointPathRunnable:getTargetLayer() then
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:setTargetPathIgnoreNewPath(self.associatedAdvancedRTSGameLayer, self)
                self:insertWaypoint(0, self.currentTargetLayerInterfaceP)
                self:setRandomGeographicMapCellHistory(self.waypointPathsListP)
            end
        end
end


-- throws Exception
function UnitWaypointBehavior2:setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList)
        self:setCurrentPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
        self.nextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        UnitWaypointBehavior.setGeographicMapCellHistoryPath(self, geographicMapCellPositionBasicArrayList)
end


-- throws Exception
function UnitWaypointBehavior2:processWaypoint()
        local size = self.targetList:size()
        if size > 0 then
            local targetLayer = self.targetList:get(0)
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processWaypoint(self.associatedAdvancedRTSGameLayer, self, targetLayer, size)
            if targetLayer:isDestroyed() then
                self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.WAYPOINT_DESTROYED_SHORT, self.basicColorFactory.YELLOW)
                self:removeWaypoint(targetLayer, self.unitWaypointStrings.WAYPOINT_DESTROYED)
            else
                local geographicMapCellPosition = self.associatedAdvancedRTSGameLayer:getCurrentGeographicMapCellPosition()
                if self:isTrackingWaypoint() then
                    self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processWaypointTracked(self.associatedAdvancedRTSGameLayer, self)
                    if self:visitIfAtMidPoint(geographicMapCellPosition) then
                        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processWaypointTrackedVisit(self.associatedAdvancedRTSGameLayer, geographicMapCellPosition)
                    end
                    if self.currentGeographicMapCellHistoryP:isAllVisited2() and self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() then
                        local oldWaypointLayer = self.currentTargetLayerInterfaceP
                        oldWaypointLayer:getWaypointBehavior():getWaypoint():visit(self.associatedAdvancedRTSGameLayer)
                        self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.ALL_VISITED_SHORT, self.basicColorFactory.GREEN)
                        self:removeWaypoint(self.currentTargetLayerInterfaceP, self.unitWaypointStrings.ALL_VISITED)
                    end
                elseif self.currentTargetLayerInterfaceP == nil or self.waypointOverridesAttacking then
                    local list = targetLayer:getWaypointBehavior():getWaypoint():getPathsListFromCacheOnly(geographicMapCellPosition)
                    self:setWaypointPathsList(list)
                    if self.waypointPathsListP == nil then
                        self.waitingOnWaypointPath = true
                        self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.THINKING, self.basicColorFactory.GREEN)
                        self:runWaypointPathTask(targetLayer)
                        return
                    end
                    self:setWaypointPath(targetLayer)
                end
            end
        end
end


-- throws Exception
function UnitWaypointBehavior2:wander()
        if self.currentGeographicMapCellHistoryP:isAllVisited2() then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:wander(self.associatedAdvancedRTSGameLayer)
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.WANDERING, self.basicColorFactory.RED)
            self.wanderPathsList:clear()
            self.wanderPathsList:add(self.associatedAdvancedRTSGameLayer:getSurroundingGeographicMapCellPositionList())
            self:setRandomGeographicMapCellHistory(self.wanderPathsList)
        end
        self:visitIfAtMidPoint(self:getCurrentPathGeographicMapCellPosition())
        self:updateCurrentPathGeographicMapCellPosition()
        self.associatedAdvancedRTSGameLayer:trackTo(self.unitWaypointStrings.NEXT_PATH_NODE)
end


function UnitWaypointBehavior2:visitIfAtMidPoint(geographicMapCellPosition)
        local unitLayer = self.associatedAdvancedRTSGameLayer
        if geographicMapCellPosition ~= SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION and self.nextUnvisitedPathGeographicMapCellPosition == geographicMapCellPosition then
            local point = geographicMapCellPosition:getMidPoint()
            local afterNextPoint = self.afterNextUnvisitedPathGeographicMapCellPosition:getMidPoint()
            local beyondMidPoint = true
            if geographicMapCellPosition:getColumn() == self.afterNextUnvisitedPathGeographicMapCellPosition:getColumn() then
            elseif point:getX() < afterNextPoint:getX() then
                if unitLayer:getXP() + unitLayer:getHalfWidth() < point:getX() then
                    beyondMidPoint = false
                end
            else
                if unitLayer:getXP() + unitLayer:getHalfWidth() > point:getX() then
                    beyondMidPoint = false
                end
            end
            if geographicMapCellPosition:getRow() == self.afterNextUnvisitedPathGeographicMapCellPosition:getRow() then
            elseif point:getY() < afterNextPoint:getY() then
                if unitLayer:getYP() + unitLayer:getHalfHeight() < point:getY() then
                    beyondMidPoint = false
                end
            else
                if unitLayer:getYP() + unitLayer:getHalfHeight() > point:getY() then
                    beyondMidPoint = false
                end
            end
            if beyondMidPoint then
                return self.currentGeographicMapCellHistoryP:visit(geographicMapCellPosition)
            end
        end
        return false
end


-- throws Exception
function UnitWaypointBehavior2:processTargetList()
        self.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance()
        for index = self:getPossibleTargetList():size() - 1, 0, -1 do
            local layerInterface = self:getPossibleTargetList():get(index)
            if layerInterface:isDestroyed() then
                self:getPossibleTargetList():remove(layerInterface)
            else
                self:onEnemyMovement(layerInterface)
            end
        end
        if self.targetWithoutCachedPathLayerInterface ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            self.waitingOnTargetPath = true
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.THINKING_ABOUT_TARGET, self.basicColorFactory.GREEN)
            self:runWaypointPathTask(self.currentTargetLayerInterfaceP)
        end
        self:getPossibleTargetList():clear()
end


-- throws Exception
function UnitWaypointBehavior2:processTargeting()
        if self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() and (self:isInSensorRange(self.currentTargetLayerInterfaceP, self:getCurrentTargetDistance()) or self:isTrackingWaypoint()) then
            if self.currentTargetLayerInterfaceP:isDestroyed() then
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:targetDestroyed(self.associatedAdvancedRTSGameLayer)
                self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.KILL, self.basicColorFactory.ORANGE)
                self:clearTarget()
                return
            end
            local dx = 0
            local dy = 0
            if self:isTrackingWaypoint() then
                self:updateCurrentPathGeographicMapCellPosition()
                local point = self.nextUnvisitedPathGeographicMapCellPosition:getMidPoint()
                dx = self.associatedAdvancedRTSGameLayer:getXP() + self.associatedAdvancedRTSGameLayer:getHalfWidth() - point:getX()
                dy = self.associatedAdvancedRTSGameLayer:getYP() + self.associatedAdvancedRTSGameLayer:getHalfHeight() - point:getY()
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processTargeting(self.associatedAdvancedRTSGameLayer, dx, dy)
            else
                self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:processTargetingNonWayPoint(self.associatedAdvancedRTSGameLayer, dx, dy)
                dx = (self.associatedAdvancedRTSGameLayer:getXP() + self.associatedAdvancedRTSGameLayer:getHalfWidth()) - (self.currentTargetLayerInterfaceP:getXP() + self.currentTargetLayerInterfaceP:getHalfWidth())
                dy = (self.associatedAdvancedRTSGameLayer:getYP() + self.associatedAdvancedRTSGameLayer:getHalfHeight()) - (self.currentTargetLayerInterfaceP:getYP() + self.currentTargetLayerInterfaceP:getHalfHeight())
            end
            self.associatedAdvancedRTSGameLayer:trackToDXY(dx, dy)
        else
            if self.associatedAdvancedRTSGameLayer:getParentLayer():isDestroyed() then
                self:wander()
            else
                if self.associatedAdvancedRTSGameLayer.showMoreCaptionStates then
                    self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.STOP, self.basicColorFactory.YELLOW)
                end
                self.associatedAdvancedRTSGameLayer:allStop()
            end
        end
end


function UnitWaypointBehavior2:updateCurrentPathGeographicMapCellPosition()
        self:setLastPathGeographicMapCellPosition(self:getCurrentPathGeographicMapCellPosition())
        self:setCurrentPathGeographicMapCellPosition(self.nextUnvisitedPathGeographicMapCellPosition)
        self.nextUnvisitedPathGeographicMapCellPosition = self.currentGeographicMapCellHistoryP:getFirstUnvisited()
        self.afterNextUnvisitedPathGeographicMapCellPosition = self.currentGeographicMapCellHistoryP:getAfterIfNotLast(self.nextUnvisitedPathGeographicMapCellPosition)
        if self:getCurrentPathGeographicMapCellPosition() ~= self.nextUnvisitedPathGeographicMapCellPosition then
            self.progressTimeDelayHelper:setStartTimeTNT()
        end
end


-- throws Exception
function UnitWaypointBehavior2:setWaypointPath(waypointLayer)
        if self.waypointPathsListP:size() ~= 0 then
            self:setCurrentTargetLayerInterface(waypointLayer)
            local MAX = Integer.MAX_VALUE
            self:setCurrentTargetDistance(MAX)
            self:setRandomGeographicMapCellHistory(self.waypointPathsListP)
        else
            waypointLayer:getWaypointBehavior():getWaypoint():visit(self.associatedAdvancedRTSGameLayer)
            self.associatedAdvancedRTSGameLayer:getCaptionAnimationHelper():update(self.unitWaypointStrings.ALREADY_THERE_SHORT, self.basicColorFactory.YELLOW)
            self:removeWaypoint(waypointLayer, self.unitWaypointStrings.ALREADY_THERE)
        end
end


-- throws Exception
function UnitWaypointBehavior2:runWaypointPathTask(waypointLayer)
        self:setWaypointPathsList(UnitWaypointBehavior2.runningWaypointPathList)
        if self.waypointPathRunnable:isRunning() then
            error(java_exception("Exception", "Should never be running here"), 0)
        end
        self.waypointPathRunnable:setRunning(true)
        self.waypointPathRunnable:setUnitLayer(self.associatedAdvancedRTSGameLayer)
        self.waypointPathRunnable:setTargetLayer(waypointLayer)
        self.pathFindingThreadPool:runTask(self.waypointPathRunnable)
end


-- throws Exception
function UnitWaypointBehavior2:removeWaypoint(waypointLayer, reason)
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:removeWaypoint(self.associatedAdvancedRTSGameLayer, self, waypointLayer, reason)
        self.targetList:remove(waypointLayer)
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:removeWaypointList(self.associatedAdvancedRTSGameLayer, self, self.targetList)
        if self.currentTargetLayerInterfaceP == waypointLayer then
            self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:removeWaypointClear(self.associatedAdvancedRTSGameLayer)
            self:clearTarget()
        end
end


-- throws Exception
function UnitWaypointBehavior2:clearTarget()
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:clearTarget(self.associatedAdvancedRTSGameLayer)
        self:setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer.getNullInstance())
        self:setTrackingWaypoint(false)
        local MAX = Integer.MAX_VALUE
        self:setCurrentTargetDistance(MAX)
        TrackingEventHandler.getInstance():fireEvent(self.associatedAdvancedRTSGameLayer:getTrackingEvent())
end


function UnitWaypointBehavior2:isWaypointListEmptyOrOnlyTargets()
        local list = self.targetList
        if list:size() == 0 then
            return true
        end
        for index = list:size() - 1, 0, -1 do
            local layerInterface = list:get(index)
            if layerInterface:isWaypointListEmptyOrOnlyTargets() then
                return false
            end
        end
        return true
end


function UnitWaypointBehavior2:isCloseRange(layerInterface, targetDistance)
        return targetDistance < self.closeRange + layerInterface:getHalfHeight()
end


function UnitWaypointBehavior2:isInSensorRange(layerInterface, targetDistance)
        return targetDistance < self.sensorRange + layerInterface:getHalfHeight()
end


function UnitWaypointBehavior2:getCurrentTargetingStateString()
        local stringBuffer = StringMaker.new()
        if self.currentTargetLayerInterfaceP ~= CollidableDestroyableDamageableLayer.getNullInstance() then
            stringBuffer:append(UnitWaypointBehavior2.TARGET_LAYER)
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:append(self.currentTargetLayerInterfaceP:getName())
            stringBuffer:append(" with ")
            stringBuffer:append(UnitWaypointBehavior2.TARGET_DISTANCE)
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:appendint(java_int(self:getCurrentTargetDistance()))
        end
        return tostring(stringBuffer)
end


-- throws Exception
function UnitWaypointBehavior2:addWaypointFromUser(advancedRTSGameLayer)
        if advancedRTSGameLayer:isDestroyed() then
            error(java_exception("Exception", "Trying to add a dead: " .. tostring(advancedRTSGameLayer)), 0)
        end
        self.associatedAdvancedRTSGameLayer.waypoint2LogHelperP:addWaypointFromUser(self.associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        self.targetList:clear()
        self.targetList:add(advancedRTSGameLayer)
        self:clearTarget()
end


-- throws Exception
function UnitWaypointBehavior2:addBuildingChase(allbinaryLayer, cellPosition)
        if not self.buildingSteeringVisitor:getList():contains(allbinaryLayer) then
            self.buildingSteeringVisitor:getList():add(allbinaryLayer)
            self.buildingSteeringVisitor:getPositionList():add(cellPosition)
        end
        if not self:getSteeringVisitorList():contains(self.buildingSteeringVisitor) then
            self:getSteeringVisitorList():add(self.buildingSteeringVisitor)
        end
end


-- throws Exception
function UnitWaypointBehavior2:buildingChase(allbinaryLayer, cellPosition)
        return self.associatedAdvancedRTSGameLayer:buildingChase(allbinaryLayer, cellPosition)
end

UnitWaypointBehavior2.runningWaypointPathList = BasicArrayListD.new()
UnitWaypointBehavior2.TARGET_DISTANCE = "Target Distance"
UnitWaypointBehavior2.TARGET_LAYER = "Target Layer"

return UnitWaypointBehavior2


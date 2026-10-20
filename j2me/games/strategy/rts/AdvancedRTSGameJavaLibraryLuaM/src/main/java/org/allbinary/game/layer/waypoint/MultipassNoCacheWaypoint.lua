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
-- package org.allbinary.game.layer.waypoint

local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local BuildingEventListenerInterface = require("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local UnitWaypointBehavior = require("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local PathFindingInfoFactory = require("org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local Sound = require("org.allbinary.media.audio.Sound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local CustomMapGenerator = require("org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator")
local RaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")
local MultipassState = require("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local PathGenerator = require("org.allbinary.media.graphics.geography.pathfinding.PathGenerator")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local WaypointBase = require("org.allbinary.game.layer.waypoint.WaypointBase")

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

local MultipassNoCacheWaypoint = {}
MultipassNoCacheWaypoint.__index = MultipassNoCacheWaypoint
MultipassNoCacheWaypoint.className = "MultipassNoCacheWaypoint"
setmetatable(MultipassNoCacheWaypoint, {__index = WaypointBase})

function MultipassNoCacheWaypoint:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.ownerLayer = nil
end


function MultipassNoCacheWaypoint.new(ownerLayer, sound)
    local self = setmetatable(WaypointBase.new(sound), MultipassNoCacheWaypoint)
    self:_init_fields()
        -- super(...) made self above
        self.ownerLayer = ownerLayer
    return self
end


-- throws Exception
function MultipassNoCacheWaypoint:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        WaypointBase.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
end


function MultipassNoCacheWaypoint:releaseCachedPaths()
end


-- throws Exception
function MultipassNoCacheWaypoint:getPathFindingInfo(geographicMapCellPosition)
        local startGeographicMapCellPosition = geographicMapCellPosition
        local endGeographicMapCellPosition = self:getEndGeographicMapCellPosition(startGeographicMapCellPosition)
        if endGeographicMapCellPosition == nil then
            return PathFindingInfo.NULL_PATH_FINDING_INFO
        end
        if startGeographicMapCellPosition == endGeographicMapCellPosition then
            if self.ownerLayer:shouldHandleStartSameAsEnd() then
                return PathFindingInfo.NULL_PATH_FINDING_INFO
            else
                error(java_exception("Exception", "Start should not be End: " .. tostring(endGeographicMapCellPosition)), 0)
            end
        end
        local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local raceTrackGeographicMap = geographicMapInterface
        local raceTrackGeographicMapCellTypeFactory = raceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local customMapGenerator = raceTrackGeographicMap:getCustomMapGenerator()
        customMapGenerator:copyMapIntoCustomMap()
        local customMapArray = customMapGenerator:getCustomMapArray()
        customMapArray[startGeographicMapCellPosition:getRow() + 1][startGeographicMapCellPosition:getColumn() + 1] = raceTrackGeographicMapCellTypeFactory:getStartType()
        customMapArray[endGeographicMapCellPosition:getRow() + 1][endGeographicMapCellPosition:getColumn() + 1] = raceTrackGeographicMapCellTypeFactory:getEndType()
        local pathFindingInfo = PathFindingInfoFactory.getInstance():getInstancePathFindingInfo(raceTrackGeographicMap, customMapArray)
        return pathFindingInfo
end


-- throws Exception
function MultipassNoCacheWaypoint:getPathsList(geographicMapCellPosition, pathFindingInfo, multipassState)
        local try_ok, try_error = pcall(function()
            if pathFindingInfo == nil then
                self.logUtil:putF("pathFindingInfo: " .. tostring(pathFindingInfo), self, "getPathsList")
                return BasicArrayListUtil.getInstance():getImmutableInstance()
            end
            local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            local list = PathGenerator.getInstance():createN(geographicMapInterface, pathFindingInfo, 2, multipassState)
            if list ~= nil and list ~= BasicArrayListUtil.getInstance():getImmutableInstance() then
                if list:size() < 1 then
                    error(java_exception("Exception", "Path may have been cleared by clearing caching"), 0)
                end
                return list
            end
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "getPathsList", e)
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end
end


-- throws Exception
function MultipassNoCacheWaypoint:getEndGeographicMapCellPosition(startGeographicMapCellPosition)
        local endList = self.ownerLayer:getEndGeographicMapCellPositionList()
        local endGeographicMapCellPosition = BasicArrayListUtil.getInstance():getRandom(endList)
        if startGeographicMapCellPosition == endGeographicMapCellPosition then
            for index = endList:size() - 1, 0, -1 do
                endGeographicMapCellPosition = endList:get(index)
                if startGeographicMapCellPosition ~= endGeographicMapCellPosition then
                    break
                end
            end
        end
        return endGeographicMapCellPosition
end


function MultipassNoCacheWaypoint:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function MultipassNoCacheWaypoint:onBuildingEvent(event)
end


function MultipassNoCacheWaypoint:reset()
        self:getConnectedWaypointList():clear()
end


-- throws Exception
function MultipassNoCacheWaypoint:visit(unitLayer)
        if unitLayer:getGroupInterface()[1] ~= self.ownerLayer:getGroupInterface()[1] then
            return
        end
        local size = self:getConnectedWaypointList():size()
        if size > 0 then
            local unitWaypointBehavior = unitLayer:getWaypointBehavior()
            while self:getConnectedWaypointList():size() > 0 do
                local rtsLayer = self:getConnectedWaypointList():get(0)
                if rtsLayer:isDestroyed() then
                    self:getConnectedWaypointList():remove(rtsLayer)
                else
                    unitLayer:handleCost(self.ownerLayer)
                    unitWaypointBehavior:insertWaypoint(0, rtsLayer)
                    break
                end
            end
        end
end

return MultipassNoCacheWaypoint


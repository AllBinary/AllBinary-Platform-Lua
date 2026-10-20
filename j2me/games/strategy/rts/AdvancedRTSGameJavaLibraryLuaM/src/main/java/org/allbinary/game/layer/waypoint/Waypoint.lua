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
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local BuildingEventListenerInterface = require("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local UnitWaypointBehavior = require("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local PathFindingInfoFactory = require("org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local Sound = require("org.allbinary.media.audio.Sound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local CustomMapGenerator = require("org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator")
local RaceTrackGeographicMap = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")
local BasicGeographicMapExtractedPathsCacheFactory = require("org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapExtractedPathsCacheFactory")
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

local Waypoint = {}
Waypoint.__index = Waypoint
Waypoint.className = "Waypoint"
setmetatable(Waypoint, {__index = WaypointBase})

function Waypoint:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.ownerLayer = nil
    self.endList = self.basicArrayListUtil:getImmutableInstance()
    self.paths = self.basicArrayListUtil.NULL_ARRAY_OF_ARRAY
end


function Waypoint.new(ownerLayer, sound)
    local self = setmetatable(WaypointBase.new(sound), Waypoint)
    self:_init_fields()
        -- super(...) made self above
        self.ownerLayer = ownerLayer
    return self
end


-- throws Exception
function Waypoint:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        WaypointBase.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        if self.paths ~= self.basicArrayListUtil.NULL_ARRAY_OF_ARRAY then
            error(java_exception("RuntimeException"), 0)
        end
        self.endList = self.ownerLayer:getEndGeographicMapCellPositionList()
        self.paths = java_new_array(nil, tiledLayer:getColumns(), tiledLayer:getRows())
        self:clearPaths()
end


function Waypoint:releaseCachedPaths()
        do
            local columnIndex = (self.paths.n or #self.paths)
            while (function() columnIndex = columnIndex - 1 return columnIndex end)() >= 0 do
            do
                local rowIndex = (self.paths.n or #self.paths)
                while (function() rowIndex = rowIndex - 1 return rowIndex end)() >= 0 do
                local pathsList = self.paths[columnIndex + 1][rowIndex + 1]
                if pathsList ~= self.basicArrayListUtil:getImmutableInstance() then
                    BasicGeographicMapExtractedPathsCacheFactory.getInstance():release(pathsList)
                end
                end
            end
            end
        end
end


-- throws Exception
function Waypoint:getPathsListFromCacheOnly(geographicMapCellPosition)
        return self.paths[geographicMapCellPosition:getColumn() + 1][geographicMapCellPosition:getRow() + 1]
end


-- throws Exception
function Waypoint:getPathsListRunnable(geographicMapCellPosition)
        local pathsList = self.paths[geographicMapCellPosition:getColumn() + 1][geographicMapCellPosition:getRow() + 1]
        if pathsList == self.basicArrayListUtil:getImmutableInstance() then
            pathsList = self:createPaths(geographicMapCellPosition)
            self.paths[geographicMapCellPosition:getColumn() + 1][geographicMapCellPosition:getRow() + 1] = pathsList
        end
        return pathsList
end


function Waypoint:getEndGeographicMapCellPosition(startGeographicMapCellPosition)
        local endGeographicMapCellPosition = self.basicArrayListUtil:getRandom(self.endList)
        if startGeographicMapCellPosition == endGeographicMapCellPosition then
            for index = self.endList:size() - 1, 0, -1 do
                endGeographicMapCellPosition = self.endList:get(index)
                if startGeographicMapCellPosition ~= endGeographicMapCellPosition then
                    break
                end
            end
        end
        return endGeographicMapCellPosition
end


-- throws Exception
function Waypoint:createPaths(startGeographicMapCellPosition)
        if self.endList:size() == 0 then
            return self.basicArrayListUtil:getImmutableInstance()
        end
        local endGeographicMapCellPosition = self:getEndGeographicMapCellPosition(startGeographicMapCellPosition)
        if endGeographicMapCellPosition == nil then
            return self.basicArrayListUtil:getImmutableInstance()
        end
        if startGeographicMapCellPosition == endGeographicMapCellPosition then
            if self.ownerLayer:shouldHandleStartSameAsEnd() then
                return self.basicArrayListUtil:getImmutableInstance()
            else
                error(java_exception("Exception", "Start should not be End: " .. tostring(self.endList:size())), 0)
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
        local list = PathGenerator.getInstance():getInstanceNoCache(geographicMapInterface, pathFindingInfo, 2)
        if list:size() < 1 then
            error(java_exception("Exception", "Path may have been cleared by clearing caching"), 0)
        end
        return list
end


function Waypoint:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function Waypoint:onBuildingEvent(event)
        self:clearPaths()
end


function Waypoint:clearPaths()
        do
            local columnIndex = (self.paths.n or #self.paths)
            while (function() columnIndex = columnIndex - 1 return columnIndex end)() >= 0 do
            do
                local rowIndex = (self.paths.n or #self.paths)
                while (function() rowIndex = rowIndex - 1 return rowIndex end)() >= 0 do
                self.paths[columnIndex + 1][rowIndex + 1] = self.basicArrayListUtil:getImmutableInstance()
                end
            end
            end
        end
end


function Waypoint:reset()
        self:getConnectedWaypointList():clear()
        self:releaseCachedPaths()
end


-- throws Exception
function Waypoint:visit(unitLayer)
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

return Waypoint


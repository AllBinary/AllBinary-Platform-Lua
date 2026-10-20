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
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local WaypointLogHelper = require("org.allbinary.game.layer.waypoint.WaypointLogHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointSelectedLogHelper = {}
WaypointSelectedLogHelper.__index = WaypointSelectedLogHelper
WaypointSelectedLogHelper.className = "WaypointSelectedLogHelper"
setmetatable(WaypointSelectedLogHelper, {__index = WaypointLogHelper})

function WaypointSelectedLogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.stringUtil = StringUtil.getInstance()
end

function WaypointSelectedLogHelper.new()
    local self = setmetatable(WaypointLogHelper.new(), WaypointSelectedLogHelper)
    self:_init_fields()
    return self
end


function WaypointSelectedLogHelper.getInstance()
        return WaypointSelectedLogHelper.instanceC
end


function WaypointSelectedLogHelper:onWaypointEvent(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" onWaypointEvent: ")
        stringBuffer:append(advancedRTSGameLayer:getName())
        if advancedRTSGameLayer:getParentLayer() ~= nil then
            stringBuffer:append(" With Parent: ")
            stringBuffer:append(advancedRTSGameLayer:getParentLayer():getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "onWaypointEvent")
end


function WaypointSelectedLogHelper:addWaypointFromBuilding(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Adding Waypoint: ")
        stringBuffer:append(advancedRTSGameLayer:getName())
        if advancedRTSGameLayer:getParentLayer() ~= nil then
            stringBuffer:append(" With Parent: ")
            stringBuffer:append(advancedRTSGameLayer:getParentLayer():getName())
        end
        self.logUtil:putF(tostring(stringBuffer), self, "selected: onWaypointEvent")
end


function WaypointSelectedLogHelper:addWaypointFromBuildingList(associatedAdvancedRTSGameLayer, advancedRTSGameLayer, list)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:append(self.stringUtil:toString(list))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: onWaypointEvent")
end


function WaypointSelectedLogHelper:insertWaypoint(associatedAdvancedRTSGameLayer, index, rtsLayer, waypointName)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointName)
        stringBuffer:append(" Insert: ")
        stringBuffer:append(rtsLayer:getName())
        stringBuffer:append(" for Waypoint: ")
        self.logUtil:putF(tostring(stringBuffer), self, "selected: insertWaypoint")
end


function WaypointSelectedLogHelper:insertWaypointList(associatedAdvancedRTSGameLayer, index, rtsLayer, waypointName, list)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(waypointName)
        stringBuffer:append(" Insert: ")
        stringBuffer:append(rtsLayer:getName())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:append(self.stringUtil:toString(list))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: insertWaypoint")
end


function WaypointSelectedLogHelper:setRandomGeographicMapCellHistoryList(associatedAdvancedRTSGameLayer, pathsList)
        local size = pathsList:size()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(associatedAdvancedRTSGameLayer:getName())
        stringBuffer:append(self.commonSeps.SPACE)
        stringBuffer:append(CommonLabels.getInstance().START)
        stringBuffer:appendint(size)
        stringBuffer:append(" -> ")
        stringBuffer:append(self.stringUtil:toString(pathsList))
        self.logUtil:putF(tostring(stringBuffer), self, "selected: setRandomGeographicMapCellHistory")
end


function WaypointSelectedLogHelper:moveAwayFromBuilding(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" Trying to move away from building")), self, "selected: moveAwayFromBuilding")
end


function WaypointSelectedLogHelper:needToMove(associatedAdvancedRTSGameLayer, unitWaypointBehavior)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(unitWaypointBehavior:getMovementLogicAsString())), self, "needToMove")
end


function WaypointSelectedLogHelper:setRandomGeographicMapCellHistory(associatedAdvancedRTSGameLayer)
        self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" pathsList is null")), self, "setRandomGeographicMapCellHistory")
end


function WaypointSelectedLogHelper:setCurrentPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer, existingCurrentPathGeographicMapCellPosition, currentPathGeographicMapCellPosition)
        if existingCurrentPathGeographicMapCellPosition == nil then
            self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" currentPathGeographicMapCellPosition: "):append(self.stringUtil:toString(currentPathGeographicMapCellPosition))), self, "setCurrentPathGeographicMapCellPosition")
        end
end


function WaypointSelectedLogHelper:setNextUnvisitedPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer, existingNextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition)
        if existingNextUnvisitedPathGeographicMapCellPosition ~= nextUnvisitedPathGeographicMapCellPosition then
            self.logUtil:putF(tostring(StringMaker.new():append(associatedAdvancedRTSGameLayer:getName()):append(" nextUnvisitedPathGeographicMapCellPosition: "):append(self.stringUtil:toString(nextUnvisitedPathGeographicMapCellPosition))), self, "setNextUnvisitedPathGeographicMapCellPosition")
        end
end

WaypointSelectedLogHelper.instanceC = WaypointSelectedLogHelper.new()

return WaypointSelectedLogHelper


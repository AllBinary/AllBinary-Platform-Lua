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
-- package org.allbinary.game.input.form

local AdvancedRTSGameLayer = require("org.allbinary.game.layer.AdvancedRTSGameLayer")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local UnitLayer = require("org.allbinary.game.layer.unit.UnitLayer")
local UnitWaypointBehavior = require("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AssignWaypointsUtil = {}
AssignWaypointsUtil.__index = AssignWaypointsUtil
AssignWaypointsUtil.className = "AssignWaypointsUtil"

function AssignWaypointsUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.WAYPOINT_EVENT = RTSLayerEvent.new(NullPathFindingLayer.NULL_PATH_FINDING_LAYER)
end

function AssignWaypointsUtil.new()
    local self = setmetatable({}, AssignWaypointsUtil)
    self:_init_fields()
    return self
end


function AssignWaypointsUtil.getInstance()
        return AssignWaypointsUtil.instance
end


function AssignWaypointsUtil:set(unitLayer, ownerAdvancedRTSGameLayer)
        local try_ok, try_error = pcall(function()
            local list = ownerAdvancedRTSGameLayer:getWaypointBehavior():getOwnedWaypointList()
            local unitWaypointBehavior = unitLayer:getWaypointBehavior()
            for index = list:size() - 1, 0, -1 do
                local waypointLayer = list:get(index)
                self.WAYPOINT_EVENT:setRtsLayer(waypointLayer)
                unitWaypointBehavior:onWaypointEvent(self.WAYPOINT_EVENT)
            end
            local waypointLayer = PrimaryWaypointHelper.getInstance():getWaypointLayer()
            if waypointLayer ~= NullPathFindingLayer.NULL_PATH_FINDING_LAYER then
                self.WAYPOINT_EVENT:setRtsLayer(waypointLayer)
                unitWaypointBehavior:onWaypointEvent(self.WAYPOINT_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "set", e)
        end
end

AssignWaypointsUtil.instance = AssignWaypointsUtil.new()

return AssignWaypointsUtil


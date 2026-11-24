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

local AssignWaypointsUtil = {}
package.loaded["org.allbinary.game.input.form.AssignWaypointsUtil"] = AssignWaypointsUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local UnitLayer = java_lazy("org.allbinary.game.layer.unit.UnitLayer")
local UnitWaypointBehavior = java_lazy("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PrimaryWaypointHelper = java_lazy("org.allbinary.game.input.form.PrimaryWaypointHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AssignWaypointsUtil is declared before the requires
AssignWaypointsUtil.__index = AssignWaypointsUtil
AssignWaypointsUtil.className = "AssignWaypointsUtil"
AssignWaypointsUtil.javaClassName = "org.allbinary.game.input.form.AssignWaypointsUtil"

function AssignWaypointsUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.WAYPOINT_EVENT = RTSLayerEvent.new(NullPathFindingLayer.NULL_PATH_FINDING_LAYER)
end

function AssignWaypointsUtil._jinit(self)
    AssignWaypointsUtil._init_fields(self)
    return self
end

function AssignWaypointsUtil.new()
    return AssignWaypointsUtil._jinit(setmetatable({}, AssignWaypointsUtil))
end


function AssignWaypointsUtil.getInstance()
        return AssignWaypointsUtil.instance_f
end


function AssignWaypointsUtil:set(unitLayer, ownerAdvancedRTSGameLayer)
        local try_ok, try_error, try_value = pcall(function()
            local list = ownerAdvancedRTSGameLayer:getWaypointBehavior():getOwnedWaypointList()
            local unitWaypointBehavior = unitLayer:getWaypointBehavior()
            for index = list:size() - 1, 0, -1 do
                local ownedWaypointLayer = list:get(index)
                self.WAYPOINT_EVENT:setRtsLayer(ownedWaypointLayer)
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "set", e)
        end
end

AssignWaypointsUtil.instance_f = AssignWaypointsUtil.new()

return AssignWaypointsUtil


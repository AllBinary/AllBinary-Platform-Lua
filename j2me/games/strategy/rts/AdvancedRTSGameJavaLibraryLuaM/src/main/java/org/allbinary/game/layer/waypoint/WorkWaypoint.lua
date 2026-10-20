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

local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local GeologicalGeographicMapCellPosition = require("org.allbinary.game.layer.geological.resources.GeologicalGeographicMapCellPosition")
local GeologicalResource = require("org.allbinary.game.layer.geological.resources.GeologicalResource")
local UnitLayer = require("org.allbinary.game.layer.unit.UnitLayer")
local UnitWaypointBehavior = require("org.allbinary.game.layer.unit.UnitWaypointBehavior")
local WorkSound = require("org.allbinary.media.audio.WorkSound")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local Waypoint = require("org.allbinary.game.layer.waypoint.Waypoint")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WorkWaypoint = {}
WorkWaypoint.__index = WorkWaypoint
WorkWaypoint.className = "WorkWaypoint"
setmetatable(WorkWaypoint, {__index = Waypoint})


function WorkWaypoint.new(ownerLayer)
    local self = setmetatable(Waypoint.new(ownerLayer, WorkSound.getInstance()), WorkWaypoint)
        -- super(...) made self above
    return self
end


-- throws Exception
function WorkWaypoint:visit(unitLayer)
        if unitLayer:getGroupInterface()[1] ~= self.ownerLayer:getGroupInterface()[1] then
            return
        end
        local size = self:getConnectedWaypointList():size()
        if size > 0 then
            local occupyList = self.ownerLayer:getGeographicMapCellPositionArea():getOccupyingGeographicMapCellPositionList()
            local outOfResources = true
            local geologicalGeographicMapCellPosition = nil
            local geologicalResource = nil
            do
                local index = occupyList:size()
                while (function() index = index - 1 return index end)() >= 0 do
                geologicalGeographicMapCellPosition = occupyList:get(index)
                geologicalResource = geologicalGeographicMapCellPosition:getGeologicalResource()
                if geologicalResource:getTotal() >= 1 then
                    outOfResources = false
                    local maxResourceLoad = java_int(unitLayer:getMaxResourceLoad())
                    geologicalResource:remove(maxResourceLoad)
                    unitLayer:setLoad(maxResourceLoad)
                end
                end
            end
            local waypointInfoHudPaintable = self.ownerLayer:getHudPaintable()
            if self.ownerLayer == waypointInfoHudPaintable:getRtsLayer() then
                waypointInfoHudPaintable:updateSelectionInfo()
            end
            if not outOfResources then
                local unitWaypointBehavior = unitLayer:getWaypointBehavior()
                local rtsLayer = nil
                while self:getConnectedWaypointList():size() > 0 do
                    rtsLayer = self:getConnectedWaypointList():get(0)
                    if rtsLayer:isDestroyed() then
                        self:getConnectedWaypointList():remove(rtsLayer)
                    else
                        unitWaypointBehavior:insertWaypoint(0, rtsLayer)
                        break
                    end
                end
            end
        end
end


function WorkWaypoint:getType()
        return 2
end

WorkWaypoint.ID = SmallIntegerSingletonFactory.getInstance():getAt(25)

return WorkWaypoint


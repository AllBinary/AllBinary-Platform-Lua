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
-- package org.allbinary.game.layer

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LayerDistanceUtil = require("org.allbinary.math.LayerDistanceUtil")
local PriorityRunnable = require("org.allbinary.thread.PriorityRunnable")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointPathRunnableBase = {}
WaypointPathRunnableBase.__index = WaypointPathRunnableBase
WaypointPathRunnableBase.className = "WaypointPathRunnableBase"

function WaypointPathRunnableBase:_init_fields()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
    self.pathFindingLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.targetPathFindingLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.priorityP = Integer.MAX_VALUE
    self.runningP = false
end

function WaypointPathRunnableBase.new()
    local self = setmetatable({}, WaypointPathRunnableBase)
    self:_init_fields()
    return self
end


function WaypointPathRunnableBase:isRunning()
        return self.runningP
end


function WaypointPathRunnableBase:setRunning(isRunning)
        self.runningP = isRunning
end


-- throws Exception
function WaypointPathRunnableBase:setThread(thread)
end


function WaypointPathRunnableBase:setTargetLayer(waypointLayer)
        self.targetPathFindingLayer = waypointLayer
        self:setPriority()
end


function WaypointPathRunnableBase:setPriority()
        local pathFindingLayer = self.pathFindingLayer
        local targetLayer = self.targetPathFindingLayer
        if targetLayer ~= nil then
            local distance = self.layerDistanceUtil:getDistance(targetLayer, pathFindingLayer)
            local distanceCategory = java_idiv(distance, 70)
            self.priorityP = distanceCategory
        end
end


function WaypointPathRunnableBase:getTargetLayer()
        return self.targetPathFindingLayer
end


function WaypointPathRunnableBase:setUnitLayer(unitLayer)
        self.pathFindingLayer = unitLayer
end


function WaypointPathRunnableBase:getPriority()
        return self.priorityP
end


function WaypointPathRunnableBase:isDone()
        return true
end


function WaypointPathRunnableBase:run()
end


function WaypointPathRunnableBase:reset()
end

return WaypointPathRunnableBase


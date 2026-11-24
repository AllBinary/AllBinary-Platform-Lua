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

local WaypointPathRunnableBase = {}
package.loaded["org.allbinary.game.layer.WaypointPathRunnableBase"] = WaypointPathRunnableBase

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

local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LayerDistanceUtil = java_lazy("org.allbinary.math.LayerDistanceUtil")
local PriorityRunnable = java_lazy("org.allbinary.thread.PriorityRunnable")
local RunnableInterface = java_lazy("org.allbinary.thread.RunnableInterface")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")

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

-- class table WaypointPathRunnableBase is declared before the requires
WaypointPathRunnableBase.__index = WaypointPathRunnableBase
WaypointPathRunnableBase.className = "WaypointPathRunnableBase"
WaypointPathRunnableBase.javaClassName = "org.allbinary.game.layer.WaypointPathRunnableBase"
WaypointPathRunnableBase.java_implements = " RunnableInterface PriorityRunnable "
WaypointPathRunnableBase.java_interfaces = function() return {RunnableInterface, PriorityRunnable} end

function WaypointPathRunnableBase:_init_fields()
    self.layerDistanceUtil = LayerDistanceUtil.getInstance()
    self.pathFindingLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.targetPathFindingLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.priorityP = require("java.lang.Integer").MAX_VALUE
    if self.runningP == nil then self.runningP = false end
end

function WaypointPathRunnableBase._jinit(self)
    WaypointPathRunnableBase._init_fields(self)
    return self
end

function WaypointPathRunnableBase.new()
    return WaypointPathRunnableBase._jinit(setmetatable({}, WaypointPathRunnableBase))
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


-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local WaypointPathRunnableBase = require("org.allbinary.game.layer.WaypointPathRunnableBase")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local WaypointPathRunnable = {}
WaypointPathRunnable.__index = WaypointPathRunnable
WaypointPathRunnable.className = "WaypointPathRunnable"
setmetatable(WaypointPathRunnable, {__index = WaypointPathRunnableBase})

function WaypointPathRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function WaypointPathRunnable.new()
    local self = setmetatable(WaypointPathRunnableBase.new(), WaypointPathRunnable)
    self:_init_fields()
    return self
end


function WaypointPathRunnable:run()
        local try_ok, try_error = pcall(function()
            self.pathFindingLayer:getWaypointRunnableLogHelper():start(self.pathFindingLayer)
            local waypointBehavior = self.pathFindingLayer:getWaypointBehavior()
            local geographicMapCellPosition = self.pathFindingLayer:getCurrentGeographicMapCellPosition()
            if geographicMapCellPosition == nil then
                error(java_exception("Exception", "Should never be running here"), 0)
            end
            waypointBehavior:setWaypointPathsList(self.targetPathFindingLayer:getWaypointBehavior():getWaypoint():getPathsListRunnable(geographicMapCellPosition))
            self.pathFindingLayer:getWaypointRunnableLogHelper():end_(self.pathFindingLayer)
            java_sleep(15 + (self.priorityP * 2))
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            self:setRunning(false)
        end
end


function WaypointPathRunnable:isDone()
        return true
end

return WaypointPathRunnable


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
-- package org.allbinary.game.layer.waypoint.event

local Group = require("org.allbinary.game.identification.Group")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointEventHandlerFactory = {}
WaypointEventHandlerFactory.__index = WaypointEventHandlerFactory
WaypointEventHandlerFactory.className = "WaypointEventHandlerFactory"

function WaypointEventHandlerFactory.new()
    local self = setmetatable({}, WaypointEventHandlerFactory)
    return self
end


function WaypointEventHandlerFactory.getInstance(groupInterface)
        return WaypointEventHandlerFactory.eventHandlerArray[java_int(groupInterface:getGroupId()) + 1]
end


function WaypointEventHandlerFactory.removeAll()
        for index = (WaypointEventHandlerFactory.eventHandlerArray.n or #WaypointEventHandlerFactory.eventHandlerArray) - 1, 0, -1 do
            WaypointEventHandlerFactory.eventHandlerArray[index + 1]:removeAllListeners()
        end
end

WaypointEventHandlerFactory.eventHandlerArray = {WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new()}

return WaypointEventHandlerFactory


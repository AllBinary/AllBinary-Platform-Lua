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
-- package org.allbinary.game.layer.building.event

local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BuildingEventHandler = {}
BuildingEventHandler.__index = BuildingEventHandler
BuildingEventHandler.className = "BuildingEventHandler"
setmetatable(BuildingEventHandler, {__index = BasicEventHandler})


function BuildingEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), BuildingEventHandler)
    return self
end


function BuildingEventHandler.getInstance()
        return BuildingEventHandler.eventHandler
end


-- throws Exception
function BuildingEventHandler:process(eventObject, eventListenerInterface)
        local buildingEventListenerInterface = (eventListenerInterface)
        buildingEventListenerInterface:onBuildingEvent(eventObject)
end

BuildingEventHandler.eventHandler = BuildingEventHandler.new()

return BuildingEventHandler


--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.media.graphics.geography.map.event

local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local GeographicMapCellPositionEventListenerInterface = {}
GeographicMapCellPositionEventListenerInterface.__index = GeographicMapCellPositionEventListenerInterface
GeographicMapCellPositionEventListenerInterface.className = "GeographicMapCellPositionEventListenerInterface"
setmetatable(GeographicMapCellPositionEventListenerInterface, {__index = EventListenerInterface})


-- throws Exception
function GeographicMapCellPositionEventListenerInterface:onGeographicMapCellPositionEvent(geographicMapCellPositionEvent)
    error("abstract method onGeographicMapCellPositionEvent")
end


-- throws Exception
function GeographicMapCellPositionEventListenerInterface:onRemoveGeographicMapCellPositionEvent(geographicMapCellPositionEvent)
    error("abstract method onRemoveGeographicMapCellPositionEvent")
end

return GeographicMapCellPositionEventListenerInterface


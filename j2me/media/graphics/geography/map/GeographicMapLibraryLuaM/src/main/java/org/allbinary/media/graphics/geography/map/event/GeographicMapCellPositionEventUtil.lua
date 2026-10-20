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

local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
local GeographicMapCellPositionTracking = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPositionEventUtil = {}
GeographicMapCellPositionEventUtil.__index = GeographicMapCellPositionEventUtil
GeographicMapCellPositionEventUtil.className = "GeographicMapCellPositionEventUtil"

function GeographicMapCellPositionEventUtil:_init_fields()
    self.geographicMapCellPositionEvent = nil
    self.geographicMapCellPositionEventHandler = GeographicMapCellPositionEventHandler.getInstance()
end


function GeographicMapCellPositionEventUtil.new(anyType)
    local self = setmetatable({}, GeographicMapCellPositionEventUtil)
    self:_init_fields()
        self.geographicMapCellPositionEvent = GeographicMapCellPositionEvent.new(anyType, CellPositionFactory.getInstance().NONE)
    return self
end


-- throws Exception
function GeographicMapCellPositionEventUtil:update(geographicMapCellPositionTracking)
        self.geographicMapCellPositionEvent:setGeographicMapCellPosition(geographicMapCellPositionTracking:getCurrentGeographicMapCellPosition())
        self.geographicMapCellPositionEventHandler:fireEvent(self.geographicMapCellPositionEvent)
end


-- throws Exception
function GeographicMapCellPositionEventUtil:remove(geographicMapCellPositionTracking)
        self.geographicMapCellPositionEvent:setGeographicMapCellPosition(geographicMapCellPositionTracking:getCurrentGeographicMapCellPosition())
        self.geographicMapCellPositionEventHandler:fireRemoveEvent(self.geographicMapCellPositionEvent)
end

return GeographicMapCellPositionEventUtil


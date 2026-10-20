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

local CellPosition = require("org.allbinary.graphics.CellPosition")
local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPositionEvent = {}
GeographicMapCellPositionEvent.__index = GeographicMapCellPositionEvent
GeographicMapCellPositionEvent.className = "GeographicMapCellPositionEvent"
setmetatable(GeographicMapCellPositionEvent, {__index = AllBinaryEventObject})

function GeographicMapCellPositionEvent:_init_fields()
    self.geographicMapCellPosition = CellPositionFactory.getInstance().NONE
end


function GeographicMapCellPositionEvent.new(anyType, geographicMapCellPosition)
    local self = setmetatable(AllBinaryEventObject.new(anyType), GeographicMapCellPositionEvent)
    self:_init_fields()
        -- super(...) made self above
        self.geographicMapCellPosition = geographicMapCellPosition
    return self
end


function GeographicMapCellPositionEvent:init(anyType)
        self:setSource(anyType)
end


function GeographicMapCellPositionEvent:setGeographicMapCellPosition(geographicMapCellPosition)
        self.geographicMapCellPosition = geographicMapCellPosition
end


function GeographicMapCellPositionEvent:getGeographicMapCellPosition()
        return self.geographicMapCellPosition
end


function GeographicMapCellPositionEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("CellPositionEvent: ")
        stringBuffer:append("\nGeographicMapCellPosition: ")
        stringBuffer:append(StringUtil.getInstance():toString(self:getGeographicMapCellPosition()))
        return tostring(stringBuffer)
end
GeographicMapCellPositionEvent.__tostring = function(self) return self:toString() end

return GeographicMapCellPositionEvent


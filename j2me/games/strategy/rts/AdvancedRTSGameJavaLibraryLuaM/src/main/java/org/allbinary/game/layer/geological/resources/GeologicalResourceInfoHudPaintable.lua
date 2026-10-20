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
-- package org.allbinary.game.layer.geological.resources

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local WaypointInfoHudPaintable = require("org.allbinary.game.layer.waypoint.WaypointInfoHudPaintable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local KeyValueDrawCharArray = require("org.allbinary.graphics.draw.KeyValueDrawCharArray")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeologicalResourceInfoHudPaintable = {}
GeologicalResourceInfoHudPaintable.__index = GeologicalResourceInfoHudPaintable
GeologicalResourceInfoHudPaintable.className = "GeologicalResourceInfoHudPaintable"
setmetatable(GeologicalResourceInfoHudPaintable, {__index = WaypointInfoHudPaintable})

function GeologicalResourceInfoHudPaintable:_init_fields()
    self.keyvalueDrawString = nil
    self.fontHeight = 0
end


function GeologicalResourceInfoHudPaintable.new()
    local self = setmetatable(WaypointInfoHudPaintable.new(), GeologicalResourceInfoHudPaintable)
    self:_init_fields()
        self.keyvalueDrawString = KeyValueDrawCharArray.new(GeologicalResourceInfoHudPaintable.RESOURCES, self.textX)
    return self
end


function GeologicalResourceInfoHudPaintable:updateMeasurement(graphics)
        WaypointInfoHudPaintable.updateMeasurement(self, graphics)
        local font = graphics:getFont()
        self.fontHeight = (2 * font:getHeight())
end


function GeologicalResourceInfoHudPaintable:updateSelectionInfo()
        WaypointInfoHudPaintable.updateSelectionInfo(self)
        local rtsLayer = self.rtsLayerP
        local list = rtsLayer.geographicMapCellPositionAreaBase:getOccupyingGeographicMapCellPositionList()
        local total = 0
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local geographicMapCellPosition = list:get(index)
            total = total + (geographicMapCellPosition:getGeologicalResource():getTotal())
            end
        end
        self.keyvalueDrawString:update(self:getPrimitiveLongUtil():getCharArray(total), self:getPrimitiveLongUtil():getCurrentTotalDigits())
end


function GeologicalResourceInfoHudPaintable:paint(graphics)
        WaypointInfoHudPaintable.paint(self, graphics)
        self.keyvalueDrawString:paint(graphics, (self.y + self.fontHeight))
end

GeologicalResourceInfoHudPaintable.RESOURCES = "Resources: "

return GeologicalResourceInfoHudPaintable


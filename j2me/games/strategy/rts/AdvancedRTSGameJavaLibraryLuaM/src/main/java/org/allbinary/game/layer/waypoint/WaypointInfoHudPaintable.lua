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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local RTSLayer = require("org.allbinary.game.layer.RTSLayer")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local KeyValueDrawString = require("org.allbinary.graphics.draw.KeyValueDrawString")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointInfoHudPaintable = {}
WaypointInfoHudPaintable.__index = WaypointInfoHudPaintable
WaypointInfoHudPaintable.className = "WaypointInfoHudPaintable"
setmetatable(WaypointInfoHudPaintable, {__index = SelectionHudPaintable})

function WaypointInfoHudPaintable:_init_fields()
    self.keyvalueDrawString = nil
    self.rtsLayerP = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.textLine2Y = 0
end


function WaypointInfoHudPaintable.new()
    local self = setmetatable(SelectionHudPaintable.new(), WaypointInfoHudPaintable)
    self:_init_fields()
        self.keyvalueDrawString = KeyValueDrawString.new("Owner: ", self.textX)
    return self
end


function WaypointInfoHudPaintable:updateMeasurement(graphics)
        SelectionHudPaintable.updateMeasurement(self, graphics)
        local font = graphics:getFont()
        self.textLine2Y = (self.y + font:getHeight())
end


function WaypointInfoHudPaintable:updateSelectionInfo()
        local rtsLayer = self.rtsLayerP
        self:setName(rtsLayer:getName())
        self:setAnimationInterface(rtsLayer:getVerticleBuildAnimationInterface())
        self.keyvalueDrawString:update(rtsLayer:getParentLayer():getName())
end


function WaypointInfoHudPaintable:setRtsLayer(rtsLayer)
        self.rtsLayerP = rtsLayer
end


function WaypointInfoHudPaintable:getRtsLayer()
        return self.rtsLayerP
end


function WaypointInfoHudPaintable:paint(graphics)
        SelectionHudPaintable.paint(self, graphics)
        self.keyvalueDrawString:paint(graphics, self.textLine2Y)
        self:getAnimationInterface():paintXY(graphics, self.imageX, self.y)
end

return WaypointInfoHudPaintable


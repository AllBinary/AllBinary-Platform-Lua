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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local BasicWeaponPart = require("org.allbinary.game.part.weapon.BasicWeaponPart")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerHudPaintable = {}
RTSLayerHudPaintable.__index = RTSLayerHudPaintable
RTSLayerHudPaintable.className = "RTSLayerHudPaintable"
setmetatable(RTSLayerHudPaintable, {__index = SelectionHudPaintable})

function RTSLayerHudPaintable:_init_fields()
    self.weaponProperties = StringUtil.getInstance():getArrayInstance()
    self.rtsLayer = CollidableDestroyableDamageableLayer.getNullInstance()
    self.costY = 0
    self.costY1 = 0
    self.fontHeight = 0
end


function RTSLayerHudPaintable.getInstance()
        return RTSLayerHudPaintable.instance
end


function RTSLayerHudPaintable.new()
    local self = setmetatable(SelectionHudPaintable.new(), RTSLayerHudPaintable)
    self:_init_fields()
    return self
end


function RTSLayerHudPaintable:updateMeasurement(graphics)
        SelectionHudPaintable.updateMeasurement(self, graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.costY1 = (self.y + (((self.weaponProperties.n or #self.weaponProperties) + 1) * self.fontHeight))
        if not AndroidUtil.isAndroid() then
            self.costY = self.costY1
        else
            self.costY = (self.y + (((self.weaponProperties.n or #self.weaponProperties) + 2) * self.fontHeight))
        end
end


function RTSLayerHudPaintable:updateSelectionInfo()
        self:setName(self:getRtsLayer():getName())
        local partInterface = self:getRtsLayer():getPartInterfaceArray()[1]
        self.weaponProperties = partInterface:getWeaponProperties():toStringArray()
        self.myFontProcessor = self.updateMyFontProcessor
end


function RTSLayerHudPaintable:paint(graphics)
        SelectionHudPaintable.paint(self, graphics)
        local size = (self.weaponProperties.n or #self.weaponProperties)
        for index = 0, size - 1 do
            graphics:drawString(self.weaponProperties[index + 1], self.textX, self.y + ((index + 1) * self.fontHeight), 0)
        end
end


function RTSLayerHudPaintable:setRtsLayer(rtsLayer)
        self.rtsLayer = rtsLayer
end


function RTSLayerHudPaintable:getRtsLayer()
        return self.rtsLayer
end

RTSLayerHudPaintable.instance = RTSLayerHudPaintable.new()

return RTSLayerHudPaintable


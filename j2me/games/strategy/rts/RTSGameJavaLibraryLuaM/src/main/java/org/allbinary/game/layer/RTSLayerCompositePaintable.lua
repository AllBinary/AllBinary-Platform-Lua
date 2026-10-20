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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerCompositePaintable = {}
RTSLayerCompositePaintable.__index = RTSLayerCompositePaintable
RTSLayerCompositePaintable.className = "RTSLayerCompositePaintable"
setmetatable(RTSLayerCompositePaintable, {__index = Paintable})

function RTSLayerCompositePaintable:_init_fields()
    self.upgradeCost = StringUtil.getInstance().EMPTY_STRING
    self.downGradeCost = StringUtil.getInstance().EMPTY_STRING
    self.UPGRADE = "Up: $"
    self.DOWNGRADE = "Down: $-"
    self.upgradableRTSLayerHudPaintable = nil
end


function RTSLayerCompositePaintable.new(upgradableRTSLayerHudPaintable)
    local self = setmetatable(Paintable.new(), RTSLayerCompositePaintable)
    self:_init_fields()
        self.upgradableRTSLayerHudPaintable = upgradableRTSLayerHudPaintable
    return self
end


function RTSLayerCompositePaintable:update(rtsLayer)
        if rtsLayer:isUpgradeable() then
            self:setUpgradeCost(tostring(StringMaker.new():append(self.UPGRADE):appendint(java_int(rtsLayer:getUpgradeCost()))))
        else
            self:setUpgradeCost(StringUtil.getInstance().EMPTY_STRING)
        end
        if rtsLayer:isDowngradeable() then
            self:setDownGradeCost(tostring(StringMaker.new():append(self.DOWNGRADE):appendint(java_int(rtsLayer:getDowngradeCost()))))
        else
            self:setDownGradeCost(StringUtil.getInstance().EMPTY_STRING)
        end
end


function RTSLayerCompositePaintable:paint(graphics)
        graphics:drawString(self:getDownGradeCost(), self.upgradableRTSLayerHudPaintable.textX, self.upgradableRTSLayerHudPaintable.costY1, 0)
        graphics:drawString(self:getUpgradeCost(), self.upgradableRTSLayerHudPaintable.textX, self.upgradableRTSLayerHudPaintable.costY, 0)
end


function RTSLayerCompositePaintable:setUpgradeCost(upgradeCost)
        self.upgradeCost = upgradeCost
end


function RTSLayerCompositePaintable:getUpgradeCost()
        return self.upgradeCost
end


function RTSLayerCompositePaintable:setDownGradeCost(downGradeCost)
        self.downGradeCost = downGradeCost
end


function RTSLayerCompositePaintable:getDownGradeCost()
        return self.downGradeCost
end

return RTSLayerCompositePaintable


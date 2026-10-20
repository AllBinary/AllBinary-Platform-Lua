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
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local RTSLayerCompositePaintable = require("org.allbinary.game.layer.RTSLayerCompositePaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpgradableWideRTSLayerPaintable = {}
UpgradableWideRTSLayerPaintable.__index = UpgradableWideRTSLayerPaintable
UpgradableWideRTSLayerPaintable.className = "UpgradableWideRTSLayerPaintable"
setmetatable(UpgradableWideRTSLayerPaintable, {__index = RTSLayerCompositePaintable})

function UpgradableWideRTSLayerPaintable:_init_fields()
    self.cost = StringUtil.getInstance().EMPTY_STRING
end


function UpgradableWideRTSLayerPaintable.new(upgradableRTSLayerHudPaintable)
    local self = setmetatable(RTSLayerCompositePaintable.new(upgradableRTSLayerHudPaintable), UpgradableWideRTSLayerPaintable)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function UpgradableWideRTSLayerPaintable:update(rtsLayer)
        RTSLayerCompositePaintable.update(self, rtsLayer)
        self:setCost(tostring(StringMaker.new():append(self:getUpgradeCost()):append(CommonSeps.getInstance().SPACE):append(self:getDownGradeCost())))
end


function UpgradableWideRTSLayerPaintable:paint(graphics)
        graphics:drawString(self:getCost(), self.upgradableRTSLayerHudPaintable.textX, self.upgradableRTSLayerHudPaintable.costY, 0)
end


function UpgradableWideRTSLayerPaintable:setCost(cost)
        self.cost = cost
end


function UpgradableWideRTSLayerPaintable:getCost()
        return self.cost
end

return UpgradableWideRTSLayerPaintable


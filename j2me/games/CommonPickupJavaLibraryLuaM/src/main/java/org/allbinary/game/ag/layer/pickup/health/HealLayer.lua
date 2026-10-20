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
-- package org.allbinary.game.ag.layer.pickup.health

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local HealthInterface = require("org.allbinary.game.health.HealthInterface")
local HealthVisitorInterface = require("org.allbinary.game.health.HealthVisitorInterface")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ViewPosition = require("org.allbinary.view.ViewPosition")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealLayer = {}
HealLayer.__index = HealLayer
HealLayer.className = "HealLayer"
setmetatable(HealLayer, {__index = AllBinaryLayer})


function HealLayer.new()
    local self = setmetatable(AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, Rectangle.new(PointFactory.getInstance().ZERO_ZERO, 0, 0), ViewPosition.getInstanceD()), HealLayer)
        -- super(...) made self above
    return self
end


function HealLayer:paint(graphics)
end


function HealLayer:visit(healthInterface)
        if healthInterface:isAlive() then
            healthInterface:healMax()
        else
            self.logUtil:putF("Heal attempt on dead: Does not currently occur", self, "visit")
        end
end

return HealLayer


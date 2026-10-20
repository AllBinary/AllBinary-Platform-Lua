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
-- package org.allbinary.graphics.form

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local LockedResources = require("org.allbinary.logic.system.security.licensing.LockedResources")
local LockedUtil = require("org.allbinary.logic.system.security.licensing.LockedUtil")
local ItemPaintable = require("org.allbinary.graphics.form.ItemPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LockablePaintable = {}
LockablePaintable.__index = LockablePaintable
LockablePaintable.className = "LockablePaintable"
setmetatable(LockablePaintable, {__index = ItemPaintable})

function LockablePaintable:_init_fields()
    self.animation = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(LockedResources.getInstance().LOCKED_DEMO_GAME_FEATURE_RESOURCE):getInstance(0)
    self.lockedIndex = nil
end


function LockablePaintable.new(lockedIndex)
    local self = setmetatable(ItemPaintable.new(), LockablePaintable)
    self:_init_fields()
        self.lockedIndex = lockedIndex
    return self
end


function LockablePaintable:paint(graphics, currentIndex, x, y)
        if LockedUtil.getInstance():isLocked() and currentIndex >= self:getLockedIndex() then
            self:getAnimation():paintXY(graphics, x, y)
        end
end


function LockablePaintable:getLockedIndex()
        return self.lockedIndex
end


function LockablePaintable:getAnimation()
        return self.animation
end

return LockablePaintable


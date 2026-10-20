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
-- package org.allbinary.game.displayable.canvas

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")
local LockedResources = require("org.allbinary.logic.system.security.licensing.LockedResources")
local LockedUtil = require("org.allbinary.logic.system.security.licensing.LockedUtil")
local LockablePaintable = require("org.allbinary.graphics.form.LockablePaintable")
local ScrollCurrentSelectionForm = require("org.allbinary.graphics.form.ScrollCurrentSelectionForm")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreGameLockablePaintable = {}
PreGameLockablePaintable.__index = PreGameLockablePaintable
PreGameLockablePaintable.className = "PreGameLockablePaintable"
setmetatable(PreGameLockablePaintable, {__index = LockablePaintable})

function PreGameLockablePaintable:_init_fields()
    self.halfWidth = nil
    self.paintableForm = nil
end


function PreGameLockablePaintable.new(paintableForm, lockedIndex)
    local self = setmetatable(LockablePaintable.new(lockedIndex), PreGameLockablePaintable)
    self:_init_fields()
        -- super(...) made self above
        self.paintableForm = paintableForm
        self.halfWidth = GameFeatureImageCacheFactory.getInstance():getWithKey(LockedResources.getInstance().LOCKED_DEMO_GAME_FEATURE_RESOURCE):getWidth() / 2
    return self
end


function PreGameLockablePaintable:paint(graphics, currentIndex, x, y)
        if LockedUtil.getInstance():isLocked() and self:getPaintableForm():getSelectedIndex() >= self:getLockedIndex() then
            self:getAnimation():paintXY(graphics, self:getPaintableForm():getDx() - self.halfWidth, self:getPaintableForm():getDy() + 34)
        end
end


function PreGameLockablePaintable:getPaintableForm()
        return self.paintableForm
end

return PreGameLockablePaintable


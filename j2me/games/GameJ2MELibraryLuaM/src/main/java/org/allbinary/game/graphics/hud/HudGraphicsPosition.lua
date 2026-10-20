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
-- package org.allbinary.game.graphics.hud

local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HudGraphicsPosition = {}
HudGraphicsPosition.__index = HudGraphicsPosition
HudGraphicsPosition.className = "HudGraphicsPosition"

function HudGraphicsPosition:_init_fields()
    self.anchor = 0
    self.point = PointFactory.getInstance().ZERO_ZERO
end


function HudGraphicsPosition.new(point, anchor)
    local self = setmetatable({}, HudGraphicsPosition)
    self:_init_fields()
        self:setAnchor(anchor)
        self:setPoint(point)
    return self
end


function HudGraphicsPosition:getAnchor()
        return self.anchor
end


function HudGraphicsPosition:setAnchor(anchor)
        self.anchor = anchor
end


function HudGraphicsPosition:getPoint()
        return self.point
end


function HudGraphicsPosition:setPoint(point)
        self.point = point
end

HudGraphicsPosition.NULL_HUD_GRAPHICS_POSITION = HudGraphicsPosition.new(PointFactory.getInstance().ZERO_ZERO, 9)

return HudGraphicsPosition


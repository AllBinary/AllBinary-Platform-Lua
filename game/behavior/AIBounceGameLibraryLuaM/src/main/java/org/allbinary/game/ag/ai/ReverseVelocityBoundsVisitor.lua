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
-- package org.allbinary.game.ag.ai

local BoundsVisitorInterface = require("org.allbinary.bounds.BoundsVisitorInterface")
local VelocityInterface = require("org.allbinary.game.physics.velocity.VelocityInterface")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local LayerInterface = require("org.allbinary.layer.LayerInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ReverseVelocityBoundsVisitor = {}
ReverseVelocityBoundsVisitor.__index = ReverseVelocityBoundsVisitor
ReverseVelocityBoundsVisitor.className = "ReverseVelocityBoundsVisitor"

function ReverseVelocityBoundsVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.velocityInterface = nil
    self.layerInterface = nil
end


function ReverseVelocityBoundsVisitor.new(layerInterface)
    local self = setmetatable({}, ReverseVelocityBoundsVisitor)
    self:_init_fields()
        self.layerInterface = layerInterface
        local velocityInterfaceCompositeInterface = layerInterface
        self.velocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
    return self
end


function ReverseVelocityBoundsVisitor:getX()
        return self.layerInterface:getXP()
end


function ReverseVelocityBoundsVisitor:getY()
        return self.layerInterface:getYP()
end


function ReverseVelocityBoundsVisitor:minX()
        if self.velocityInterface:getVelocityXBasicDecimalP():getUnscaled() < 0 then
            self.velocityInterface:getVelocityXBasicDecimalP():multiplyint(-1)
        end
end


function ReverseVelocityBoundsVisitor:maxX()
        if self.velocityInterface:getVelocityXBasicDecimalP():getUnscaled() > 0 then
            self.velocityInterface:getVelocityXBasicDecimalP():multiplyint(-1)
        end
end


function ReverseVelocityBoundsVisitor:minY()
        if self.velocityInterface:getVelocityYBasicDecimalP():getUnscaled() < 0 then
            self.velocityInterface:getVelocityYBasicDecimalP():multiplyint(-1)
        end
end


function ReverseVelocityBoundsVisitor:maxY()
        if self.velocityInterface:getVelocityYBasicDecimalP():getUnscaled() > 0 then
            self.velocityInterface:getVelocityYBasicDecimalP():multiplyint(-1)
        end
end

return ReverseVelocityBoundsVisitor


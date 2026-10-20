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
-- package org.allbinary.game.ag.ai.scroller

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasePatrolAI = {}
BasePatrolAI.__index = BasePatrolAI
BasePatrolAI.className = "BasePatrolAI"
setmetatable(BasePatrolAI, {__index = BasicAI})

function BasePatrolAI:_init_fields()
    self.maxDistance = nil
    self.currentDistance = nil
    self.xTotalDistance = 0
    self.lastKeyDirection = Canvas.RIGHT
    self.keyDirection = Canvas.RIGHT
end


function BasePatrolAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), BasePatrolAI)
    self:_init_fields()
        -- super(...) made self above
        self.maxDistance = hashtable:get(BasePatrolAI.MAX_DISTANCE)
        self.currentDistance = math.tointeger(self.maxDistance // 1)
    return self
end


function BasePatrolAI:update()
        self:updateTotalDistance()
        self:changeDirectionIfReachedPacingAreaMax()
end


function BasePatrolAI:updateTotalDistance()
        local velocityInterfaceCompositeInterface = self:getOwnerLayerInterface()
        local velocityProperties = velocityInterfaceCompositeInterface:getVelocityProperties()
        self.xTotalDistance = self.xTotalDistance + (velocityProperties:getVelocityXBasicDecimalP():getScaled())
end


function BasePatrolAI:changeDirectionIfReachedPacingAreaMax()
        local mathUtil = MathUtil.getInstance()
        local totalDistance = mathUtil:abs(self.xTotalDistance)
        if totalDistance > self.currentDistance then
            self:nextDirection()
        end
end


function BasePatrolAI:nextDirection()
        if self.lastKeyDirection == Canvas.LEFT then
            self.keyDirection = Canvas.RIGHT
            self.lastKeyDirection = self.keyDirection
            self.xTotalDistance = 0
        elseif self.lastKeyDirection == Canvas.RIGHT then
            self.keyDirection = Canvas.LEFT
            self.lastKeyDirection = self.keyDirection
            self.xTotalDistance = 0
        end
end


function BasePatrolAI:disable()
end

BasePatrolAI.MAX_DISTANCE = SmallIntegerSingletonFactory.getInstance():getAt(2)
BasePatrolAI.DIRECTION_ARRAY = SmallIntegerSingletonFactory.getInstance():getAt(3)
BasePatrolAI.FIRING_DISTANCE = SmallIntegerSingletonFactory.getInstance():getAt(4)
BasePatrolAI.SPEED = SmallIntegerSingletonFactory.getInstance():getAt(5)

return BasePatrolAI


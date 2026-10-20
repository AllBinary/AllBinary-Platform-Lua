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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local Direction = require("org.allbinary.direction.Direction")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local DirectionalCompositeInterface = require("org.allbinary.direction.DirectionalCompositeInterface")
local DirectionalInterface = require("org.allbinary.direction.DirectionalInterface")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local DestroyedEvent = require("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local DestroyedEventHandler = require("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local DestroyedEventListenerInterface = require("org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface")
local GameInput = require("org.allbinary.game.input.GameInput")
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = require("org.allbinary.game.tracking.TrackingEventListenerInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DiveAndDirectionalTrackingAI = {}
DiveAndDirectionalTrackingAI.__index = DiveAndDirectionalTrackingAI
DiveAndDirectionalTrackingAI.className = "DiveAndDirectionalTrackingAI"
setmetatable(DiveAndDirectionalTrackingAI, {__index = BasicAI})

function DiveAndDirectionalTrackingAI:_init_fields()
    self.mathUtil = MathUtil.getInstance()
    self.directionFactory = DirectionFactory.getInstance()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(500)
    self.list = BasicArrayListD.new()
    self.directionalInterface = nil
    self.velocityInterface = nil
    self.directionToKeyMap = {Canvas.LEFT, Canvas.DOWN, Canvas.UP, Canvas.RIGHT}
    self.initialDropped = false
    self.diveP = false
    self.directionOfTarget = Direction.getInstance(0)
    self.MIN_DISTANCE = 40
    self.lastTrackingLayerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
    self.artificialIntelligenceInterface = nil
    self.aiVistor = nil
    self.lastDirection = DirectionFactory.getInstance().NO_DIRECTION
end


function DiveAndDirectionalTrackingAI.new(ownerLayerInterface, artificialIntelligenceInterface, gameInput, visitor)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), DiveAndDirectionalTrackingAI)
    self:_init_fields()
        -- super(...) made self above
        self.aiVistor = visitor
        self.artificialIntelligenceInterface = artificialIntelligenceInterface
        local directionalCompositeInterface = self:getOwnerLayerInterface()
        self.directionalInterface = directionalCompositeInterface:getDirectionalInterface()
        local velocityInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.velocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
        DestroyedEventHandler.getInstance():addListenerInterface(self)
        self:init()
    return self
end


-- throws Exception
function DiveAndDirectionalTrackingAI:processAI(allBinaryLayerManager)
        if self:isBeyondTarget() then
            self:init()
            self.velocityInterface:zero()
        end
        if not self.diveP then
            self:target(allBinaryLayerManager)
        else
            self:dive()
            self:attack()
        end
        self.list:clear()
end


function DiveAndDirectionalTrackingAI:init()
        self.diveP = false
        self.directionOfTarget = DirectionFactory.getInstance().NOT_BORDERED_WITH
        TrackingEventHandler.getInstance():addListenerInterface(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:target(allBinaryLayerManager)
        if self.list:size() == 0 then
            return
        end
        local lastTrackingEvent = self.list:removeAt(0)
        self.lastTrackingLayerInterface = lastTrackingEvent:getLayerInterface()
        local layerInterface = self.lastTrackingLayerInterface
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if layerInterface:getGroupInterface() == ownerLayerInterface:getGroupInterface() then
            return
        end
        local x = self.lastTrackingLayerInterface:getXP()
        local y = self.lastTrackingLayerInterface:getYP()
        local yDistance = ownerLayerInterface:getYP() - y - ownerLayerInterface:getHeight()
        local xDistance = ownerLayerInterface:getXP() - x - ownerLayerInterface:getWidth()
        local directionFactory = DirectionFactory.getInstance()
        if self.mathUtil:abs(yDistance) > self.mathUtil:abs(xDistance) then
            if yDistance > self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.UP
            elseif yDistance < -self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.DOWN
            end
        else
            if xDistance > self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.LEFT
            elseif xDistance < -self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.RIGHT
            end
        end
        if not self.initialDropped and self.directionOfTarget ~= directionFactory.NOT_BORDERED_WITH then
            self:drop()
        end
        if self.initialDropped then
            if self.directionOfTarget == directionFactory.UP or self.directionOfTarget == directionFactory.DOWN then
                self:verticalTargeting(x)
            elseif self.directionOfTarget == directionFactory.LEFT or self.directionOfTarget == directionFactory.RIGHT then
                self:horizontalTargeting(y)
            else
                self.artificialIntelligenceInterface:processAI(allBinaryLayerManager)
            end
        end
end


-- throws Exception
function DiveAndDirectionalTrackingAI:verticalTargeting(x)
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if ownerLayerInterface:getXP() < x then
            self:moveRight()
        end
        if ownerLayerInterface:getXP() > x then
            self:moveLeft()
        end
        if ownerLayerInterface:getXP() > x - 3 and ownerLayerInterface:getXP() < x + 3 then
            self:setDive()
        end
end


-- throws Exception
function DiveAndDirectionalTrackingAI:horizontalTargeting(y)
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if ownerLayerInterface:getYP() < y then
            self:moveDown()
        end
        if ownerLayerInterface:getYP() > y then
            self:moveUp()
        end
        if ownerLayerInterface:getYP() > y - 3 and ownerLayerInterface:getYP() < y + 3 then
            self:setDive()
        end
end


function DiveAndDirectionalTrackingAI:setDive()
        self.diveP = true
        self.velocityInterface:zero()
        TrackingEventHandler.getInstance():removeListener(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:moveRight()
        self:setLastDirection(self.directionFactory.RIGHT)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:moveLeft()
        self:setLastDirection(self.directionFactory.LEFT)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:moveDown()
        self:setLastDirection(self.directionFactory.DOWN)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:moveUp()
        self:setLastDirection(self.directionFactory.UP)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:dive()
        self.directionalInterface:setFrameByDirection(self.directionOfTarget)
        self.aiVistor:visit(self)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:attack()
        BasicAI.processKeyAI(self, Canvas.KEY_NUM1)
end


-- throws Exception
function DiveAndDirectionalTrackingAI:drop()
        if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            self.initialDropped = true
            self.aiVistor:visit(self)
        end
end


function DiveAndDirectionalTrackingAI:isBeyondTarget()
        if self.directionOfTarget == self.directionFactory.DOWN then
            if self:getOwnerLayerInterface():getYP() > self.lastTrackingLayerInterface:getYP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        elseif self.directionOfTarget == self.directionFactory.UP then
            if self:getOwnerLayerInterface():getYP() < self.lastTrackingLayerInterface:getYP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        elseif self.directionOfTarget == self.directionFactory.RIGHT then
            if self:getOwnerLayerInterface():getXP() > self.lastTrackingLayerInterface:getXP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        elseif self.directionOfTarget == self.directionFactory.LEFT then
            if self:getOwnerLayerInterface():getXP() < self.lastTrackingLayerInterface:getXP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        else
            return false
        end
end


function DiveAndDirectionalTrackingAI:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function DiveAndDirectionalTrackingAI:onMovement(trackingEvent)
        self.list:add(trackingEvent)
end


function DiveAndDirectionalTrackingAI:onDestroyed(destroyedEvent)
        if self:getOwnerLayerInterface() == destroyedEvent:getLayerInterface() then
            TrackingEventHandler.getInstance():removeListener(self)
            DestroyedEventHandler.getInstance():removeListener(self)
        end
end


function DiveAndDirectionalTrackingAI:setLastDirection(lastDirection)
        self.lastDirection = lastDirection
        local value = self:getLastDirection():getValue()
        if value < 4 then
            BasicAI.setLastKey(self, self.directionToKeyMap[value + 1])
        end
end


function DiveAndDirectionalTrackingAI:setLastKey(lastKey)
        BasicAI.setLastKey(self, lastKey)
        if self:getLastKey() == Canvas.LEFT then
            self.lastDirection = DirectionFactory.getInstance().LEFT
        elseif self:getLastKey() == Canvas.DOWN then
            self.lastDirection = DirectionFactory.getInstance().DOWN
        elseif self:getLastKey() == Canvas.UP then
            self.lastDirection = DirectionFactory.getInstance().UP
        elseif self:getLastKey() == Canvas.RIGHT then
            self.lastDirection = DirectionFactory.getInstance().RIGHT
        end
end


function DiveAndDirectionalTrackingAI:getLastDirection()
        return self.lastDirection
end


function DiveAndDirectionalTrackingAI:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicAI))
        stringBuffer:append(" LastDirection: ")
        stringBuffer:append(StringUtil.getInstance():toString(self:getLastDirection()))
        return tostring(stringBuffer)
end
DiveAndDirectionalTrackingAI.__tostring = function(self) return self:toString() end

return DiveAndDirectionalTrackingAI


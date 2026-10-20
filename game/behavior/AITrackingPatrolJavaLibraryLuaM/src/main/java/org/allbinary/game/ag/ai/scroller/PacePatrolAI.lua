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
local Direction = require("org.allbinary.direction.Direction")
local DirectionCompositeInterface = require("org.allbinary.direction.DirectionCompositeInterface")
local DirectionFactory = require("org.allbinary.direction.DirectionFactory")
local GameInput = require("org.allbinary.game.input.GameInput")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = require("org.allbinary.game.tracking.TrackingEventListenerInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LayerInterface = require("org.allbinary.layer.LayerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasePatrolAI = require("org.allbinary.game.ag.ai.scroller.BasePatrolAI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PacePatrolAI = {}
PacePatrolAI.__index = PacePatrolAI
PacePatrolAI.className = "PacePatrolAI"
setmetatable(PacePatrolAI, {__index = BasePatrolAI})

function PacePatrolAI:_init_fields()
    self.trackingList = nil
    self.firingDistance = 0
    self.isFollowLimitedByTerrain = false
end


function PacePatrolAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(BasePatrolAI.new(hashtable, ownerLayerInterface, gameInput), PacePatrolAI)
    self:_init_fields()
        -- super(...) made self above
        TrackingEventHandler.getInstance():addListenerInterface(self)
        self.trackingList = BasicArrayListD.new()
    return self
end


-- throws Exception
function PacePatrolAI:processAI(allBinaryLayerManager)
        self:update()
        local direction = self:setFiringDirectionForTargetIfInRange()
        local directionFactory = DirectionFactory.getInstance()
        if direction == directionFactory.LEFT then
            if self.lastKeyDirection ~= self.keyDirection or not self.isFollowLimitedByTerrain then
                BasePatrolAI.processKeyAI(self, Canvas.LEFT)
            end
            self.keyDirection = Canvas.LEFT
            self.lastKeyDirection = self.keyDirection
            self.xTotalDistance = 0
            BasePatrolAI.processKeyAI(self, Canvas.KEY_NUM1)
        elseif direction == directionFactory.RIGHT then
            if self.lastKeyDirection ~= self.keyDirection or not self.isFollowLimitedByTerrain then
                BasePatrolAI.processKeyAI(self, Canvas.RIGHT)
            end
            self.keyDirection = Canvas.RIGHT
            self.lastKeyDirection = self.keyDirection
            self.xTotalDistance = 0
            BasePatrolAI.processKeyAI(self, Canvas.KEY_NUM1)
        else
            BasePatrolAI.processKeyAI(self, self.keyDirection)
        end
end


function PacePatrolAI:setFiringDirectionForTargetIfInRange()
        local directionFactory = DirectionFactory.getInstance()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local direction = directionFactory.NOT_BORDERED_WITH
        local lastTrackingEvent = nil
        local lastTrackingLayerInterface = nil
        local directionCompositeInterface = nil
        local size = self.trackingList:size()
        for index = 0, size - 1 do
            lastTrackingEvent = self.trackingList:get(0)
            lastTrackingLayerInterface = lastTrackingEvent:getLayerInterface()
            local x = lastTrackingLayerInterface:getXP()
            local y = lastTrackingLayerInterface:getYP()
            local yDistance = ownerLayerInterface:getYP() - y - ownerLayerInterface:getHeight()
            local xDistance = ownerLayerInterface:getXP() - x - ownerLayerInterface:getWidth()
            local absXDistance = math.abs(xDistance)
            local absYDistance = math.abs(yDistance)
            if absYDistance <= 100 then
                if absXDistance < java_idiv(self:getFiringDistance(), 2) then
                    directionCompositeInterface = self:getOwnerLayerInterface()
                    if xDistance < 0 and directionCompositeInterface:getDirection() == directionFactory.RIGHT then
                        direction = directionFactory.RIGHT
                    elseif xDistance > 0 and directionCompositeInterface:getDirection() == directionFactory.LEFT then
                        direction = directionFactory.LEFT
                    end
                end
            end
        end
        return direction
end


function PacePatrolAI:disable()
end


function PacePatrolAI:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function PacePatrolAI:onMovement(trackingEvent)
        self.trackingList:clear()
        self.trackingList:add(trackingEvent)
end


function PacePatrolAI:getFiringDistance()
        return self.firingDistance
end


function PacePatrolAI:setFiringDistance(firingDistance)
        self.firingDistance = firingDistance
end

return PacePatrolAI


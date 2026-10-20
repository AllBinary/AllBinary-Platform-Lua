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

local GameInput = require("org.allbinary.game.input.GameInput")
local BasicTerrainInfo = require("org.allbinary.game.terrain.BasicTerrainInfo")
local TerrainEvent = require("org.allbinary.game.terrain.TerrainEvent")
local TerrainEventCircularStaticPool = require("org.allbinary.game.terrain.TerrainEventCircularStaticPool")
local TerrainEventHandler = require("org.allbinary.game.terrain.TerrainEventHandler")
local TerrainEventListener = require("org.allbinary.game.terrain.TerrainEventListener")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local PacePatrolAI = require("org.allbinary.game.ag.ai.scroller.PacePatrolAI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TerrainPatrolAI = {}
TerrainPatrolAI.__index = TerrainPatrolAI
TerrainPatrolAI.className = "TerrainPatrolAI"
setmetatable(TerrainPatrolAI, {__index = PacePatrolAI})

function TerrainPatrolAI:_init_fields()
    self.terrainEventListener = TerrainEventListener.new()
    self.DOWN = AngleFactory.getInstance().DOWN
    self.CLIFF = BasicTerrainInfo.new(self.DOWN)
end


function TerrainPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(PacePatrolAI.new(hashtable, ownerLayerInterface, gameInput), TerrainPatrolAI)
    self:_init_fields()
        -- super(...) made self above
        TerrainEventHandler.getInstance(ownerLayerInterface):addListener(self.terrainEventListener)
        self.terrainEventListener:onTerrainEvent(TerrainEventCircularStaticPool.getInstance():getNext(self.CLIFF))
    return self
end


function TerrainPatrolAI:update()
        PacePatrolAI.update(self)
        self:changeDirectionIfCliffReached()
end


function TerrainPatrolAI:changeDirectionIfCliffReached()
        local list = self.terrainEventListener:getList()
        local size = list:size()
        for index = 0, size - 1 do
            local terrainEvent = list:removeAt(index)
            local basicTerrainInfo = terrainEvent:getBasicTerrainInfo()
            local angle = basicTerrainInfo:getAngle()
            if angle == self.DOWN then
                self:nextDirection()
                if not self.isFollowLimitedByTerrain then
                    self.logUtil:putF("Following Limited", self, "onTerrainEvent")
                    self.isFollowLimitedByTerrain = true
                end
            end
        end
end

return TerrainPatrolAI


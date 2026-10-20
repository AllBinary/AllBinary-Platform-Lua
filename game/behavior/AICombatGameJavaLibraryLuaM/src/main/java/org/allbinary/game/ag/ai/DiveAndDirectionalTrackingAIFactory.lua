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

local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local BasicRandomAIFactory = require("org.allbinary.game.ag.ai.tactical.BasicRandomAIFactory")
local ArtificialIntelligenceInterfaceFactoryInterface = require("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
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

local DiveAndDirectionalTrackingAIFactory = {}
DiveAndDirectionalTrackingAIFactory.__index = DiveAndDirectionalTrackingAIFactory
DiveAndDirectionalTrackingAIFactory.className = "DiveAndDirectionalTrackingAIFactory"

function DiveAndDirectionalTrackingAIFactory.new()
    local self = setmetatable({}, DiveAndDirectionalTrackingAIFactory)
    return self
end


-- throws Exception
function DiveAndDirectionalTrackingAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local visitorCanBeNull = hashtable:get(BasicAI.AI_VISITOR)
        if visitorCanBeNull == nil then
            visitorCanBeNull = ThrustAIVisitorFactory.getInstance()
        end
        local hashtable2 = BasicProbabilityAIDataFactory.new():getInstance()
        hashtable2:put(BasicAI.AI_VISITOR, LastKeyAIVisitorFactory.getInstance())
        local artificialIntelligenceInterface = BasicRandomAIFactory.new():getInstance(hashtable2, ownerLayerInterface, gameInput)
        return DiveAndDirectionalTrackingAI.new(ownerLayerInterface, artificialIntelligenceInterface, gameInput, visitorCanBeNull)
end

return DiveAndDirectionalTrackingAIFactory


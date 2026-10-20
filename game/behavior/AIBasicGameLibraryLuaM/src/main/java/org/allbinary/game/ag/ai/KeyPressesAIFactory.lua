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
local ArtificialIntelligenceInterfaceFactoryInterface = require("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
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

local KeyPressesAIFactory = {}
KeyPressesAIFactory.__index = KeyPressesAIFactory
KeyPressesAIFactory.className = "KeyPressesAIFactory"

function KeyPressesAIFactory.new()
    local self = setmetatable({}, KeyPressesAIFactory)
    return self
end


-- throws Exception
function KeyPressesAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local isSingleKeyProcessing = InputFeatureFactory.getInstance():isSingleKeyProcessing()
        if isSingleKeyProcessing then
            return KeyPressesAI.new(hashtable, ownerLayerInterface, gameInput)
        else
            return MultiKeyPressesAI.new(hashtable, ownerLayerInterface, gameInput)
        end
end

return KeyPressesAIFactory


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
-- package org.allbinary.game.ag.ai.sequence

local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SequenceAI = require("org.allbinary.game.ag.ai.sequence.SequenceAI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NumberLayersSequenceAI = {}
NumberLayersSequenceAI.__index = NumberLayersSequenceAI
NumberLayersSequenceAI.className = "NumberLayersSequenceAI"
setmetatable(NumberLayersSequenceAI, {__index = SequenceAI})

function NumberLayersSequenceAI:_init_fields()
    self.numberOfLayersLeft = nil
end


function NumberLayersSequenceAI.new(numberOfEnemiesLeft, artificialIntelligenceInterface, ownerLayerInterface, gameInput)
    local self = setmetatable(SequenceAI.new(artificialIntelligenceInterface, ownerLayerInterface, gameInput), NumberLayersSequenceAI)
    self:_init_fields()
        -- super(...) made self above
        self.numberOfLayersLeft = numberOfEnemiesLeft
    return self
end


-- throws Exception
function NumberLayersSequenceAI:processAI(allBinaryLayerManager)
        if self:getIndex() == 0 then
            if allBinaryLayerManager:getSize() < self.numberOfLayersLeft then
                self:setIndex(1)
            end
        end
        SequenceAI.processAI(self, allBinaryLayerManager)
end

return NumberLayersSequenceAI


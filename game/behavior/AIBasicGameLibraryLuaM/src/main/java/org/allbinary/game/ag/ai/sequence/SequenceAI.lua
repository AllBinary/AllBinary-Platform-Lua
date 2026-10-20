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

local ArtificialIntelligence = require("org.allbinary.ai.ArtificialIntelligence")
local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local ArtificialIntelligenceTransitionInterface = require("org.allbinary.ai.ArtificialIntelligenceTransitionInterface")
local ArrayAI = require("org.allbinary.game.ag.ai.ArrayAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SequenceAI = {}
SequenceAI.__index = SequenceAI
SequenceAI.className = "SequenceAI"
setmetatable(SequenceAI, {__index = ArrayAI})

function SequenceAI:_init_fields()
    self.index = 0
end


function SequenceAI.new(artificialIntelligenceInterfaceArray, ownerLayerInterface, gameInput)
    local self = setmetatable(ArrayAI.new(artificialIntelligenceInterfaceArray, ownerLayerInterface, gameInput), SequenceAI)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function SequenceAI:processAI(allBinaryLayerManager)
        self:getArtificialIntelligenceInterface()[self.index + 1]:processAI(allBinaryLayerManager)
end


function SequenceAI:next()
        self.index = self.index + 1
        local artificialIntelligenceInterface = self:getSelectedArtificialIntelligenceInterface()
        if artificialIntelligenceInterface:getId() == ArtificialIntelligence.AI_ID then
            local artificialIntelligenceTransitionInterface = artificialIntelligenceInterface
            artificialIntelligenceTransitionInterface:transition()
        end
end


function SequenceAI:getIndex()
        return self.index
end


function SequenceAI:setIndex(index)
        self.index = index
end


function SequenceAI:getSelectedArtificialIntelligenceInterface()
        return self:getArtificialIntelligenceInterface()[self.index + 1]
end


function SequenceAI:getName()
        return SequenceAI.SEQUENCE_AI
end


function SequenceAI:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(ArrayAI))
        stringBuffer:append(" Selected AI: ")
        stringBuffer:append(StringUtil.getInstance():toString(self:getSelectedArtificialIntelligenceInterface()))
        return tostring(stringBuffer)
end
SequenceAI.__tostring = function(self) return self:toString() end

SequenceAI.SEQUENCE_AI = "Sequence AI"

return SequenceAI


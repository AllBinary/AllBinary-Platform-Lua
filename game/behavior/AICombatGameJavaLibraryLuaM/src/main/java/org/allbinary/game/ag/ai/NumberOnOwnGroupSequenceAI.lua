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
local SequenceAI = require("org.allbinary.game.ag.ai.sequence.SequenceAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local GroupLayerManagerListener = require("org.allbinary.game.layer.identification.GroupLayerManagerListener")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NumberOnOwnGroupSequenceAI = {}
NumberOnOwnGroupSequenceAI.__index = NumberOnOwnGroupSequenceAI
NumberOnOwnGroupSequenceAI.className = "NumberOnOwnGroupSequenceAI"
setmetatable(NumberOnOwnGroupSequenceAI, {__index = SequenceAI})

function NumberOnOwnGroupSequenceAI:_init_fields()
    self.numberOnSameTeam = nil
end


function NumberOnOwnGroupSequenceAI.new(numberOnSameTeam, artificialIntelligenceInterface, ownerLayerInterface, gameInput)
    local self = setmetatable(SequenceAI.new(artificialIntelligenceInterface, ownerLayerInterface, gameInput), NumberOnOwnGroupSequenceAI)
    self:_init_fields()
        -- super(...) made self above
        self.numberOnSameTeam = numberOnSameTeam
    return self
end


-- throws Exception
function NumberOnOwnGroupSequenceAI:processAI(allBinaryLayerManager)
        local layerInterface = self:getOwnerLayerInterface()
        local index = self:getIndex()
        if (self.numberOnSameTeam.n or #self.numberOnSameTeam) > index then
            local size = GroupLayerManagerListener.getInstance():getGroupSizeFromInterface(layerInterface)
            if math.tointeger(self.numberOnSameTeam[index + 1] // 1) > size then
                self:next()
            end
        end
        SequenceAI.processAI(self, allBinaryLayerManager)
end

return NumberOnOwnGroupSequenceAI


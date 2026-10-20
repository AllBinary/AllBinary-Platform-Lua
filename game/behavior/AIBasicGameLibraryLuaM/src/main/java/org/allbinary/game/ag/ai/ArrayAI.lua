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
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicAI = require("org.allbinary.game.ai.BasicAI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ArrayAI = {}
ArrayAI.__index = ArrayAI
ArrayAI.className = "ArrayAI"
setmetatable(ArrayAI, {__index = BasicAI})

function ArrayAI:_init_fields()
    self.artificialIntelligenceInterfaceArray = nil
end


function ArrayAI.new(artificialIntelligenceInterface, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), ArrayAI)
    self:_init_fields()
        -- super(...) made self above
        self.artificialIntelligenceInterfaceArray = artificialIntelligenceInterface
    return self
end


-- throws Exception
function ArrayAI:processAI(allBinaryLayerManager)
        local size = (self.artificialIntelligenceInterfaceArray.n or #self.artificialIntelligenceInterfaceArray)
        for index = 0, size - 1 do
            self.artificialIntelligenceInterfaceArray[index + 1]:processAI(allBinaryLayerManager)
        end
end


function ArrayAI:getArtificialIntelligenceInterface()
        return self.artificialIntelligenceInterfaceArray
end

return ArrayAI


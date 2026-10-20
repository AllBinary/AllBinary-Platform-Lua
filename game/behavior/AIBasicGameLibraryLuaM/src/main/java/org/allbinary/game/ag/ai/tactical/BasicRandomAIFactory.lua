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
-- package org.allbinary.game.ag.ai.tactical

local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local ArtificialIntelligenceInterfaceFactoryInterface = require("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local InputProbability = require("org.allbinary.game.ag.ai.InputProbability")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local ABHashtable = require("org.allbinary.util.ABHashtable")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicRandomAIFactory = {}
BasicRandomAIFactory.__index = BasicRandomAIFactory
BasicRandomAIFactory.className = "BasicRandomAIFactory"

function BasicRandomAIFactory.new()
    local self = setmetatable({}, BasicRandomAIFactory)
    return self
end


-- throws Exception
function BasicRandomAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local visitor = hashtable:get(BasicAI.AI_VISITOR)
        if visitor == nil then
            error(java_exception("Exception", "No Visitor Provided"), 0)
        end
        local inputProbability = hashtable:get(InputProbability.INPUT_PROBABILITY)
        return BasicRandomAI.new(ownerLayerInterface, gameInput, inputProbability, visitor)
end

return BasicRandomAIFactory


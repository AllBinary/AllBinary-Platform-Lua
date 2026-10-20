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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local NumberOnOwnGroupSequenceAIFactory = {}
NumberOnOwnGroupSequenceAIFactory.__index = NumberOnOwnGroupSequenceAIFactory
NumberOnOwnGroupSequenceAIFactory.className = "NumberOnOwnGroupSequenceAIFactory"

function NumberOnOwnGroupSequenceAIFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function NumberOnOwnGroupSequenceAIFactory.new()
    local self = setmetatable({}, NumberOnOwnGroupSequenceAIFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function NumberOnOwnGroupSequenceAIFactory:getInstance(hashtable, artificialIntelligenceInterface, ownerLayerInterface, gameInput)
        local integerArray = NumberInSameGroupSequence.getInstance().NUMBER_ON_SAME_TEAM_SEQUENCE
        local list = BasicArrayListD.new()
        for index = 0, (integerArray.n or #integerArray) - 1 do
            local integerCanBeNull = hashtable:get(integerArray[index + 1])
            if integerCanBeNull == nil then
                break
            end
            list:add(integerCanBeNull)
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Total AI Properties: ")
        stringBuffer:appendint(list:size())
        stringBuffer:append(" == Total AI: ")
        stringBuffer:appendint((artificialIntelligenceInterface.n or #artificialIntelligenceInterface))
        stringBuffer:append(" + 1")
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.GET_INSTANCE)
        if (artificialIntelligenceInterface.n or #artificialIntelligenceInterface) - 1 > list:size() then
            error(java_exception("Exception", "Not enough AI properties."), 0)
        end
        if (artificialIntelligenceInterface.n or #artificialIntelligenceInterface) - 1 < list:size() then
            error(java_exception("Exception", "Too Many AI properties."), 0)
        end
        local numberOnSameTeam = java_new_array(nil, list:size())
        for index = 0, (numberOnSameTeam.n or #numberOnSameTeam) - 1 do
            numberOnSameTeam[index + 1] = list.objectArray[index + 1]
        end
        return NumberOnOwnGroupSequenceAI.new(numberOnSameTeam, artificialIntelligenceInterface, ownerLayerInterface, gameInput)
end

return NumberOnOwnGroupSequenceAIFactory


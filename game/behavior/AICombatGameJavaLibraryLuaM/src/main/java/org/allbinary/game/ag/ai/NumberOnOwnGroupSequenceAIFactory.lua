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

local NumberOnOwnGroupSequenceAIFactory = {}
package.loaded["org.allbinary.game.ag.ai.NumberOnOwnGroupSequenceAIFactory"] = NumberOnOwnGroupSequenceAIFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ArtificialIntelligenceInterface = java_lazy("org.allbinary.ai.ArtificialIntelligenceInterface")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local NumberInSameGroupSequence = java_lazy("org.allbinary.game.ag.ai.NumberInSameGroupSequence")
local NumberOnOwnGroupSequenceAI = java_lazy("org.allbinary.game.ag.ai.NumberOnOwnGroupSequenceAI")

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

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table NumberOnOwnGroupSequenceAIFactory is declared before the requires
NumberOnOwnGroupSequenceAIFactory.__index = NumberOnOwnGroupSequenceAIFactory
NumberOnOwnGroupSequenceAIFactory.className = "NumberOnOwnGroupSequenceAIFactory"
NumberOnOwnGroupSequenceAIFactory.javaClassName = "org.allbinary.game.ag.ai.NumberOnOwnGroupSequenceAIFactory"

function NumberOnOwnGroupSequenceAIFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function NumberOnOwnGroupSequenceAIFactory._jinit(self)
    NumberOnOwnGroupSequenceAIFactory._init_fields(self)
    return self
end

function NumberOnOwnGroupSequenceAIFactory.new()
    return NumberOnOwnGroupSequenceAIFactory._jinit(setmetatable({}, NumberOnOwnGroupSequenceAIFactory))
end


-- throws Exception
function NumberOnOwnGroupSequenceAIFactory:getInstance(hashtable, artificialIntelligenceInterface, ownerLayerInterface, gameInput)
        local integerArray = NumberInSameGroupSequence.getInstance().NUMBER_ON_SAME_TEAM_SEQUENCE
        local list = BasicArrayListD.new()
        for index = 0, (integerArray.n or #integerArray) - 1 do
            local integerCanBeNull = hashtable:get(integerArray[index + 1])
            if rawequal(integerCanBeNull, nil) then
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
            error(require("java.lang.Exception").new("Not enough AI properties."), 0)
        end
        if (artificialIntelligenceInterface.n or #artificialIntelligenceInterface) - 1 < list:size() then
            error(require("java.lang.Exception").new("Too Many AI properties."), 0)
        end
        local numberOnSameTeam = java_new_array(nil, list:size())
        for index = 0, (numberOnSameTeam.n or #numberOnSameTeam) - 1 do
            numberOnSameTeam[index + 1] = list.objectArray[index + 1]
        end
        return NumberOnOwnGroupSequenceAI.new(numberOnSameTeam, artificialIntelligenceInterface, ownerLayerInterface, gameInput)
end

return NumberOnOwnGroupSequenceAIFactory


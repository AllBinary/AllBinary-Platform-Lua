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

local BasicRandomAIFactory = {}
package.loaded["org.allbinary.game.ag.ai.tactical.BasicRandomAIFactory"] = BasicRandomAIFactory

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
local ArtificialIntelligenceInterfaceFactoryInterface = java_lazy("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local BasicAI = java_lazy("org.allbinary.game.ai.BasicAI")
local InputProbability = java_lazy("org.allbinary.game.ag.ai.InputProbability")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicRandomAI = java_lazy("org.allbinary.game.ag.ai.tactical.BasicRandomAI")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicRandomAIFactory is declared before the requires
BasicRandomAIFactory.__index = BasicRandomAIFactory
BasicRandomAIFactory.className = "BasicRandomAIFactory"
BasicRandomAIFactory.javaClassName = "org.allbinary.game.ag.ai.tactical.BasicRandomAIFactory"
BasicRandomAIFactory.java_implements = " ArtificialIntelligenceInterfaceFactoryInterface "
BasicRandomAIFactory.java_interfaces = function() return {ArtificialIntelligenceInterfaceFactoryInterface} end

function BasicRandomAIFactory._jinit(self)
    return self
end

function BasicRandomAIFactory.new()
    return BasicRandomAIFactory._jinit(setmetatable({}, BasicRandomAIFactory))
end


-- throws Exception
function BasicRandomAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local visitor = hashtable:get(BasicAI.AI_VISITOR)
        if visitor == nil then
            error(require("java.lang.Exception").new("No Visitor Provided"), 0)
        end
        local inputProbability = hashtable:get(InputProbability.INPUT_PROBABILITY)
        return BasicRandomAI.new(ownerLayerInterface, gameInput, inputProbability, visitor)
end

return BasicRandomAIFactory


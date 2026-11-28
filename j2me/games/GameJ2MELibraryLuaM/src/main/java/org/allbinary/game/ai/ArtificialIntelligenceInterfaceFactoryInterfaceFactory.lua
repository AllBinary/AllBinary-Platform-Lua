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
-- package org.allbinary.game.ai

local ArtificialIntelligenceInterfaceFactoryInterfaceFactory = {}
package.loaded["org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory"] = ArtificialIntelligenceInterfaceFactoryInterfaceFactory

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

local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local ArtificialIntelligenceInterfaceFactoryInterface = java_lazy("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local BasicAI = java_lazy("org.allbinary.game.ai.BasicAI")

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

-- class table ArtificialIntelligenceInterfaceFactoryInterfaceFactory is declared before the requires
ArtificialIntelligenceInterfaceFactoryInterfaceFactory.__index = ArtificialIntelligenceInterfaceFactoryInterfaceFactory
ArtificialIntelligenceInterfaceFactoryInterfaceFactory.className = "ArtificialIntelligenceInterfaceFactoryInterfaceFactory"
ArtificialIntelligenceInterfaceFactoryInterfaceFactory.javaClassName = "org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterfaceFactory"

function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:_init_fields()
    self.list = BasicArrayListUtil.getInstance():getImmutableInstance()
end

function ArtificialIntelligenceInterfaceFactoryInterfaceFactory._jinit(self)
    ArtificialIntelligenceInterfaceFactoryInterfaceFactory._init_fields(self)
    return self
end

function ArtificialIntelligenceInterfaceFactoryInterfaceFactory.new()
    return ArtificialIntelligenceInterfaceFactoryInterfaceFactory._jinit(setmetatable({}, ArtificialIntelligenceInterfaceFactoryInterfaceFactory))
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:clear()
        self.list = BasicArrayListD.new()
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance()
        return ArtificialIntelligenceInterfaceFactoryInterfaceFactory.SINGLETON
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:getInstanceFromCollection(hashtable)
        local typeInteger = hashtable:get(BasicAI.ID)
        local type = require("allbinary_java").number_value(typeInteger, "intValue")
        local artificialIntelligenceInterfaceFactoryInterface = self.list.objectArray[type - 1 + 1]
        return artificialIntelligenceInterfaceFactoryInterface
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:add(artificialIntelligenceInterfaceFactoryInterface)
        self.list:add(artificialIntelligenceInterfaceFactoryInterface)
end

ArtificialIntelligenceInterfaceFactoryInterfaceFactory.SINGLETON = ArtificialIntelligenceInterfaceFactoryInterfaceFactory.new()

return ArtificialIntelligenceInterfaceFactoryInterfaceFactory


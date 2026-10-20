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

local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ArtificialIntelligenceInterfaceFactoryInterfaceFactory = {}
ArtificialIntelligenceInterfaceFactoryInterfaceFactory.__index = ArtificialIntelligenceInterfaceFactoryInterfaceFactory
ArtificialIntelligenceInterfaceFactoryInterfaceFactory.className = "ArtificialIntelligenceInterfaceFactoryInterfaceFactory"

function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:_init_fields()
    self.list = BasicArrayListUtil.getInstance():getImmutableInstance()
end

function ArtificialIntelligenceInterfaceFactoryInterfaceFactory.new()
    local self = setmetatable({}, ArtificialIntelligenceInterfaceFactoryInterfaceFactory)
    self:_init_fields()
    return self
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:clear()
        self.list = BasicArrayListD.new()
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory.getInstance()
        return ArtificialIntelligenceInterfaceFactoryInterfaceFactory.SINGLETON
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:getInstanceFromCollection(hashtable)
        local typeInteger = hashtable:get(BasicAI.ID)
        local type = math.tointeger(typeInteger // 1)
        local artificialIntelligenceInterfaceFactoryInterface = self.list.objectArray[type - 1 + 1]
        return artificialIntelligenceInterfaceFactoryInterface
end


function ArtificialIntelligenceInterfaceFactoryInterfaceFactory:add(artificialIntelligenceInterfaceFactoryInterface)
        self.list:add(artificialIntelligenceInterfaceFactoryInterface)
end

ArtificialIntelligenceInterfaceFactoryInterfaceFactory.SINGLETON = ArtificialIntelligenceInterfaceFactoryInterfaceFactory.new()

return ArtificialIntelligenceInterfaceFactoryInterfaceFactory


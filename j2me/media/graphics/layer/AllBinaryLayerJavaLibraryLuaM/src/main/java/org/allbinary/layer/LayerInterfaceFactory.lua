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
-- package org.allbinary.layer

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local LayerInterfaceFactory = {}
LayerInterfaceFactory.__index = LayerInterfaceFactory
LayerInterfaceFactory.className = "LayerInterfaceFactory"

function LayerInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.HASHTABLE_LABEL = "Hashtable: "
end

function LayerInterfaceFactory.new()
    local self = setmetatable({}, LayerInterfaceFactory)
    self:_init_fields()
    return self
end


function LayerInterfaceFactory.getInstance()
        return LayerInterfaceFactory.SINGLETON
end


function LayerInterfaceFactory:init()
        self.list = BasicArrayListD.new()
end


-- throws Exception
function LayerInterfaceFactory:getNexInstance(hashtable, x, y, z)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append(self.HASHTABLE_LABEL):append(StringUtil.getInstance():toString(hashtable))), self, commonStrings.GET_INSTANCE)
        local typeInteger = hashtable:get(Layer.ID)
        local layerInterfaceFactoryInterface = self.list.objectArray[math.tointeger(typeInteger // 1) - 1 + 1]
        return layerInterfaceFactoryInterface:getNextInstance(hashtable, x, y, z)
end


function LayerInterfaceFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end

LayerInterfaceFactory.SINGLETON = LayerInterfaceFactory.new()

return LayerInterfaceFactory


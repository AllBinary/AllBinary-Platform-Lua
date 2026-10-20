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
-- package org.allbinary.game.part

local CountedPickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local CountedPickedUpLayerInterfaceFactoryPool = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryPool")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

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

local MakeCountedPartsSingletonArrayFactory = {}
MakeCountedPartsSingletonArrayFactory.__index = MakeCountedPartsSingletonArrayFactory
MakeCountedPartsSingletonArrayFactory.className = "MakeCountedPartsSingletonArrayFactory"

function MakeCountedPartsSingletonArrayFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.list = BasicArrayListUtil.getInstance():getImmutableInstance()
end

function MakeCountedPartsSingletonArrayFactory.new()
    local self = setmetatable({}, MakeCountedPartsSingletonArrayFactory)
    self:_init_fields()
    return self
end


function MakeCountedPartsSingletonArrayFactory.getInstance()
        return MakeCountedPartsSingletonArrayFactory.instance
end


-- throws Exception
function MakeCountedPartsSingletonArrayFactory:getUpdated(partInterfaceArray)
        self.list = BasicArrayListD.new()
        for index = 0, (partInterfaceArray.n or #partInterfaceArray) - 1 do
            self.list:add(partInterfaceArray[index + 1])
        end
        local countedBasicArrayList = CountedPickedUpLayerInterfaceFactoryPool.getInstance():getList()
        local layerInterfaceFactoryInterface = nil
        local size = countedBasicArrayList:size()
        for index = 0, size - 1 do
            layerInterfaceFactoryInterface = countedBasicArrayList.objectArray[index + 1]
            self.list:add(CountedLayerInterfaceFactoryPart.new(0, layerInterfaceFactoryInterface))
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Total Parts: ")
        stringBuffer:appendint(self.list:size())
        stringBuffer:append(" Counted: ")
        stringBuffer:appendint(countedBasicArrayList:size())
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.GET_INSTANCE)
        local newPartInterfaceArray = java_new_array(nil, self.list:size())
        local newSize = (newPartInterfaceArray.n or #newPartInterfaceArray)
        for index = 0, newSize - 1 do
            newPartInterfaceArray[index + 1] = self.list:get(index)
        end
        return newPartInterfaceArray
end

MakeCountedPartsSingletonArrayFactory.instance = MakeCountedPartsSingletonArrayFactory.new()

return MakeCountedPartsSingletonArrayFactory


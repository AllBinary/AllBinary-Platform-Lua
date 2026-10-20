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
-- package org.allbinary.game.layer.drop

local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
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

local DropLayerFactory = {}
DropLayerFactory.__index = DropLayerFactory
DropLayerFactory.className = "DropLayerFactory"

function DropLayerFactory:_init_fields()
    self.list = BasicArrayListD.new()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function DropLayerFactory.new()
    local self = setmetatable({}, DropLayerFactory)
    self:_init_fields()
    return self
end


function DropLayerFactory:clear()
        self.list:clear()
end


function DropLayerFactory.getInstance()
        return DropLayerFactory.DROP_LAYER_FACTORY
end


function DropLayerFactory:getSize()
        return self.list:size()
end


function DropLayerFactory:getRandomInstance()
        return self.basicArrayListUtil:getRandom(self.list)
end


function DropLayerFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end


function DropLayerFactory:getList()
        return self.list
end

DropLayerFactory.DROP_LAYER_FACTORY = DropLayerFactory.new()

return DropLayerFactory


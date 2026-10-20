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
-- package org.allbinary.game.layer.pickup

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CountedPickedUpLayerInterfaceFactoryPool = {}
CountedPickedUpLayerInterfaceFactoryPool.__index = CountedPickedUpLayerInterfaceFactoryPool
CountedPickedUpLayerInterfaceFactoryPool.className = "CountedPickedUpLayerInterfaceFactoryPool"

function CountedPickedUpLayerInterfaceFactoryPool:_init_fields()
    self.list = nil
end


function CountedPickedUpLayerInterfaceFactoryPool.new()
    local self = setmetatable({}, CountedPickedUpLayerInterfaceFactoryPool)
    self:_init_fields()
        self.list = BasicArrayListD.new()
    return self
end


function CountedPickedUpLayerInterfaceFactoryPool:getList()
        return self.list
end


function CountedPickedUpLayerInterfaceFactoryPool.getInstance()
        return CountedPickedUpLayerInterfaceFactoryPool.SINGLETON
end


function CountedPickedUpLayerInterfaceFactoryPool.init()
        CountedPickedUpLayerInterfaceFactoryPool.SINGLETON = CountedPickedUpLayerInterfaceFactoryPool.new()
end

CountedPickedUpLayerInterfaceFactoryPool.SINGLETON = CountedPickedUpLayerInterfaceFactoryPool.new()

return CountedPickedUpLayerInterfaceFactoryPool


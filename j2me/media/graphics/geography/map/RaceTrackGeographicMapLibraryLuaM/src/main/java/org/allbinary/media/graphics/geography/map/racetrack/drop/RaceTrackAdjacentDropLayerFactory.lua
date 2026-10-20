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
-- package org.allbinary.media.graphics.geography.map.racetrack.drop

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local LayerInterfaceFactoryInterface = require("org.allbinary.layer.LayerInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RaceTrackAdjacentDropLayerFactory = {}
RaceTrackAdjacentDropLayerFactory.__index = RaceTrackAdjacentDropLayerFactory
RaceTrackAdjacentDropLayerFactory.className = "RaceTrackAdjacentDropLayerFactory"

function RaceTrackAdjacentDropLayerFactory:_init_fields()
    self.list = BasicArrayListD.new()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function RaceTrackAdjacentDropLayerFactory.new()
    local self = setmetatable({}, RaceTrackAdjacentDropLayerFactory)
    self:_init_fields()
    return self
end


function RaceTrackAdjacentDropLayerFactory:clear()
        self.list:clear()
end


function RaceTrackAdjacentDropLayerFactory.getInstance()
        return RaceTrackAdjacentDropLayerFactory.DROP_LAYER_FACTORY
end


function RaceTrackAdjacentDropLayerFactory:getSize()
        return self.list:size()
end


function RaceTrackAdjacentDropLayerFactory:getRandomInstance()
        return self.basicArrayListUtil:getRandom(self.list)
end


function RaceTrackAdjacentDropLayerFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end

RaceTrackAdjacentDropLayerFactory.DROP_LAYER_FACTORY = RaceTrackAdjacentDropLayerFactory.new()

return RaceTrackAdjacentDropLayerFactory


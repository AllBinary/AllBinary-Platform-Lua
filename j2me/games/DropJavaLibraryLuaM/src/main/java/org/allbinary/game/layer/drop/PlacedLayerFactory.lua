-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.drop

local AllBinaryLayerFactoryInterface = require("org.allbinary.layer.AllBinaryLayerFactoryInterface")
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

local PlacedLayerFactory = {}
PlacedLayerFactory.__index = PlacedLayerFactory
PlacedLayerFactory.className = "PlacedLayerFactory"

function PlacedLayerFactory:_init_fields()
    self.list = BasicArrayListD.new()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function PlacedLayerFactory.new()
    local self = setmetatable({}, PlacedLayerFactory)
    self:_init_fields()
    return self
end


function PlacedLayerFactory:clear()
        self.list:clear()
end


function PlacedLayerFactory.getInstance()
        return PlacedLayerFactory.instance
end


function PlacedLayerFactory:getSize()
        return self.list:size()
end


function PlacedLayerFactory:getRandomInstance()
        return self.basicArrayListUtil:getRandom(self.list)
end


function PlacedLayerFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end

PlacedLayerFactory.instance = PlacedLayerFactory.new()

return PlacedLayerFactory


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

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PickedUpLayerTypeFactory = {}
PickedUpLayerTypeFactory.__index = PickedUpLayerTypeFactory
PickedUpLayerTypeFactory.className = "PickedUpLayerTypeFactory"

function PickedUpLayerTypeFactory:_init_fields()
    self.NONE = PickedUpLayerType.new(StringUtil.getInstance().NULL_STRING)
    self.BEAM = PickedUpLayerType.new("BEAM")
    self.MINE = PickedUpLayerType.new("MINE")
    self.PROJECTILE = PickedUpLayerType.new("PROJECTILE")
    self.ENHANCEMENT = PickedUpLayerType.new("Enhancement")
    self.MORPH = PickedUpLayerType.new("Morph")
    self.PART = PickedUpLayerType.new("Part")
    self.HEAL = PickedUpLayerType.new("Heal")
    self.LIFE = PickedUpLayerType.new("Life")
    self.POINTS = PickedUpLayerType.new("Points")
end

function PickedUpLayerTypeFactory.new()
    local self = setmetatable({}, PickedUpLayerTypeFactory)
    self:_init_fields()
    return self
end


function PickedUpLayerTypeFactory.getInstance()
        return PickedUpLayerTypeFactory.instance
end

PickedUpLayerTypeFactory.instance = PickedUpLayerTypeFactory.new()

return PickedUpLayerTypeFactory


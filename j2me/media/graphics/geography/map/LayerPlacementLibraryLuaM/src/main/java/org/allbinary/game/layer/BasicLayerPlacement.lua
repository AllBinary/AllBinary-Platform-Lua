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
-- package org.allbinary.game.layer


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicLayerPlacement = {}
BasicLayerPlacement.__index = BasicLayerPlacement
BasicLayerPlacement.className = "BasicLayerPlacement"

function BasicLayerPlacement:_init_fields()
    self.layerType = nil
    self.width = nil
    self.height = nil
end


function BasicLayerPlacement.new(layerType, width, height)
    local self = setmetatable({}, BasicLayerPlacement)
    self:_init_fields()
        self.layerType = layerType
        self.width = width
        self.height = height
    return self
end


function BasicLayerPlacement:getWidth()
        return self.width
end


function BasicLayerPlacement:getHeight()
        return self.height
end


function BasicLayerPlacement:getLayerType()
        return self.layerType
end


function BasicLayerPlacement:setLayerType(layerType)
        self.layerType = layerType
end

return BasicLayerPlacement


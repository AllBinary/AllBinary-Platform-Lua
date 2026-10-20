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

local LayerPlacementType = {}
LayerPlacementType.__index = LayerPlacementType
LayerPlacementType.className = "LayerPlacementType"

function LayerPlacementType:_init_fields()
    self.type = nil
end


function LayerPlacementType.new(type)
    local self = setmetatable({}, LayerPlacementType)
    self:_init_fields()
        self.type = type
    return self
end


function LayerPlacementType:getType()
        return self.type
end


function LayerPlacementType:setType(type)
        self.type = type
end

return LayerPlacementType


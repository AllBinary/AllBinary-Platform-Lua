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
-- package org.allbinary.layer.relationship

local GPoint = require("org.allbinary.graphics.GPoint")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RelativeLayerRelationship = {}
RelativeLayerRelationship.__index = RelativeLayerRelationship
RelativeLayerRelationship.className = "RelativeLayerRelationship"
setmetatable(RelativeLayerRelationship, {__index = RelativeRelationship})

function RelativeLayerRelationship:_init_fields()
    self.layer = AllBinaryLayer.NULL_ALLBINARY_LAYER
end


function RelativeLayerRelationship.new(layer, point, typesAllowedList)
    local self = setmetatable(RelativeRelationship.new(point, typesAllowedList), RelativeLayerRelationship)
    self:_init_fields()
        -- super(...) made self above
        self.layer = layer
    return self
end


function RelativeLayerRelationship:getX()
        return self.layer:getXP() + RelativeRelationship.getX(self)
end


function RelativeLayerRelationship:getY()
        return self.layer:getYP() + RelativeRelationship.getY(self)
end


function RelativeLayerRelationship:getZ()
        return self.layer:getZP() + RelativeRelationship.getZ(self)
end

return RelativeLayerRelationship


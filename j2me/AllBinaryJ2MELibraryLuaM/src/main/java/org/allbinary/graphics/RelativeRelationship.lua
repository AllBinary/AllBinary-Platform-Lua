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
-- package org.allbinary.graphics

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
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

local RelativeRelationship = {}
RelativeRelationship.__index = RelativeRelationship
RelativeRelationship.className = "RelativeRelationship"

function RelativeRelationship:_init_fields()
    self.typesAllowedList = nil
    self.x = nil
    self.y = nil
    self.z = nil
end


function RelativeRelationship.new(point, typesAllowedList)
    local self = setmetatable({}, RelativeRelationship)
    self:_init_fields()
        self.x = point:getX()
        self.y = point:getY()
        self.z = point:getZ()
        self.typesAllowedList = typesAllowedList
    return self
end


function RelativeRelationship:getX()
        return self.x
end


function RelativeRelationship:getY()
        return self.y
end


function RelativeRelationship:getZ()
        return self.z
end


function RelativeRelationship:getTypesAllowedList()
        return self.typesAllowedList
end


function RelativeRelationship:setTypesAllowedList(typesAllowedList)
        self.typesAllowedList = typesAllowedList
end

RelativeRelationship.NULL_RELATIVE_RELATIONSHIP = RelativeRelationship.new(PointFactory.getInstance().ZERO_ZERO, BasicArrayListUtil.getInstance():getImmutableInstance())

return RelativeRelationship


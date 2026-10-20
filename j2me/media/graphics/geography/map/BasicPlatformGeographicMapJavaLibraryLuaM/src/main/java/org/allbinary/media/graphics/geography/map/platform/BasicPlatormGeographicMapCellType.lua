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
-- package org.allbinary.media.graphics.geography.map.platform

local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

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

local BasicPlatormGeographicMapCellType = {}
BasicPlatormGeographicMapCellType.__index = BasicPlatormGeographicMapCellType
BasicPlatormGeographicMapCellType.className = "BasicPlatormGeographicMapCellType"

function BasicPlatormGeographicMapCellType:_init_fields()
    self.types = nil
end


function BasicPlatormGeographicMapCellType.createType(type)
        local types = BasicArrayListS.new(1)
        types:add(SmallIntegerSingletonFactory.getInstance():getAt(type))
        local basicPlatormGeographicMapCellType = BasicPlatormGeographicMapCellType.new(types)
        return basicPlatormGeographicMapCellType
end


function BasicPlatormGeographicMapCellType.new(types)
    local self = setmetatable({}, BasicPlatormGeographicMapCellType)
    self:_init_fields()
        local size = types:size()
        local typeArray = java_new_array(0, size)
        local typeAsInteger = nil
        local type = 0
        for index = 0, size - 1 do
            typeAsInteger = (types:get(index))
            type = math.tointeger(typeAsInteger // 1)
            GeographicMapCellType.new(type, 0)
            typeArray[index + 1] = type
        end
        self.types = typeArray
    return self
end


function BasicPlatormGeographicMapCellType:isType(type)
        return self:hasType(type:getType())
end


function BasicPlatormGeographicMapCellType:hasType(type)
        local size = (self.types.n or #self.types)
        for index = 0, size - 1 do
            if self.types[index + 1] == type then
                return true
            end
        end
        return false
end

return BasicPlatormGeographicMapCellType


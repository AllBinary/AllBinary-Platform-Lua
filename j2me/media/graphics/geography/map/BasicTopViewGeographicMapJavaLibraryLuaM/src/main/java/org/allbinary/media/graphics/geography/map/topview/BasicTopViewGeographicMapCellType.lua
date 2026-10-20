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
-- package org.allbinary.media.graphics.geography.map.topview

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local RaceTrackGeographicMapCellType = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local BasicTopViewGeographicMapCellType = {}
BasicTopViewGeographicMapCellType.__index = BasicTopViewGeographicMapCellType
BasicTopViewGeographicMapCellType.className = "BasicTopViewGeographicMapCellType"

function BasicTopViewGeographicMapCellType:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.name = nil
    self.cost = nil
    self.types = nil
end


function BasicTopViewGeographicMapCellType.createType(name, type, cost)
        local types = BasicArrayListS.new(1)
        types:add(type)
        return BasicTopViewGeographicMapCellType.new(name, types, cost)
end


function BasicTopViewGeographicMapCellType.new(name, types, cost)
    local self = setmetatable({}, BasicTopViewGeographicMapCellType)
    self:_init_fields()
        local size = types:size()
        local typeArray = java_new_array(0, size)
        local typeAsInteger = nil
        local type = 0
        for index = 0, size - 1 do
            typeAsInteger = (types:get(index))
            type = math.tointeger(typeAsInteger // 1)
            if GeographicMapCellTypeFactory.getInstance():getGeographicMapCellTypeArray()[type + 1] == nil then
                RaceTrackGeographicMapCellType.new(name, type, cost, 0)
            else
            end
            typeArray[index + 1] = type
        end
        self.name = name
        self.cost = cost
        self.types = typeArray
    return self
end


function BasicTopViewGeographicMapCellType:isType(type)
        return self:hasType(type:getType())
end


function BasicTopViewGeographicMapCellType:hasType(type)
        local size = (self.types.n or #self.types)
        for index = 0, size - 1 do
            if self.types[index + 1] == type then
                return true
            end
        end
        return false
end


function BasicTopViewGeographicMapCellType:getTypes()
        return self.types
end


function BasicTopViewGeographicMapCellType:toString()
        local stringMaker = StringMaker.new()
        local size = (self.types.n or #self.types)
        for index = 0, size - 1 do
            stringMaker:appendint(self.types[index + 1]):append(CommonSeps.getInstance().COMMA)
        end
        return tostring(stringMaker)
end
BasicTopViewGeographicMapCellType.__tostring = function(self) return self:toString() end

return BasicTopViewGeographicMapCellType


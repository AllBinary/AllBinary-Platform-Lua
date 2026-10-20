-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicTopViewGeographicMapStrings = {}
BasicTopViewGeographicMapStrings.__index = BasicTopViewGeographicMapStrings
BasicTopViewGeographicMapStrings.className = "BasicTopViewGeographicMapStrings"

function BasicTopViewGeographicMapStrings:_init_fields()
    self.DEFAULT = "Default"
    self.OTHER = "Other"
    self.WALL = "Wall"
    self.OFF_MAP = "OffMap"
    self.FLOOR = "Floor"
    self.DOOR = "Door"
    self.STAIRS_UP = "StairsUp"
    self.STAIRS_DOWN = "StairsDown"
end

function BasicTopViewGeographicMapStrings.new()
    local self = setmetatable({}, BasicTopViewGeographicMapStrings)
    self:_init_fields()
    return self
end


function BasicTopViewGeographicMapStrings.getInstance()
        return BasicTopViewGeographicMapStrings.instance
end

BasicTopViewGeographicMapStrings.instance = BasicTopViewGeographicMapStrings.new()

return BasicTopViewGeographicMapStrings


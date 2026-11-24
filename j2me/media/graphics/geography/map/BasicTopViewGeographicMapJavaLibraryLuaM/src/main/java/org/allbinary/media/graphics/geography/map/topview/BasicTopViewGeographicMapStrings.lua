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

local BasicTopViewGeographicMapStrings = {}
package.loaded["org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapStrings"] = BasicTopViewGeographicMapStrings

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicTopViewGeographicMapStrings is declared before the requires
BasicTopViewGeographicMapStrings.__index = BasicTopViewGeographicMapStrings
BasicTopViewGeographicMapStrings.className = "BasicTopViewGeographicMapStrings"
BasicTopViewGeographicMapStrings.javaClassName = "org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapStrings"

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

function BasicTopViewGeographicMapStrings._jinit(self)
    BasicTopViewGeographicMapStrings._init_fields(self)
    return self
end

function BasicTopViewGeographicMapStrings.new()
    return BasicTopViewGeographicMapStrings._jinit(setmetatable({}, BasicTopViewGeographicMapStrings))
end


function BasicTopViewGeographicMapStrings.getInstance()
        return BasicTopViewGeographicMapStrings.instance_f
end

BasicTopViewGeographicMapStrings.instance_f = BasicTopViewGeographicMapStrings.new()

return BasicTopViewGeographicMapStrings


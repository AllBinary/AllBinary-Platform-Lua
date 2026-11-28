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

local BasicTopViewGeographicMapCellType = {}
package.loaded["org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellType"] = BasicTopViewGeographicMapCellType

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table BasicTopViewGeographicMapCellType is declared before the requires
BasicTopViewGeographicMapCellType.__index = BasicTopViewGeographicMapCellType
BasicTopViewGeographicMapCellType.className = "BasicTopViewGeographicMapCellType"
BasicTopViewGeographicMapCellType.javaClassName = "org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellType"

function BasicTopViewGeographicMapCellType:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.cost == nil then self.cost = 0 end
    if self.types == nil then self.types = nil end
end


function BasicTopViewGeographicMapCellType.createType(name, type, cost)
        local types = BasicArrayListS.new(1)
        types:add(type)
        return BasicTopViewGeographicMapCellType.new(name, types, cost)
end


function BasicTopViewGeographicMapCellType._jinit(self, name, types, cost)
    BasicTopViewGeographicMapCellType._init_fields(self)
        local size = types:size()
        local typeArray = java_typed_array("I", java_new_array(0, size))
        local typeAsInteger = nil
        local type = 0
        for index = 0, size - 1 do
            typeAsInteger = (types:get(index))
            type = math.tointeger(typeAsInteger // 1)
            if rawequal(GeographicMapCellTypeFactory.getInstance():getGeographicMapCellTypeArray()[type + 1], nil) then
                RaceTrackGeographicMapCellType.new(name, type, cost, 0)
            else
            end
            typeArray[index + 1] = type
        end
        self.name_f = name
        self.cost = cost
        self.types = typeArray
    return self
end

function BasicTopViewGeographicMapCellType.new(...)
    local self = setmetatable({}, BasicTopViewGeographicMapCellType)
    BasicTopViewGeographicMapCellType._jinit(self, ...)
    return self
end


function BasicTopViewGeographicMapCellType:isType(type)
        return self:hasType(type:getType())
end


function BasicTopViewGeographicMapCellType:hasType(type)
        local size = (self.types.n or #self.types)
        for index = 0, size - 1 do
            if rawequal(self.types[index + 1], type) then
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


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

local BasicPlatormGeographicMapCellType = {}
package.loaded["org.allbinary.media.graphics.geography.map.platform.BasicPlatormGeographicMapCellType"] = BasicPlatormGeographicMapCellType

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

local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
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

-- class table BasicPlatormGeographicMapCellType is declared before the requires
BasicPlatormGeographicMapCellType.__index = BasicPlatormGeographicMapCellType
BasicPlatormGeographicMapCellType.className = "BasicPlatormGeographicMapCellType"
BasicPlatormGeographicMapCellType.javaClassName = "org.allbinary.media.graphics.geography.map.platform.BasicPlatormGeographicMapCellType"

function BasicPlatormGeographicMapCellType:_init_fields()
    if self.types == nil then self.types = nil end
end


function BasicPlatormGeographicMapCellType.createType(type)
        local types = BasicArrayListS.new(1)
        types:add(SmallIntegerSingletonFactory.getInstance():getAt(type))
        local basicPlatormGeographicMapCellType = BasicPlatormGeographicMapCellType.new(types)
        return basicPlatormGeographicMapCellType
end


function BasicPlatormGeographicMapCellType._jinit(self, types)
    BasicPlatormGeographicMapCellType._init_fields(self)
        local size = types:size()
        local typeArray = java_typed_array("I", java_new_array(0, size))
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

function BasicPlatormGeographicMapCellType.new(...)
    local self = setmetatable({}, BasicPlatormGeographicMapCellType)
    BasicPlatormGeographicMapCellType._jinit(self, ...)
    return self
end


function BasicPlatormGeographicMapCellType:isType(type)
        return self:hasType(type:getType())
end


function BasicPlatormGeographicMapCellType:hasType(type)
        local size = (self.types.n or #self.types)
        for index = 0, size - 1 do
            if rawequal(self.types[index + 1], type) then
                return true
            end
        end
        return false
end

return BasicPlatormGeographicMapCellType


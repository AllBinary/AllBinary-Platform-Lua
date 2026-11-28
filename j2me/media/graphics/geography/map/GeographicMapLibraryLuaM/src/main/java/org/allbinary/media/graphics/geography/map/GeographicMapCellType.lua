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
-- package org.allbinary.media.graphics.geography.map

local GeographicMapCellType = {}
package.loaded["org.allbinary.media.graphics.geography.map.GeographicMapCellType"] = GeographicMapCellType

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
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table GeographicMapCellType is declared before the requires
GeographicMapCellType.__index = GeographicMapCellType
GeographicMapCellType.className = "GeographicMapCellType"
GeographicMapCellType.javaClassName = "org.allbinary.media.graphics.geography.map.GeographicMapCellType"

function GeographicMapCellType:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.type == nil then self.type = 0 end
end


function GeographicMapCellType._jinit(self, type, reset)
    GeographicMapCellType._init_fields(self)
        self.type = type
        if not rawequal(type, require("java.lang.Integer").MIN_VALUE) then
            local geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
            local geographicMapCellTypeArray = geographicMapCellTypeFactory:getGeographicMapCellTypeArray()
            if rawequal(geographicMapCellTypeArray[type + 1], nil) or rawequal(reset, 1) then
                geographicMapCellTypeArray[type + 1] = self
            else
                if not rawequal(reset, -1) then
                    error(require("java.lang.RuntimeException").new(), 0)
                end
            end
        end
    return self
end

function GeographicMapCellType.new(...)
    local self = setmetatable({}, GeographicMapCellType)
    GeographicMapCellType._jinit(self, ...)
    return self
end


function GeographicMapCellType:getType()
        return self.type
end


function GeographicMapCellType:toString()
        return tostring(SmallIntegerSingletonFactory.getInstance():getAt(self.type))
end
GeographicMapCellType.__tostring = function(self) return self:toString() end

GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY = java_new_array(nil, 0)
GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE = GeographicMapCellType.new(require("java.lang.Integer").MIN_VALUE, 0)

return GeographicMapCellType


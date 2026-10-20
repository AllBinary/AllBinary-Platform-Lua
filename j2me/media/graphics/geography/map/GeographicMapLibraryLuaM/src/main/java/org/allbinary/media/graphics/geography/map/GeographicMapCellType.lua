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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellType = {}
GeographicMapCellType.__index = GeographicMapCellType
GeographicMapCellType.className = "GeographicMapCellType"

function GeographicMapCellType:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.type = nil
end


function GeographicMapCellType.new(type, reset)
    local self = setmetatable({}, GeographicMapCellType)
    self:_init_fields()
        self.type = type
        if type ~= Integer.MIN_VALUE then
            local geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
            local geographicMapCellTypeArray = geographicMapCellTypeFactory:getGeographicMapCellTypeArray()
            if geographicMapCellTypeArray[type + 1] == nil or reset == 1 then
                geographicMapCellTypeArray[type + 1] = self
            else
                if reset ~= -1 then
                    error(java_exception("RuntimeException"), 0)
                end
            end
        end
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
GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE = GeographicMapCellType.new(Integer.MIN_VALUE, 0)

return GeographicMapCellType


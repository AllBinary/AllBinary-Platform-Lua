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

local GeographicMapCellTypeFactory = {}
GeographicMapCellTypeFactory.__index = GeographicMapCellTypeFactory
GeographicMapCellTypeFactory.className = "GeographicMapCellTypeFactory"

function GeographicMapCellTypeFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.geographicMapCellTypeArray = java_new_array(nil, 512)
end

function GeographicMapCellTypeFactory.new()
    local self = setmetatable({}, GeographicMapCellTypeFactory)
    self:_init_fields()
    return self
end


function GeographicMapCellTypeFactory.getInstance()
        return GeographicMapCellTypeFactory.instance
end


function GeographicMapCellTypeFactory:get(type)
        return self.geographicMapCellTypeArray[type + 1]
end


function GeographicMapCellTypeFactory:getGeographicMapCellTypeArray()
        return self.geographicMapCellTypeArray
end


function GeographicMapCellTypeFactory:getStartType()
        error(java_exception("RuntimeException"), 0)
end


function GeographicMapCellTypeFactory:getEndType()
        error(java_exception("RuntimeException"), 0)
end


function GeographicMapCellTypeFactory:getEmptyType()
        error(java_exception("RuntimeException"), 0)
end


function GeographicMapCellTypeFactory:isPath(cellType)
        error(java_exception("RuntimeException"), 0)
end

GeographicMapCellTypeFactory.instance = GeographicMapCellTypeFactory.new()

return GeographicMapCellTypeFactory


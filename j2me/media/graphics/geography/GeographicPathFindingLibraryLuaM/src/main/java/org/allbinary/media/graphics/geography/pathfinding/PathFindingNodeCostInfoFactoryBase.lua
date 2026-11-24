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
-- package org.allbinary.media.graphics.geography.pathfinding

local PathFindingNodeCostInfoFactoryBase = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase"] = PathFindingNodeCostInfoFactoryBase

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

local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local PathFindingNodeCostInfoFactoryBaseInterface = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBaseInterface")

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

-- class table PathFindingNodeCostInfoFactoryBase is declared before the requires
PathFindingNodeCostInfoFactoryBase.__index = PathFindingNodeCostInfoFactoryBase
PathFindingNodeCostInfoFactoryBase.className = "PathFindingNodeCostInfoFactoryBase"
PathFindingNodeCostInfoFactoryBase.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase"
PathFindingNodeCostInfoFactoryBase.java_implements = " PathFindingNodeCostInfoFactoryBaseInterface "
PathFindingNodeCostInfoFactoryBase.java_interfaces = function() return {PathFindingNodeCostInfoFactoryBaseInterface} end

function PathFindingNodeCostInfoFactoryBase._jinit(self)
    return self
end

function PathFindingNodeCostInfoFactoryBase.new()
    return PathFindingNodeCostInfoFactoryBase._jinit(setmetatable({}, PathFindingNodeCostInfoFactoryBase))
end


-- throws Exception
function PathFindingNodeCostInfoFactoryBase:create(geographicMapInterface, comingFromGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function PathFindingNodeCostInfoFactoryBase:getTotalCost(geographicMapInterface, comingFromGeographicMapCellPosition, geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end

PathFindingNodeCostInfoFactoryBase.NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE = PathFindingNodeCostInfoFactoryBase.new()

return PathFindingNodeCostInfoFactoryBase


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
-- package org.allbinary.media.graphics.geography.pathfinding

local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local PathGeneratorInterface = require("org.allbinary.media.graphics.geography.pathfinding.PathGeneratorInterface")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathGenerator = {}
PathGenerator.__index = PathGenerator
PathGenerator.className = "PathGenerator"


function PathGenerator.getInstance()
        return PathGenerator.SINGLETON
end


function PathGenerator.new()
    local self = setmetatable({}, PathGenerator)
    return self
end


-- throws Exception
function PathGenerator:init(geographicMapInterface, totalPaths)
end


-- throws Exception
function PathGenerator:getInstanceNoCache(geographicMapInterface, pathFindingInfo, totalPaths)
        local geographicMapCellPositionBasicArrayList = self:create(geographicMapInterface, pathFindingInfo, totalPaths)
        return geographicMapCellPositionBasicArrayList
end


-- throws Exception
function PathGenerator:createList(geographicMapInterface, geographicMapCellHistory, pathFindingInfo, totalPaths)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function PathGenerator:create(geographicMapInterface, pathFindingInfo, totalPaths)
        local startPathFindingNodeList = pathFindingInfo:getStartPathFindingNodeList()
        local endPathFindingNodeList = pathFindingInfo:getEndPathFindingNodeList()
        local geographicPathFinderInterface = pathFindingInfo:getPathFinder()
        local geographicMapCellPositionBasicArrayList = geographicPathFinderInterface:searchTotalPath(startPathFindingNodeList, endPathFindingNodeList, totalPaths)
        return geographicMapCellPositionBasicArrayList
end


-- throws Exception
function PathGenerator:createN(geographicMapInterface, pathFindingInfo, totalPaths, multipassState)
        local startPathFindingNodeList = pathFindingInfo:getStartPathFindingNodeList()
        local endPathFindingNodeList = pathFindingInfo:getEndPathFindingNodeList()
        local geographicPathFinderInterface = pathFindingInfo:getPathFinder()
        local geographicMapCellPositionBasicArrayList = geographicPathFinderInterface:searchTotalPathN(startPathFindingNodeList, endPathFindingNodeList, totalPaths, multipassState)
        return geographicMapCellPositionBasicArrayList
end


-- throws Exception
function PathGenerator:isValid(pathList, geographicMapCellHistory)
        error(java_exception("RuntimeException"), 0)
end

PathGenerator.SINGLETON = PathGenerator.new()

return PathGenerator


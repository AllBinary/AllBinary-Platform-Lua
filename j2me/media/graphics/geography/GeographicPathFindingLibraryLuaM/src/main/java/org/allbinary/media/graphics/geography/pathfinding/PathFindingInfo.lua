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

local PathFindingInfo = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo"] = PathFindingInfo

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local PathFindingInfoInterface = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfoInterface")
local GeographicPathFinderBase = java_lazy("org.allbinary.media.graphics.geography.pathfinding.GeographicPathFinderBase")
local PathFindingNode = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
local PathFindingNodeCostInfoFactoryBase = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase")

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

-- class table PathFindingInfo is declared before the requires
PathFindingInfo.__index = PathFindingInfo
PathFindingInfo.className = "PathFindingInfo"
PathFindingInfo.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo"
PathFindingInfo.java_implements = " PathFindingInfoInterface "
PathFindingInfo.java_interfaces = function() return {PathFindingInfoInterface} end

function PathFindingInfo:_init_fields()
    self.pathFinder = GeographicPathFinderBase.NULL_GEOGRAPHIC_PATH_FINDER_BASE
    if self.startPathFindingNodeList == nil then self.startPathFindingNodeList = nil end
    if self.endPathFindingNodeList == nil then self.endPathFindingNodeList = nil end
    if self.pathFindingNodeCostInfoFactoryInterface == nil then self.pathFindingNodeCostInfoFactoryInterface = nil end
end


function PathFindingInfo._jinit(self, pathFindingNodeCostInfoFactoryInterface, startPathFindingNodeList, endPathFindingNodeList)
    PathFindingInfo._init_fields(self)
        self.pathFindingNodeCostInfoFactoryInterface = pathFindingNodeCostInfoFactoryInterface
        self.startPathFindingNodeList = startPathFindingNodeList
        self.endPathFindingNodeList = endPathFindingNodeList
    return self
end

function PathFindingInfo.new(...)
    local self = setmetatable({}, PathFindingInfo)
    PathFindingInfo._jinit(self, ...)
    return self
end


function PathFindingInfo:getStartPathFindingNodeList()
        return self.startPathFindingNodeList
end


function PathFindingInfo:getEndPathFindingNodeList()
        return self.endPathFindingNodeList
end


function PathFindingInfo:getPathFinder()
        return self.pathFinder
end


function PathFindingInfo:addStartPathFindingNode(startPathFindingNode)
        self.startPathFindingNodeList:add(startPathFindingNode)
end


function PathFindingInfo:addEndPathFindingNode(endPathFindingNode)
        self.endPathFindingNodeList:add(endPathFindingNode)
end


function PathFindingInfo:setPathFinder(pathFinder)
        self.pathFinder = pathFinder
end


function PathFindingInfo:getPathFindingNodeCostInfoFactoryInterface()
        return self.pathFindingNodeCostInfoFactoryInterface
end

PathFindingInfo.NULL_PATH_FINDING_INFO = PathFindingInfo.new(PathFindingNodeCostInfoFactoryBase.NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE, BasicArrayListUtil.getInstance():getImmutableInstance(), BasicArrayListUtil.getInstance():getImmutableInstance())

return PathFindingInfo


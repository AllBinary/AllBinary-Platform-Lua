--
-- AllBinary Open License Version 1
-- Copyright (c) 2006 AllBinary
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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local PathFindingNode = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
-- java.lang.Comparable has no Lua module
local Comparable = {}

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

local PathFindingNodeCost = {}
PathFindingNodeCost.__index = PathFindingNodeCost
PathFindingNodeCost.className = "PathFindingNodeCost"
setmetatable(PathFindingNodeCost, {__index = PathFindingNode})

function PathFindingNodeCost:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.pathFindingNodeCostInfoP = nil
end


function PathFindingNodeCost.new(parent, geographicMapCellPosition, pathFindingNodeCostInfo)
    local self = setmetatable(PathFindingNode.new(parent, geographicMapCellPosition), PathFindingNodeCost)
    self:_init_fields()
        -- super(...) made self above
        self.pathFindingNodeCostInfoP = pathFindingNodeCostInfo
        if self.geographicMapCellPosition == nil then
            error(java_exception("Exception", "No GeographicMapCellPosition"), 0)
        end
        if self:getPathFindingNodeCostInfo() == nil then
            error(java_exception("Exception", "No PathFindingNodeCostInfo"), 0)
        end
    return self
end


function PathFindingNodeCost:getPathFindingNodeCostInfo()
        return self.pathFindingNodeCostInfoP
end


function PathFindingNodeCost:setPathFindingNodeCostInfo(pathFindingNodeCostInfo)
        self.pathFindingNodeCostInfoP = pathFindingNodeCostInfo
end


function PathFindingNodeCost:compareTo(pathFindingNodeCost)
        return self.pathFindingNodeCostInfoP:compareTo(pathFindingNodeCost.pathFindingNodeCostInfoP)
end


function PathFindingNodeCost:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(CommonLabels.getInstance().COLON_SEP)
        stringBuffer:append(tostring(self:getPathFindingNodeCostInfo()))
        stringBuffer:append(" Path: ")
        stringBuffer:append(tostring(self.geographicMapCellPosition))
        local pathFindingNode = self.parent
        while pathFindingNode ~= nil do
            stringBuffer:append(tostring(pathFindingNode.geographicMapCellPosition))
            stringBuffer:append(self.commonSeps.SPACE)
            pathFindingNode = pathFindingNode.parent
        end
        return tostring(stringBuffer)
end
PathFindingNodeCost.__tostring = function(self) return self:toString() end

PathFindingNodeCost.NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY = java_new_array(nil, 0, 0)

return PathFindingNodeCost


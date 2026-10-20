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
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathFindingNodeCostInfo = {}
PathFindingNodeCostInfo.__index = PathFindingNodeCostInfo
PathFindingNodeCostInfo.className = "PathFindingNodeCostInfo"

function PathFindingNodeCostInfo:_init_fields()
    self.pathFindingNodeCostInfoData = PathFindingNodeCostInfoData.getInstance()
    self.costFromStartP = nil
    self.costToEndP = nil
    self.totalCostP = 0
end


function PathFindingNodeCostInfo.new(costFromStart, costToGoal)
    local self = setmetatable({}, PathFindingNodeCostInfo)
    self:_init_fields()
        self.costFromStartP = costFromStart
        self.costToEndP = costToGoal
        self:setCalculatedTotalCost()
    return self
end


function PathFindingNodeCostInfo:setCostToEnd(costToEnd)
        self.costToEndP = costToEnd
end


function PathFindingNodeCostInfo:setTotalCost(totalCost)
        self.totalCostP = totalCost
end


-- throws Exception
function PathFindingNodeCostInfo:setCalculatedTotalCost()
        self.totalCostP = self.costFromStartP + self.costToEndP
        if self.totalCostP > self.pathFindingNodeCostInfoData.MAX_NODE_COST then
            error(java_exception("Exception", "Max Cost Exceeded"), 0)
        end
end


function PathFindingNodeCostInfo:setCostFromStart(cost)
        self.costFromStartP = cost
end


function PathFindingNodeCostInfo:addCostFromStart(cost)
        self.costFromStartP = self.costFromStartP + (cost)
end


function PathFindingNodeCostInfo:compareTo(pathFindingNodeCostInfo)
        return java.lang.Long:compare(self.totalCostP, pathFindingNodeCostInfo.totalCostP)
end


function PathFindingNodeCostInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(CommonLabels.getInstance().COLON_SEP)
        stringBuffer:append("CostFromStart: ")
        stringBuffer:appendlong(self.costFromStartP)
        stringBuffer:append(" CostToEnd: ")
        stringBuffer:appendlong(self.costToEndP)
        stringBuffer:append(" TotalCost: ")
        stringBuffer:appendlong(self.totalCostP)
        return tostring(stringBuffer)
end
PathFindingNodeCostInfo.__tostring = function(self) return self:toString() end

return PathFindingNodeCostInfo


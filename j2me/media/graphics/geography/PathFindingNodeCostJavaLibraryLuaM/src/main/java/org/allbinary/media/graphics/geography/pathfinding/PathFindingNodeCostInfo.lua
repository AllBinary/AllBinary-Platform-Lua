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

local PathFindingNodeCostInfo = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfo"] = PathFindingNodeCostInfo

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
-- java.lang.Comparable has no Lua module
local Comparable = {}
local PathFindingNodeCostInfoData = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoData")

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

-- class table PathFindingNodeCostInfo is declared before the requires
PathFindingNodeCostInfo.__index = PathFindingNodeCostInfo
PathFindingNodeCostInfo.className = "PathFindingNodeCostInfo"
PathFindingNodeCostInfo.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfo"
PathFindingNodeCostInfo.java_implements = " Comparable "
PathFindingNodeCostInfo.java_interfaces = function() return {Comparable} end

function PathFindingNodeCostInfo:_init_fields()
    self.pathFindingNodeCostInfoData = PathFindingNodeCostInfoData.getInstance()
    if self.costFromStartP == nil then self.costFromStartP = 0 end
    if self.costToEndP == nil then self.costToEndP = 0 end
    if self.totalCostP == nil then self.totalCostP = 0 end
end


function PathFindingNodeCostInfo._jinit(self, costFromStart, costToGoal)
    PathFindingNodeCostInfo._init_fields(self)
        self.costFromStartP = costFromStart
        self.costToEndP = costToGoal
        self:setCalculatedTotalCost()
    return self
end

function PathFindingNodeCostInfo.new(...)
    local self = setmetatable({}, PathFindingNodeCostInfo)
    PathFindingNodeCostInfo._jinit(self, ...)
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
            error(require("java.lang.Exception").new("Max Cost Exceeded"), 0)
        end
end


function PathFindingNodeCostInfo:setCostFromStart(cost)
        self.costFromStartP = cost
end


function PathFindingNodeCostInfo:addCostFromStart(cost)
        self.costFromStartP = self.costFromStartP + (cost)
end


function PathFindingNodeCostInfo:compareTo(pathFindingNodeCostInfo)
        if self.totalCostP < pathFindingNodeCostInfo.totalCostP then
            return -1
        elseif self.totalCostP > pathFindingNodeCostInfo.totalCostP then
            return 1
        end
        return 0
end


function PathFindingNodeCostInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append((getmetatable(self).javaClassName or getmetatable(self).className))
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


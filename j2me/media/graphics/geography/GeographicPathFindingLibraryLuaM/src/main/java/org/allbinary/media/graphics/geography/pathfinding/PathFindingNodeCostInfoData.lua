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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PathFindingNodeCostInfoData = {}
PathFindingNodeCostInfoData.__index = PathFindingNodeCostInfoData
PathFindingNodeCostInfoData.className = "PathFindingNodeCostInfoData"

function PathFindingNodeCostInfoData:_init_fields()
    self.MAX_TOTAL_COST = Integer.MAX_VALUE
    self.MAX_NODE_COST = Integer.MAX_VALUE / 10000
end


function PathFindingNodeCostInfoData.getInstance()
        return PathFindingNodeCostInfoData.instance
end


function PathFindingNodeCostInfoData.new()
    local self = setmetatable({}, PathFindingNodeCostInfoData)
    self:_init_fields()
    return self
end

PathFindingNodeCostInfoData.instance = PathFindingNodeCostInfoData.new()

return PathFindingNodeCostInfoData


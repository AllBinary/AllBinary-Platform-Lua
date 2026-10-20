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
-- package org.allbinary.math

local MathUtil = require("org.allbinary.logic.math.MathUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DistanceUtil = {}
DistanceUtil.__index = DistanceUtil
DistanceUtil.className = "DistanceUtil"

function DistanceUtil:_init_fields()
    self.mathUtil = MathUtil.getInstance()
end

function DistanceUtil.new()
    local self = setmetatable({}, DistanceUtil)
    self:_init_fields()
    return self
end


function DistanceUtil.getInstance()
        return DistanceUtil.instance
end


function DistanceUtil:getDistance(x1, y1, x2, y2)
        local dx = x1 - x2
        local dy = y1 - y2
        return java_int(self.mathUtil:sqrt((dx * dx) + (dy * dy)))
end

DistanceUtil.instance = DistanceUtil.new()

return DistanceUtil


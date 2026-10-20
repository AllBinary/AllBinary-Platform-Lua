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
-- package org.allbinary.ag.game.vector


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthVectorData = {}
HealthVectorData.__index = HealthVectorData
HealthVectorData.className = "HealthVectorData"

function HealthVectorData.new()
    local self = setmetatable({}, HealthVectorData)
    return self
end

HealthVectorData.points = {{{2, 1}, {3, 2}, {3, 2}, {4, 1}, {4, 1}, {5, 1}, {5, 1}, {6, 2}, {6, 2}, {6, 3}, {6, 3}, {3, 6}, {3, 6}, {0, 3}, {0, 3}, {0, 2}, {0, 2}, {1, 1}, {1, 1}, {2, 1}, {1000, 1000}}}

return HealthVectorData


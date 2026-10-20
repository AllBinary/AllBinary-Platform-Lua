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
-- package org.allbinary


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreedResources = {}
ThreedResources.__index = ThreedResources
ThreedResources.className = "ThreedResources"

function ThreedResources.new()
    local self = setmetatable({}, ThreedResources)
    return self
end


function ThreedResources.getThreedResources()
        return ThreedResources.threedResources
end


function ThreedResources:add()
end

ThreedResources.threedResources = ThreedResources.new()

return ThreedResources


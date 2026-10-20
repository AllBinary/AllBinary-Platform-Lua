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
-- package org.allbinary.game.ag.layer.pickup.health


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthResources = {}
HealthResources.__index = HealthResources
HealthResources.className = "HealthResources"

function HealthResources:_init_fields()
    self.RESOURCE = "health_drop_20_by_20.png"
end


function HealthResources.new()
    local self = setmetatable({}, HealthResources)
    self:_init_fields()
    return self
end


function HealthResources.getInstance()
        return HealthResources.SINGLETON
end

HealthResources.SINGLETON = HealthResources.new()

return HealthResources


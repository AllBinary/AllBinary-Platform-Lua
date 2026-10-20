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
-- package org.allbinary.logic.system.security.licensing


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LockedResources = {}
LockedResources.__index = LockedResources
LockedResources.className = "LockedResources"

function LockedResources:_init_fields()
    self.LOCKED_DEMO_GAME_FEATURE_RESOURCE = "/locked_demo_game_feature_64_by_64.png"
end

function LockedResources.new()
    local self = setmetatable({}, LockedResources)
    self:_init_fields()
    return self
end


function LockedResources.getInstance()
        return LockedResources.instance
end

LockedResources.instance = LockedResources.new()

return LockedResources


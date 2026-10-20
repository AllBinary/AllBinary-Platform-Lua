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
-- package org.allbinary.game.combat.damage


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ExplosionResources = {}
ExplosionResources.__index = ExplosionResources
ExplosionResources.className = "ExplosionResources"

function ExplosionResources:_init_fields()
    self.EXPLOSION_90_RESOURCE = "/explosion_sprite_90_by_90.png"
    self.EXPLOSION_60_RESOURCE = "/explosion_sprite_60_by_60.png"
    self.HALF_EXPLOSION_RESOURCE = "/explosion_sprite_30_by_30.png"
    self.THIRD_EXPLOSION_RESOURCE = "/explosion_sprite_15_by_15.png"
end


function ExplosionResources.getInstance()
        return ExplosionResources.instance
end


function ExplosionResources.new()
    local self = setmetatable({}, ExplosionResources)
    self:_init_fields()
    return self
end

ExplosionResources.instance = ExplosionResources.new()

return ExplosionResources


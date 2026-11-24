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
-- package org.allbinary.game.combat

local CombatBaseBehavior = {}
package.loaded["org.allbinary.game.combat.CombatBaseBehavior"] = CombatBaseBehavior

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

local DamageableBaseBehavior = java_lazy("org.allbinary.game.combat.damage.DamageableBaseBehavior")
local DestroyableBaseBehavior = java_lazy("org.allbinary.game.combat.destroy.DestroyableBaseBehavior")

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

-- class table CombatBaseBehavior is declared before the requires
CombatBaseBehavior.__index = CombatBaseBehavior
CombatBaseBehavior.className = "CombatBaseBehavior"
CombatBaseBehavior.javaClassName = "org.allbinary.game.combat.CombatBaseBehavior"

function CombatBaseBehavior:_init_fields()
    if self.damageableBaseBehavior == nil then self.damageableBaseBehavior = nil end
    if self.destroyableBaseBehavior == nil then self.destroyableBaseBehavior = nil end
    if self.readyForExplosion == nil then self.readyForExplosion = false end
end


function CombatBaseBehavior._jinit(self, damageableBaseBehavior, destroyableBaseBehavior)
    CombatBaseBehavior._init_fields(self)
        self.damageableBaseBehavior = damageableBaseBehavior
        self.destroyableBaseBehavior = destroyableBaseBehavior
    return self
end

function CombatBaseBehavior.new(...)
    local self = setmetatable({}, CombatBaseBehavior)
    CombatBaseBehavior._jinit(self, ...)
    return self
end


function CombatBaseBehavior:getDamageableBaseBehavior()
        return self.damageableBaseBehavior
end


function CombatBaseBehavior:getDestroyableBaseBehavior()
        return self.destroyableBaseBehavior
end


function CombatBaseBehavior:isReadyForExplosion()
        return self.readyForExplosion
end


function CombatBaseBehavior:setReadyForExplosion(readyForExplosion)
        self.readyForExplosion = readyForExplosion
end

CombatBaseBehavior.NULL_COMBAT_BEHAVIOR = CombatBaseBehavior.new(DamageableBaseBehavior.getInstance(), DestroyableBaseBehavior.getInstance())

return CombatBaseBehavior


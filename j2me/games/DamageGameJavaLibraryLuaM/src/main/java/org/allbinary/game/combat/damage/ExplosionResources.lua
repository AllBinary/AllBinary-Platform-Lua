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

local ExplosionResources = {}
package.loaded["org.allbinary.game.combat.damage.ExplosionResources"] = ExplosionResources

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

-- class table ExplosionResources is declared before the requires
ExplosionResources.__index = ExplosionResources
ExplosionResources.className = "ExplosionResources"
ExplosionResources.javaClassName = "org.allbinary.game.combat.damage.ExplosionResources"

function ExplosionResources:_init_fields()
    self.EXPLOSION_90_RESOURCE = "/explosion_sprite_90_by_90.png"
    self.EXPLOSION_60_RESOURCE = "/explosion_sprite_60_by_60.png"
    self.HALF_EXPLOSION_RESOURCE = "/explosion_sprite_30_by_30.png"
    self.THIRD_EXPLOSION_RESOURCE = "/explosion_sprite_15_by_15.png"
end


function ExplosionResources.getInstance()
        return ExplosionResources.instance_f
end


function ExplosionResources._jinit(self)
    ExplosionResources._init_fields(self)
    return self
end

function ExplosionResources.new(...)
    local self = setmetatable({}, ExplosionResources)
    ExplosionResources._jinit(self, ...)
    return self
end

ExplosionResources.instance_f = ExplosionResources.new()

return ExplosionResources


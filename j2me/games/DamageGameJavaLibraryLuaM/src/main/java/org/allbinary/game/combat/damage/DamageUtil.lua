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

local DamageUtil = {}
package.loaded["org.allbinary.game.combat.damage.DamageUtil"] = DamageUtil

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

local CollidableCompositeLayer = java_lazy("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local DamageableInterface = java_lazy("org.allbinary.game.combat.damage.DamageableInterface")

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

-- class table DamageUtil is declared before the requires
DamageUtil.__index = DamageUtil
DamageUtil.className = "DamageUtil"
DamageUtil.javaClassName = "org.allbinary.game.combat.damage.DamageUtil"

function DamageUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.COLLIDE = "collide"
end


function DamageUtil.getInstance()
        return DamageUtil.instance_f
end


function DamageUtil._jinit(self)
    DamageUtil._init_fields(self)
    return self
end

function DamageUtil.new(...)
    local self = setmetatable({}, DamageUtil)
    DamageUtil._jinit(self, ...)
    return self
end


-- throws Exception
function DamageUtil:process(damageableInterface, damageableInterface2)
        damageableInterface:damage(damageableInterface2:getDamage(0), 0)
end


-- throws Exception
function DamageUtil:debugDamage(collidableInterfaceCompositeInterface1, collidableInterfaceCompositeInterface)
        local collidableDestroyableDamageableLayer = collidableInterfaceCompositeInterface
        local damage = collidableDestroyableDamageableLayer:getDamage(0)
        if damage > 20000 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Collision ")
            stringBuffer:append(tostring(collidableInterfaceCompositeInterface1))
            stringBuffer:append(" with: ")
            stringBuffer:append(tostring(collidableInterfaceCompositeInterface))
            stringBuffer:append(" damage: ")
            stringBuffer:appendint(damage)
            self.logUtil:putF(tostring(stringBuffer), collidableInterfaceCompositeInterface1, self.COLLIDE)
        end
end

DamageUtil.instance_f = DamageUtil.new()

return DamageUtil


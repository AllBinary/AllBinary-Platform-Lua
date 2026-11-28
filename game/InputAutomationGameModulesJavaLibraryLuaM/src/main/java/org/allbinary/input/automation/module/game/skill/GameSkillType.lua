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
-- package org.allbinary.input.automation.module.game.skill

local GameSkillType = {}
package.loaded["org.allbinary.input.automation.module.game.skill.GameSkillType"] = GameSkillType

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

-- class table GameSkillType is declared before the requires
GameSkillType.__index = GameSkillType
GameSkillType.className = "GameSkillType"
GameSkillType.javaClassName = "org.allbinary.input.automation.module.game.skill.GameSkillType"

function GameSkillType:_init_fields()
    self.SPELL_GAME_SKILL_TYPE = "SpellGameSkillType: "
    if self.name_f == nil then self.name_f = nil end
end


function GameSkillType._jinit(self, name)
    GameSkillType._init_fields(self)
        self:setName(name)
    return self
end

function GameSkillType.new(...)
    local self = setmetatable({}, GameSkillType)
    GameSkillType._jinit(self, ...)
    return self
end


function GameSkillType:getName()
        return self.name_f
end


function GameSkillType:setName(name)
        self.name_f = name
end


function GameSkillType:toString()
        return require("allbinary_java").to_string(self.SPELL_GAME_SKILL_TYPE) .. require("allbinary_java").to_string(self:getName())
end
GameSkillType.__tostring = function(self) return self:toString() end

GameSkillType.MANA = GameSkillType.new("Mana")
GameSkillType.REPLENISH = GameSkillType.new("Replenish")
GameSkillType.TIMED = GameSkillType.new("Timed")
GameSkillType.ATTACK = GameSkillType.new("Attack")
GameSkillType.TRANSPORT = GameSkillType.new("Transport")

return GameSkillType


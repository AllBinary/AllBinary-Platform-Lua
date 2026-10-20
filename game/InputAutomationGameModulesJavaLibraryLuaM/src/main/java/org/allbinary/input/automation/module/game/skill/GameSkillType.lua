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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameSkillType = {}
GameSkillType.__index = GameSkillType
GameSkillType.className = "GameSkillType"

function GameSkillType:_init_fields()
    self.SPELL_GAME_SKILL_TYPE = "SpellGameSkillType: "
    self.name = nil
end


function GameSkillType.new(name)
    local self = setmetatable({}, GameSkillType)
    self:_init_fields()
        self:setName(name)
    return self
end


function GameSkillType:getName()
        return self.name
end


function GameSkillType:setName(name)
        self.name = name
end


function GameSkillType:toString()
        return self.SPELL_GAME_SKILL_TYPE .. self:getName()
end
GameSkillType.__tostring = function(self) return self:toString() end

GameSkillType.MANA = GameSkillType.new("Mana")
GameSkillType.REPLENISH = GameSkillType.new("Replenish")
GameSkillType.TIMED = GameSkillType.new("Timed")
GameSkillType.ATTACK = GameSkillType.new("Attack")
GameSkillType.TRANSPORT = GameSkillType.new("Transport")

return GameSkillType


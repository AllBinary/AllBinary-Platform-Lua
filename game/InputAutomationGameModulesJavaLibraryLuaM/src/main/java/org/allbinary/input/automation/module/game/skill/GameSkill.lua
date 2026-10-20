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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameSkill = {}
GameSkill.__index = GameSkill
GameSkill.className = "GameSkill"

function GameSkill:_init_fields()
    self.gameSkillType = nil
    self.extra = nil
    self.time = 0
    self.vector = nil
    self.GAME_SKILL_LABEL = "GameSkill: "
    self.EXTRA_LABEL = "Extra: "
    self.TIME_LABEL = "Time: "
end


function GameSkill.new(gameSkillType, extra, time)
    local self = setmetatable({}, GameSkill)
    self:_init_fields()
        self:setGameSkillType(gameSkillType)
        self:setExtra(extra)
        self:setTime(time)
        self.vector = BasicArrayListD.new()
        GameSkill.hashMap:put(tostring(StringMaker.new():append(self:getGameSkillType():getName()):append(CommonSeps.getInstance().SPACE):append(extra)), self)
    return self
end


function GameSkill:getGameSkillType()
        return self.gameSkillType
end


function GameSkill:setGameSkillType(gameSkillType)
        self.gameSkillType = gameSkillType
end


function GameSkill:getExtra()
        return self.extra
end


function GameSkill:setExtra(extra)
        self.extra = extra
end


function GameSkill:getTime()
        return self.time
end


function GameSkill:setTime(time)
        self.time = time
end


function GameSkill:addProperty(gameSkillPropertyInterface)
        self.vector:add(gameSkillPropertyInterface)
end


function GameSkill:getProperties()
        return self.vector
end


function GameSkill.getInstance(gameSkillType, extra)
        return GameSkill.hashMap:get(tostring(StringMaker.new():append(gameSkillType:getName()):append(CommonSeps.getInstance().SPACE):append(extra)))
end


function GameSkill:toString()
        local commonSeps = CommonSeps.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.GAME_SKILL_LABEL)
        stringBuffer:append(tostring(self:getGameSkillType()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(self.EXTRA_LABEL)
        stringBuffer:append(self:getExtra())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(self.TIME_LABEL)
        stringBuffer:appendlong(self:getTime())
        return tostring(stringBuffer)
end
GameSkill.__tostring = function(self) return self:toString() end

GameSkill.hashMap = StdUtil.getInstance():createHashMap()

return GameSkill


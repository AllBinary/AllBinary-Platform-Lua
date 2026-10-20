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
-- package org.allbinary.game.configuration

-- local Item = require("javax.microedition.lcdui.Item")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameConfigurationUtil = {}
GameConfigurationUtil.__index = GameConfigurationUtil
GameConfigurationUtil.className = "GameConfigurationUtil"

function GameConfigurationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.GAUGE_UPDATE = "Gauge Update: "
    self.FROM = " from: "
    self.TO = " to: "
    self.COMPETITION_VALUE = 1
end

function GameConfigurationUtil.new()
    local self = setmetatable({}, GameConfigurationUtil)
    self:_init_fields()
    return self
end


function GameConfigurationUtil.getInstance()
        return GameConfigurationUtil.instance
end


-- throws Exception
function GameConfigurationUtil:change(gameOptionsForm, gauge)
        self:update(gauge)
        local gameConfigurationSingleton = GameConfigurationSingleton.getInstance()
        local gameConfiguration = gameConfigurationSingleton:getInstanceByName(gauge:getLabel())
        self:updateChallange(gameOptionsForm, gameConfiguration)
end


-- throws Exception
function GameConfigurationUtil:update(gauge)
        local gameConfigurationSingleton = GameConfigurationSingleton.getInstance()
        local gameConfiguration = gameConfigurationSingleton:getInstanceByName(gauge:getLabel())
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local value = smallIntegerSingletonFactory:getAt(gauge:getValue() + math.tointeger(gameConfiguration:getMinValue() // 1))
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.GAUGE_UPDATE)
        stringBuffer:append(gameConfiguration:getName())
        stringBuffer:append(self.FROM)
        stringBuffer:appendint(java_int(math.tointeger(gameConfiguration:getValue() // 1)))
        stringBuffer:append(self.TO)
        stringBuffer:appendint(java_int(math.tointeger(value // 1)))
        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.UPDATE)
        gameConfiguration:setValue(value)
end


-- throws Exception
function GameConfigurationUtil:setDefault(gauge)
        local gameConfigurationSingleton = GameConfigurationSingleton.getInstance()
        local gameConfiguration = gameConfigurationSingleton:getInstanceByName(gauge:getLabel())
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Gauge Default: ")
        stringBuffer:append(gameConfiguration:getName())
        stringBuffer:append(self.TO)
        stringBuffer:appendint(java_int(math.tointeger(gameConfiguration:getDefaultValue() // 1)))
        self.logUtil:putF(tostring(stringBuffer), self, "setDefault")
        gauge:setValue(math.tointeger(gameConfiguration:getDefaultValue() // 1) - math.tointeger(gameConfiguration:getMinValue() // 1))
        gameConfiguration:setValue(gameConfiguration:getDefaultValue())
end


-- throws Exception
function GameConfigurationUtil:updateChallange(gameOptionsForm, gameConfiguration)
        local gameConfigurationSingleton = GameConfigurationSingleton.getInstance()
        local gameConfigurationCentral = GameConfigurationCentral.getInstance()
        if gameConfiguration == gameConfigurationCentral.CHALLENGE_LEVEL then
            self.logUtil:putF(self.commonStrings.START, self, "updateChallange")
            gameConfigurationCentral.COLLIDE_DAMAGE:setValue(gameConfiguration:getValue())
            gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL:setValue(gameConfiguration:getValue())
            gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL:setValue(gameConfiguration:getValue())
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL:setValue(gameConfiguration:getValue())
            local size = gameOptionsForm:size()
            for index = 0, size - 1 do
                local item = gameOptionsForm:get(index)
                if java_instanceof(item, GameConfigurationGauge) then
                    local gauge = item
                    local name = item:getLabel()
                    local nextGameConfiguration = gameConfigurationSingleton:getInstanceByName(name)
                    if nextGameConfiguration == gameConfigurationCentral.COLLIDE_DAMAGE then
                        gauge:setValue(math.tointeger(gameConfigurationCentral.COLLIDE_DAMAGE:getValue() // 1) - math.tointeger(gameConfiguration:getMinValue() // 1))
                    elseif nextGameConfiguration == gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL then
                        gauge:setValue(math.tointeger(gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL:getValue() // 1) - math.tointeger(gameConfiguration:getMinValue() // 1))
                    elseif nextGameConfiguration == gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL then
                        gauge:setValue(math.tointeger(gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL:getValue() // 1) - math.tointeger(gameConfiguration:getMinValue() // 1))
                    elseif nextGameConfiguration == gameConfigurationCentral.SPEED_CHALLENGE_LEVEL then
                        gauge:setValue(math.tointeger(gameConfigurationCentral.SPEED_CHALLENGE_LEVEL:getValue() // 1) - math.tointeger(gameConfiguration:getMinValue() // 1))
                    end
                end
            end
        end
end


function GameConfigurationUtil:updateCompetitionValue()
        self.logUtil:putF(self.commonStrings.START, self, "updateCompetitionValue")
        local gameConfigurationCentral = GameConfigurationCentral.getInstance()
        self.COMPETITION_VALUE = math.tointeger(gameConfigurationCentral.COLLIDE_DAMAGE:getValue() // 1) + math.tointeger(gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL:getValue() // 1) + math.tointeger(gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL:getValue() // 1) + math.tointeger(gameConfigurationCentral.SPEED_CHALLENGE_LEVEL:getValue() // 1)
        self.COMPETITION_VALUE = (((self.COMPETITION_VALUE) // (1 << (2))))
end


function GameConfigurationUtil:getCompetitionValue()
        return self.COMPETITION_VALUE
end

GameConfigurationUtil.instance = GameConfigurationUtil.new()

return GameConfigurationUtil


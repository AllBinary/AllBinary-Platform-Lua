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

local GameConfigurationUtil = {}
package.loaded["org.allbinary.game.configuration.GameConfigurationUtil"] = GameConfigurationUtil

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

-- local Item = require("javax.microedition.lcdui.Item")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameConfiguration = java_lazy("org.allbinary.game.configuration.GameConfiguration")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local GameConfigurationGauge = java_lazy("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationSingleton = java_lazy("org.allbinary.game.configuration.GameConfigurationSingleton")
local GameOptionsForm = java_lazy("org.allbinary.game.configuration.GameOptionsForm")

local function java_instanceof(object, class)
    class = java_real(class)
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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameConfigurationUtil is declared before the requires
GameConfigurationUtil.__index = GameConfigurationUtil
GameConfigurationUtil.className = "GameConfigurationUtil"
GameConfigurationUtil.javaClassName = "org.allbinary.game.configuration.GameConfigurationUtil"

function GameConfigurationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.GAUGE_UPDATE = "Gauge Update: "
    self.FROM = " from: "
    self.TO = " to: "
    self.COMPETITION_VALUE = 1
end

function GameConfigurationUtil._jinit(self)
    GameConfigurationUtil._init_fields(self)
    return self
end

function GameConfigurationUtil.new()
    return GameConfigurationUtil._jinit(setmetatable({}, GameConfigurationUtil))
end


function GameConfigurationUtil.getInstance()
        return GameConfigurationUtil.instance_f
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

GameConfigurationUtil.instance_f = GameConfigurationUtil.new()

return GameConfigurationUtil


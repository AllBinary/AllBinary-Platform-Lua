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

local GameConfigurationCentral = {}
package.loaded["org.allbinary.game.configuration.GameConfigurationCentral"] = GameConfigurationCentral

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

local GameConfigurationPersistanceSingleton = java_lazy("org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton")
local KeyValuePersistance = java_lazy("org.allbinary.game.configuration.persistance.KeyValuePersistance")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local GameConfiguration = java_lazy("org.allbinary.game.configuration.GameConfiguration")

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

-- class table GameConfigurationCentral is declared before the requires
GameConfigurationCentral.__index = GameConfigurationCentral
GameConfigurationCentral.className = "GameConfigurationCentral"
GameConfigurationCentral.javaClassName = "org.allbinary.game.configuration.GameConfigurationCentral"

function GameConfigurationCentral:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.SCALE == nil then self.SCALE = nil end
    if self.ORIENTATION == nil then self.ORIENTATION = nil end
    if self.SENSOR_UPDATE_RATE == nil then self.SENSOR_UPDATE_RATE = nil end
    if self.VIBRATION == nil then self.VIBRATION = nil end
    if self.CHALLENGE_LEVEL == nil then self.CHALLENGE_LEVEL = nil end
    if self.COLLIDE_DAMAGE == nil then self.COLLIDE_DAMAGE = nil end
    if self.DURABILITY_CHALLENGE_LEVEL == nil then self.DURABILITY_CHALLENGE_LEVEL = nil end
    if self.SPEED_CHALLENGE_LEVEL == nil then self.SPEED_CHALLENGE_LEVEL = nil end
    if self.ATTACK_CHALLENGE_LEVEL == nil then self.ATTACK_CHALLENGE_LEVEL = nil end
    if self.CONTROL_LEVEL == nil then self.CONTROL_LEVEL = nil end
    if self.PLAYER_INPUT_WAIT == nil then self.PLAYER_INPUT_WAIT = nil end
    if self.SPEED == nil then self.SPEED = nil end
    if self.SOUND_VOLUME == nil then self.SOUND_VOLUME = nil end
    if self.MAX_GAME_OBJECTS == nil then self.MAX_GAME_OBJECTS = nil end
    if self.MAX_LAYERS == nil then self.MAX_LAYERS = nil end
    self.gameControlFidelity = 36
end


function GameConfigurationCentral.getInstance()
        if rawequal(GameConfigurationCentral.SINGLETON, NullUtil.getInstance().NULL_OBJECT) then
            GameConfigurationCentral.SINGLETON = GameConfigurationCentral.new()
        end
        return GameConfigurationCentral.SINGLETON
end


function GameConfigurationCentral._jinit(self)
    GameConfigurationCentral._init_fields(self)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        self.SCALE = GameConfiguration.new("Scale", smallIntegerSingletonFactory:getAt(2), smallIntegerSingletonFactory:getAt(2), smallIntegerSingletonFactory:getAt(3))
        self.ORIENTATION = GameConfiguration.new("Orientation", smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(8))
        self.SENSOR_UPDATE_RATE = GameConfiguration.new("Sensor Update Rate", smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(3))
        self.VIBRATION = GameConfiguration.new("Vibration", smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(3))
        self.CHALLENGE_LEVEL = GameConfiguration.new("Global Challenge Level", smallIntegerSingletonFactory:getAt(3), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.COLLIDE_DAMAGE = GameConfiguration.new("Collide Damage Challenge Level", smallIntegerSingletonFactory:getAt(3), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.DURABILITY_CHALLENGE_LEVEL = GameConfiguration.new("Enemy Durability Challenge Level", smallIntegerSingletonFactory:getAt(3), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.SPEED_CHALLENGE_LEVEL = GameConfiguration.new("Enemy Speed Challenge Level", smallIntegerSingletonFactory:getAt(3), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.ATTACK_CHALLENGE_LEVEL = GameConfiguration.new("Enemy Attack Challenge Level", smallIntegerSingletonFactory:getAt(3), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.CONTROL_LEVEL = GameConfiguration.new("Control Fidelity", smallIntegerSingletonFactory:getAt(5), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.PLAYER_INPUT_WAIT = GameConfiguration.new("Input Wait", smallIntegerSingletonFactory:getAt(5), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.SPEED = GameConfiguration.new("Game Speed (Device Specific)", smallIntegerSingletonFactory:getAt(5), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(10))
        self.SOUND_VOLUME = GameConfiguration.new("Sound Volume", smallIntegerSingletonFactory:getAt(6), smallIntegerSingletonFactory:getAt(0), smallIntegerSingletonFactory:getAt(10))
        self.MAX_GAME_OBJECTS = GameConfiguration.new("Max Game Objects", smallIntegerSingletonFactory:getAt(20), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(50))
        self.MAX_LAYERS = GameConfiguration.new("Max Layers", smallIntegerSingletonFactory:getAt(20), smallIntegerSingletonFactory:getAt(1), smallIntegerSingletonFactory:getAt(50))
    return self
end

function GameConfigurationCentral.new(...)
    local self = setmetatable({}, GameConfigurationCentral)
    GameConfigurationCentral._jinit(self, ...)
    return self
end


function GameConfigurationCentral:load(abeClientInformation)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
            local keyValuePersistance = GameConfigurationPersistanceSingleton.getInstance()
            keyValuePersistance:clear()
            keyValuePersistance:loadAll(abeClientInformation)
            local list = keyValuePersistance:getIds()
            if list:size() > 0 then
                local hashtable = keyValuePersistance:get(0)
                local anyType = self.SCALE:getName()
                local value = hashtable:get(anyType)
                self.SCALE:setValue(smallIntegerSingletonFactory:getAt(math.tointeger(tostring(value) // 1)))
            else
                self.logUtil:putF("No Game Configuration To Load", self, commonStrings.LOAD)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.LOAD, e)
        end
end


function GameConfigurationCentral:setGameControlFidelity(gameControlFidelity)
        self.gameControlFidelity = gameControlFidelity
end


function GameConfigurationCentral:getGameControlFidelity()
        return self.gameControlFidelity
end


function GameConfigurationCentral:toString()
        local stringBuffer = StringMaker.new()
        local commonStrings = CommonSeps.getInstance()
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.SCALE:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.SCALE:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.ORIENTATION:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.ORIENTATION:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.SENSOR_UPDATE_RATE:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.SENSOR_UPDATE_RATE:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.VIBRATION:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.VIBRATION:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.CHALLENGE_LEVEL:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.CHALLENGE_LEVEL:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.COLLIDE_DAMAGE:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.COLLIDE_DAMAGE:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.DURABILITY_CHALLENGE_LEVEL:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.DURABILITY_CHALLENGE_LEVEL:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.SPEED_CHALLENGE_LEVEL:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.SPEED_CHALLENGE_LEVEL:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.ATTACK_CHALLENGE_LEVEL:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.ATTACK_CHALLENGE_LEVEL:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.CONTROL_LEVEL:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.CONTROL_LEVEL:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.SPEED:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.SPEED:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.MAX_GAME_OBJECTS:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.MAX_GAME_OBJECTS:getValue() // 1)))
        stringBuffer:append(commonStrings.COMMA_SEP)
        stringBuffer:append(self.MAX_LAYERS:getName())
        stringBuffer:append(commonStrings.EQUALS)
        stringBuffer:appendint(java_int(math.tointeger(self.MAX_LAYERS:getValue() // 1)))
        return tostring(stringBuffer)
end
GameConfigurationCentral.__tostring = function(self) return self:toString() end

GameConfigurationCentral.SINGLETON = NullUtil.getInstance().NULL_OBJECT

return GameConfigurationCentral


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

local GameFeatureEvent = require("org.allbinary.game.configuration.event.GameFeatureEvent")
local GameFeatureEventHandler = require("org.allbinary.game.configuration.event.GameFeatureEventHandler")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameConfiguration = {}
GameConfiguration.__index = GameConfiguration
GameConfiguration.className = "GameConfiguration"

function GameConfiguration:_init_fields()
    self.name = StringUtil.getInstance().EMPTY_STRING
    self.defaultValue = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.value = GameConfiguration.MIN_VALUE
    self.minValue = self.defaultValue
    self.maxValue = self.defaultValue
    self.modifiable = BooleanFactory.getInstance().TRUE
end


function GameConfiguration.new(name, defaultValue, minValue, maxValue)
    local self = setmetatable({}, GameConfiguration)
    self:_init_fields()
        self:setName(name)
        self:setDefaultValue(defaultValue)
        self.value = self:getDefaultValue()
        self:setMinValue(minValue)
        self:setMaxValue(maxValue)
        GameConfigurationSingleton.getInstance():getHashtable():put(self:getName(), self)
    return self
end


-- throws Exception
function GameConfiguration:setValue(value)
        if self.value ~= value then
            local oldValue = self.value
            self.value = value
            GameFeatureEventHandler.getInstance():fireEvent(GameFeatureEvent.new(self, tostring(StringMaker.new():append(self.name):append(" value: from: "):appendint(java_int(math.tointeger(oldValue // 1))):append(" to "):appendint(java_int(math.tointeger(self.value // 1))))))
        end
end


function GameConfiguration:getValue()
        return self.value
end


function GameConfiguration:setMaxValue(maxValue)
        self.maxValue = maxValue
end


function GameConfiguration:getMaxValue()
        return self.maxValue
end


function GameConfiguration:setMinValue(minValue)
        self.minValue = minValue
end


function GameConfiguration:getMinValue()
        return self.minValue
end


function GameConfiguration:setName(name)
        self.name = name
end


function GameConfiguration:getName()
        return self.name
end


function GameConfiguration:setDefaultValue(defaultValue)
        self.defaultValue = defaultValue
end


function GameConfiguration:getDefaultValue()
        return self.defaultValue
end


-- throws Exception
function GameConfiguration:setDefault()
        self:setValue(self:getDefaultValue())
end


function GameConfiguration:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Name: ")
        stringBuffer:append(self.name)
        stringBuffer:append(" Min: ")
        stringBuffer:appendint(java_int(math.tointeger(self:getMinValue() // 1)))
        stringBuffer:append(" Max: ")
        stringBuffer:appendint(java_int(math.tointeger(self:getMaxValue() // 1)))
        stringBuffer:append(" Value: ")
        stringBuffer:appendint(java_int(math.tointeger(self:getValue() // 1)))
        stringBuffer:append(" Default: ")
        stringBuffer:appendint(java_int(math.tointeger(self:getDefaultValue() // 1)))
        stringBuffer:append(" Modifiable: ")
        stringBuffer:appendboolean(self:isModifiable())
        return tostring(stringBuffer)
end
GameConfiguration.__tostring = function(self) return self:toString() end


function GameConfiguration:setModifiable(modifiable)
        self.modifiable = modifiable
end


function GameConfiguration:isModifiable()
        return self.modifiable
end

GameConfiguration.MIN_VALUE = Integer.MIN_VALUE

return GameConfiguration


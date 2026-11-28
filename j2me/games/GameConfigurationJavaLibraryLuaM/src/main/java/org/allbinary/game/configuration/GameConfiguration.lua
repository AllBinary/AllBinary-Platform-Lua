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

local GameConfiguration = {}
package.loaded["org.allbinary.game.configuration.GameConfiguration"] = GameConfiguration

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

local GameFeatureEvent = java_lazy("org.allbinary.game.configuration.event.GameFeatureEvent")
local GameFeatureEventHandler = java_lazy("org.allbinary.game.configuration.event.GameFeatureEventHandler")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local GameConfigurationSingleton = java_lazy("org.allbinary.game.configuration.GameConfigurationSingleton")

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

-- class table GameConfiguration is declared before the requires
GameConfiguration.__index = GameConfiguration
GameConfiguration.className = "GameConfiguration"
GameConfiguration.javaClassName = "org.allbinary.game.configuration.GameConfiguration"

function GameConfiguration:_init_fields()
    self.name_f = StringUtil.getInstance().EMPTY_STRING
    self.defaultValue = SmallIntegerSingletonFactory.getInstance():getAt(0)
    self.value = GameConfiguration.MIN_VALUE
    self.minValue = self.defaultValue
    self.maxValue = self.defaultValue
    self.modifiable = BooleanFactory.getInstance().TRUE
end


function GameConfiguration._jinit(self, name, defaultValue, minValue, maxValue)
    GameConfiguration._init_fields(self)
        self:setName(name)
        self:setDefaultValue(defaultValue)
        self.value = self:getDefaultValue()
        self:setMinValue(minValue)
        self:setMaxValue(maxValue)
        GameConfigurationSingleton.getInstance():getHashtable():put(self:getName(), self)
    return self
end

function GameConfiguration.new(...)
    local self = setmetatable({}, GameConfiguration)
    GameConfiguration._jinit(self, ...)
    return self
end


-- throws Exception
function GameConfiguration:setValue(value)
        if not rawequal(self.value, value) then
            local oldValue = self.value
            self.value = value
            GameFeatureEventHandler.getInstance():fireEvent(GameFeatureEvent.new(self, tostring(StringMaker.new():append(self.name_f):append(" value: from: "):appendint(java_int(require("allbinary_java").number_value(oldValue, "intValue"))):append(" to "):appendint(java_int(require("allbinary_java").number_value(self.value, "intValue"))))))
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
        self.name_f = name
end


function GameConfiguration:getName()
        return self.name_f
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
        stringBuffer:append(self.name_f)
        stringBuffer:append(" Min: ")
        stringBuffer:appendint(java_int(require("allbinary_java").number_value(self:getMinValue(), "intValue")))
        stringBuffer:append(" Max: ")
        stringBuffer:appendint(java_int(require("allbinary_java").number_value(self:getMaxValue(), "intValue")))
        stringBuffer:append(" Value: ")
        stringBuffer:appendint(java_int(require("allbinary_java").number_value(self:getValue(), "intValue")))
        stringBuffer:append(" Default: ")
        stringBuffer:appendint(java_int(require("allbinary_java").number_value(self:getDefaultValue(), "intValue")))
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

GameConfiguration.MIN_VALUE = require("java.lang.Integer").MIN_VALUE

return GameConfiguration


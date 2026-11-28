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

local GameConfigurationTextInput = {}
package.loaded["org.allbinary.game.configuration.GameConfigurationTextInput"] = GameConfigurationTextInput

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

local TextField = java_lazy("javax.microedition.lcdui.TextField")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- class table GameConfigurationTextInput is declared before the requires
GameConfigurationTextInput.__index = GameConfigurationTextInput
GameConfigurationTextInput.className = "GameConfigurationTextInput"
GameConfigurationTextInput.javaClassName = "org.allbinary.game.configuration.GameConfigurationTextInput"

function GameConfigurationTextInput:_init_fields()
    self.label = StringUtil.getInstance().EMPTY_STRING
    self.text = StringUtil.getInstance().EMPTY_STRING
end


function GameConfigurationTextInput._jinit(self, label, text)
    GameConfigurationTextInput._init_fields(self)
        self:setText(text)
        self:setLabel(label)
        GameConfigurationTextInput.hashtable:put(self:getLabel(), self)
    return self
end

function GameConfigurationTextInput.new(...)
    local self = setmetatable({}, GameConfigurationTextInput)
    GameConfigurationTextInput._jinit(self, ...)
    return self
end


function GameConfigurationTextInput.update(textField)
        local anyType = textField:getLabel()
        local gameConfigurationTextInput = GameConfigurationTextInput.hashtable:get(anyType)
        gameConfigurationTextInput:setText(textField:getString())
end


function GameConfigurationTextInput:setText(text)
        self.text = text
end


function GameConfigurationTextInput:getText()
        return self.text
end


function GameConfigurationTextInput:setLabel(label)
        self.label = label
end


function GameConfigurationTextInput:getLabel()
        return self.label
end


function GameConfigurationTextInput.getHashtable()
        return GameConfigurationTextInput.hashtable
end

GameConfigurationTextInput.hashtable = StdUtil.getInstance():createHashtable()
GameConfigurationTextInput.SIMULATOR_IP = GameConfigurationTextInput.new("IP: ", "192.168.1.3")
GameConfigurationTextInput.SIMULATOR_PORT = GameConfigurationTextInput.new("Port: ", "8010")

return GameConfigurationTextInput


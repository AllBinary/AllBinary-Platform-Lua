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

-- local TextField = require("javax.microedition.lcdui.TextField")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameConfigurationTextInput = {}
GameConfigurationTextInput.__index = GameConfigurationTextInput
GameConfigurationTextInput.className = "GameConfigurationTextInput"

function GameConfigurationTextInput:_init_fields()
    self.label = StringUtil.getInstance().EMPTY_STRING
    self.text = StringUtil.getInstance().EMPTY_STRING
end


function GameConfigurationTextInput.new(label, text)
    local self = setmetatable({}, GameConfigurationTextInput)
    self:_init_fields()
        self:setText(text)
        self:setLabel(label)
        GameConfigurationTextInput.hashtable:put(self:getLabel(), self)
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


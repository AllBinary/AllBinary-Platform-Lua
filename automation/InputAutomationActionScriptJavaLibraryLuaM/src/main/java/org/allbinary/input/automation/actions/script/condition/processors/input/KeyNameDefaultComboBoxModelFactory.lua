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
-- package org.allbinary.input.automation.actions.script.condition.processors.input

-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local swing = require("javax.swing")
local KeySingletonFactory = require("org.allbinary.input.KeySingletonFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyNameDefaultComboBoxModelFactory = {}
KeyNameDefaultComboBoxModelFactory.__index = KeyNameDefaultComboBoxModelFactory
KeyNameDefaultComboBoxModelFactory.className = "KeyNameDefaultComboBoxModelFactory"


function KeyNameDefaultComboBoxModelFactory.new()
    local self = setmetatable({}, KeyNameDefaultComboBoxModelFactory)
    return self
end


function KeyNameDefaultComboBoxModelFactory.getInstance()
        local defaultComboBoxModel = DefaultComboBoxModel.new()
        local keyArray = KeySingletonFactory.getArray()
        for index = 0, (keyArray.n or #keyArray) - 1 do
            local keyAsString = KeyEvent.getKeyText(keyArray[index + 1])
            defaultComboBoxModel:addElement(keyAsString)
        end
        return defaultComboBoxModel
end

return KeyNameDefaultComboBoxModelFactory


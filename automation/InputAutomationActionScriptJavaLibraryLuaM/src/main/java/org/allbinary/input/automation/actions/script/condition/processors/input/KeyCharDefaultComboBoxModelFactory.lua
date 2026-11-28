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

local KeyCharDefaultComboBoxModelFactory = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.KeyCharDefaultComboBoxModelFactory"] = KeyCharDefaultComboBoxModelFactory

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

-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
-- local KeyStroke = require("javax.swing.KeyStroke")
local KeyStrokeMap = java_lazy("abbot.tester.KeyStrokeMap")
local KeySingletonFactory = java_lazy("org.allbinary.input.KeySingletonFactory")

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

-- class table KeyCharDefaultComboBoxModelFactory is declared before the requires
KeyCharDefaultComboBoxModelFactory.__index = KeyCharDefaultComboBoxModelFactory
KeyCharDefaultComboBoxModelFactory.className = "KeyCharDefaultComboBoxModelFactory"
KeyCharDefaultComboBoxModelFactory.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.KeyCharDefaultComboBoxModelFactory"


function KeyCharDefaultComboBoxModelFactory._jinit(self)
    return self
end

function KeyCharDefaultComboBoxModelFactory.new(...)
    local self = setmetatable({}, KeyCharDefaultComboBoxModelFactory)
    KeyCharDefaultComboBoxModelFactory._jinit(self, ...)
    return self
end


function KeyCharDefaultComboBoxModelFactory.getInstance()
        local defaultComboBoxModel = DefaultComboBoxModel.new()
        local keyArray = KeySingletonFactory.getArray()
        for index = 0, (keyArray.n or #keyArray) - 1 do
            local nextKey = keyArray[index + 1]
            local keyStroke = KeyStroke.getKeyStroke(require("allbinary_java").number_value(nextKey, "intValue"), 0)
            local keyChar = KeyStrokeMap.getChar(keyStroke)
            defaultComboBoxModel:addElement(tostring(keyChar))
        end
        return defaultComboBoxModel
end

return KeyCharDefaultComboBoxModelFactory


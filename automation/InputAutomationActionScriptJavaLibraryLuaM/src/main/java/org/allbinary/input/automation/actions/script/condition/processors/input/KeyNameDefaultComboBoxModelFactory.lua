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

local KeyNameDefaultComboBoxModelFactory = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.KeyNameDefaultComboBoxModelFactory"] = KeyNameDefaultComboBoxModelFactory

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

-- local KeyEvent = require("java.awt.event.KeyEvent")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
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

-- class table KeyNameDefaultComboBoxModelFactory is declared before the requires
KeyNameDefaultComboBoxModelFactory.__index = KeyNameDefaultComboBoxModelFactory
KeyNameDefaultComboBoxModelFactory.className = "KeyNameDefaultComboBoxModelFactory"
KeyNameDefaultComboBoxModelFactory.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.KeyNameDefaultComboBoxModelFactory"


function KeyNameDefaultComboBoxModelFactory._jinit(self)
    return self
end

function KeyNameDefaultComboBoxModelFactory.new(...)
    local self = setmetatable({}, KeyNameDefaultComboBoxModelFactory)
    KeyNameDefaultComboBoxModelFactory._jinit(self, ...)
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


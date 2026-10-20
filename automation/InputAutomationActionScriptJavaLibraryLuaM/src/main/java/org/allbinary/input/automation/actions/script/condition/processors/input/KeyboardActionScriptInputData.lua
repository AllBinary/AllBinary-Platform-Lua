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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyboardActionScriptInputData = {}
KeyboardActionScriptInputData.__index = KeyboardActionScriptInputData
KeyboardActionScriptInputData.className = "KeyboardActionScriptInputData"


function KeyboardActionScriptInputData.new()
    local self = setmetatable({}, KeyboardActionScriptInputData)
    return self
end

KeyboardActionScriptInputData.NAME = "KEY_ACTION_INPUT_NAME"
KeyboardActionScriptInputData.KEY = "KEY_ACTION_INPUT_KEY"
KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS = "KEY_ACTION_INPUT_DELAY_BETWEEN_KEYS"
KeyboardActionScriptInputData.PRESS = "KEY_ACTION_INPUT_PRESS"
KeyboardActionScriptInputData.RELEASE = "KEY_ACTION_INPUT_RELEASE"

return KeyboardActionScriptInputData


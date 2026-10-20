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

local MouseActionScriptInputData = {}
MouseActionScriptInputData.__index = MouseActionScriptInputData
MouseActionScriptInputData.className = "MouseActionScriptInputData"


function MouseActionScriptInputData.new()
    local self = setmetatable({}, MouseActionScriptInputData)
    return self
end

MouseActionScriptInputData.NAME = "MOUSE_ACTION_INPUT_NAME"
MouseActionScriptInputData.BUTTONS = "MOUSE_ACTION_INPUT_BUTTONS"
MouseActionScriptInputData.MOVE = "MOUSE_ACTION_INPUT_MOVE"
MouseActionScriptInputData.MOVE_X = "MOUSE_ACTION_INPUT_MOVE_X"
MouseActionScriptInputData.MOVE_Y = "MOUSE_ACTION_INPUT_MOVE_Y"

return MouseActionScriptInputData


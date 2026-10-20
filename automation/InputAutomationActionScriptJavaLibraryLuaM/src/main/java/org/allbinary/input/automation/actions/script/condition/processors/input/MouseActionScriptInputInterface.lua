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

-- local awt = require("java.awt")
local ProfileActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local MouseActionScriptInputInterface = {}
MouseActionScriptInputInterface.__index = MouseActionScriptInputInterface
MouseActionScriptInputInterface.className = "MouseActionScriptInputInterface"
setmetatable(MouseActionScriptInputInterface, {__index = ProfileActionScriptInputInterface})


function MouseActionScriptInputInterface:setPoint(point)
    error("abstract method setPoint")
end


function MouseActionScriptInputInterface:getPoint()
    error("abstract method getPoint")
end


function MouseActionScriptInputInterface:getButtonClicks()
    error("abstract method getButtonClicks")
end


function MouseActionScriptInputInterface:setButtonClicks(buttons)
    error("abstract method setButtonClicks")
end


function MouseActionScriptInputInterface:log()
    error("abstract method log")
end

return MouseActionScriptInputInterface


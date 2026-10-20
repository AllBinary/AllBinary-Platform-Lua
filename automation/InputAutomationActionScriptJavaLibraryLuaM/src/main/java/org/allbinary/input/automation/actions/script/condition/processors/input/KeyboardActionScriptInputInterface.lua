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
local KeyboardActionScriptInputInterface = {}
KeyboardActionScriptInputInterface.__index = KeyboardActionScriptInputInterface
KeyboardActionScriptInputInterface.className = "KeyboardActionScriptInputInterface"
setmetatable(KeyboardActionScriptInputInterface, {__index = ProfileActionScriptInputInterface})


function KeyboardActionScriptInputInterface:getDelayBetweenKeys()
    error("abstract method getDelayBetweenKeys")
end


function KeyboardActionScriptInputInterface:getKeyArray()
    error("abstract method getKeyArray")
end


function KeyboardActionScriptInputInterface:isPress()
    error("abstract method isPress")
end


function KeyboardActionScriptInputInterface:isRelease()
    error("abstract method isRelease")
end


function KeyboardActionScriptInputInterface:isNormal()
    error("abstract method isNormal")
end


function KeyboardActionScriptInputInterface:setPress(press)
    error("abstract method setPress")
end


function KeyboardActionScriptInputInterface:setRelease(release)
    error("abstract method setRelease")
end


function KeyboardActionScriptInputInterface:setNormal()
    error("abstract method setNormal")
end


function KeyboardActionScriptInputInterface:getText()
    error("abstract method getText")
end


function KeyboardActionScriptInputInterface:setText(text)
    error("abstract method setText")
end


function KeyboardActionScriptInputInterface:log()
    error("abstract method log")
end

return KeyboardActionScriptInputInterface


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

local KeyboardActionScriptInputInterface = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputInterface"] = KeyboardActionScriptInputInterface

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

local ProfileActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputInterface")

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

-- Java interface
-- class table KeyboardActionScriptInputInterface is declared before the requires
KeyboardActionScriptInputInterface.__index = KeyboardActionScriptInputInterface
KeyboardActionScriptInputInterface.className = "KeyboardActionScriptInputInterface"
KeyboardActionScriptInputInterface.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputInterface"
setmetatable(KeyboardActionScriptInputInterface, {__index = ProfileActionScriptInputInterface})
KeyboardActionScriptInputInterface.java_interfaces = function() return {ProfileActionScriptInputInterface} end


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


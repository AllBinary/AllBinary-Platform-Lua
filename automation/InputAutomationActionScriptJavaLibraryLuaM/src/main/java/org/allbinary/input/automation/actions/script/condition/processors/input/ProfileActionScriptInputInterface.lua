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

local ProfileActionScriptInputInterface = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputInterface"] = ProfileActionScriptInputInterface

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

local ProfileActionScriptProcessorInterface = require("org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface")
local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")

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
-- class table ProfileActionScriptInputInterface is declared before the requires
ProfileActionScriptInputInterface.__index = ProfileActionScriptInputInterface
ProfileActionScriptInputInterface.className = "ProfileActionScriptInputInterface"
ProfileActionScriptInputInterface.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputInterface"
setmetatable(ProfileActionScriptInputInterface, {__index = ProfileActionScriptProcessorInterface})
ProfileActionScriptInputInterface.java_interfaces = function() return {ProfileActionScriptProcessorInterface} end


function ProfileActionScriptInputInterface:setInputRobotInterface(inputRobotInterface)
    error("abstract method setInputRobotInterface")
end


function ProfileActionScriptInputInterface:getInputRobotInterface()
    error("abstract method getInputRobotInterface")
end


function ProfileActionScriptInputInterface:getTime()
    error("abstract method getTime")
end


function ProfileActionScriptInputInterface:setTime(time)
    error("abstract method setTime")
end

return ProfileActionScriptInputInterface


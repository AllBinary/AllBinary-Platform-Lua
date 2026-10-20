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

local ProfileActionScriptProcessorInterface = require("org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")

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
local ProfileActionScriptInputInterface = {}
ProfileActionScriptInputInterface.__index = ProfileActionScriptInputInterface
ProfileActionScriptInputInterface.className = "ProfileActionScriptInputInterface"
setmetatable(ProfileActionScriptInputInterface, {__index = ProfileActionScriptProcessorInterface})


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


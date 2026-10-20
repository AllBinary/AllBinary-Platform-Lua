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
-- package org.allbinary.input.automation.actions.script.condition

local ProfileActionScriptItemInterface = require("org.allbinary.input.automation.actions.script.ProfileActionScriptItemInterface")
local ProfileActionScriptNodeInterface = require("org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface")
local ProfileActionScriptProcessorInterface = require("org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface")
local CustomTreeNodeInterface = require("org.allbinary.input.automation.actions.script.condition.CustomTreeNodeInterface")

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
local ProfileActionScriptConditionInterface = {}
ProfileActionScriptConditionInterface.__index = ProfileActionScriptConditionInterface
ProfileActionScriptConditionInterface.className = "ProfileActionScriptConditionInterface"
setmetatable(ProfileActionScriptConditionInterface, {__index = ProfileActionScriptNodeInterface})


function ProfileActionScriptConditionInterface:addProcessor(profileActionProcessorInterface)
    error("abstract method addProcessor")
end


function ProfileActionScriptConditionInterface:removeProcessor(profileActionProcessorInterface)
    error("abstract method removeProcessor")
end


-- throws Exception
function ProfileActionScriptConditionInterface:shouldProcess(frame)
    error("abstract method shouldProcess")
end

return ProfileActionScriptConditionInterface


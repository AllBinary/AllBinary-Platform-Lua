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
-- package org.allbinary.input.automation.actions.script

-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")

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
local ProfileActionScriptNodeInterface = {}
ProfileActionScriptNodeInterface.__index = ProfileActionScriptNodeInterface
ProfileActionScriptNodeInterface.className = "ProfileActionScriptNodeInterface"
setmetatable(ProfileActionScriptNodeInterface, {__index = DomNodeInterface})


function ProfileActionScriptNodeInterface:addCondition(profileActionConditionInterface)
    error("abstract method addCondition")
end


function ProfileActionScriptNodeInterface:removeCondition(profileActionConditionInterface)
    error("abstract method removeCondition")
end

return ProfileActionScriptNodeInterface


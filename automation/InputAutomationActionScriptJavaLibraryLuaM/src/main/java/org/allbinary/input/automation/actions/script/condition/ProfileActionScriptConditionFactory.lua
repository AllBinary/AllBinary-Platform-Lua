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

local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProfileActionScriptConditionFactory = {}
ProfileActionScriptConditionFactory.__index = ProfileActionScriptConditionFactory
ProfileActionScriptConditionFactory.className = "ProfileActionScriptConditionFactory"


function ProfileActionScriptConditionFactory.new()
    local self = setmetatable({}, ProfileActionScriptConditionFactory)
    return self
end


-- throws Exception
function ProfileActionScriptConditionFactory.getInstance(node)
        local profileActionScriptConditionInterface = nil
        if DomSearchHelper.getNodeNoThrow(ColorAtActionScriptConditionData.NAME, node:getChildNodes()) ~= nil then
            profileActionScriptConditionInterface = ColorAtActionScriptCondition.new(node)
        elseif DomSearchHelper.getNodeNoThrow(TimeIntervalActionScriptConditionData.NAME, node:getChildNodes()) ~= nil then
            profileActionScriptConditionInterface = TimeIntervalActionScriptCondition.new(node)
        elseif DomSearchHelper.getNodeNoThrow(AlwaysActionScriptConditionData.NAME, node:getChildNodes()) ~= nil then
            profileActionScriptConditionInterface = AlwaysActionScriptCondition.new(node)
        end
        return profileActionScriptConditionInterface
end

return ProfileActionScriptConditionFactory


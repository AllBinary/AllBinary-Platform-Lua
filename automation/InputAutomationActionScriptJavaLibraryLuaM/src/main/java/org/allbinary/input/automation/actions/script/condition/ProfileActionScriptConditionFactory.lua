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

local ProfileActionScriptConditionFactory = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory"] = ProfileActionScriptConditionFactory

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

local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local Node = java_lazy("org.w3c.dom.Node")
local AlwaysActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptCondition")
local AlwaysActionScriptConditionData = java_lazy("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptConditionData")
local ColorAtActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition")
local ColorAtActionScriptConditionData = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionData")
local ProfileActionScriptConditionInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local TimeIntervalActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition")
local TimeIntervalActionScriptConditionData = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionData")

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

-- class table ProfileActionScriptConditionFactory is declared before the requires
ProfileActionScriptConditionFactory.__index = ProfileActionScriptConditionFactory
ProfileActionScriptConditionFactory.className = "ProfileActionScriptConditionFactory"
ProfileActionScriptConditionFactory.javaClassName = "org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory"


function ProfileActionScriptConditionFactory._jinit(self)
    return self
end

function ProfileActionScriptConditionFactory.new(...)
    local self = setmetatable({}, ProfileActionScriptConditionFactory)
    ProfileActionScriptConditionFactory._jinit(self, ...)
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


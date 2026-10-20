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

local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local Node = require("org.w3c.dom.Node")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProfileActionScriptInputFactory = {}
ProfileActionScriptInputFactory.__index = ProfileActionScriptInputFactory
ProfileActionScriptInputFactory.className = "ProfileActionScriptInputFactory"


function ProfileActionScriptInputFactory.new()
    local self = setmetatable({}, ProfileActionScriptInputFactory)
    return self
end


-- throws Exception
function ProfileActionScriptInputFactory.getInstance(node)
        local profileActionScriptInputInterface = nil
        if DomSearchHelper.getNodeNoThrow(KeyboardActionScriptInputData.NAME, node:getChildNodes()) ~= nil then
            profileActionScriptInputInterface = KeyboardActionScriptInput.new(node)
        elseif DomSearchHelper.getNodeNoThrow(MouseActionScriptInputData.NAME, node:getChildNodes()) ~= nil then
            profileActionScriptInputInterface = MouseActionScriptInput.new(node)
        else
            error(java_exception("Exception", "No Such ActionScript Input"), 0)
        end
        return profileActionScriptInputInterface
end

return ProfileActionScriptInputFactory


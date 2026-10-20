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
-- package org.allbinary.input.automation.actions.script.condition.processors

-- local ActionEvent = require("java.awt.event.ActionEvent")
local JTreeInterfaceFactory = require("org.allbinary.input.automation.actions.script.JTreeInterfaceFactory")
local ProfileActionScriptItem = require("org.allbinary.input.automation.actions.script.ProfileActionScriptItem")
local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ProfileActionScriptProcessorInterface = require("org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface")

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local BasicProfileActionScriptProcessor = {}
BasicProfileActionScriptProcessor.__index = BasicProfileActionScriptProcessor
BasicProfileActionScriptProcessor.className = "BasicProfileActionScriptProcessor"
setmetatable(BasicProfileActionScriptProcessor, {__index = ProfileActionScriptItem})

function BasicProfileActionScriptProcessor.new(...)
    local count = select("#", ...)
    if count == 2 then return BasicProfileActionScriptProcessor._new2(...)
    elseif count == 1 then return BasicProfileActionScriptProcessor._new1(...)
    end
end


function BasicProfileActionScriptProcessor._new2(label, node)
    local self = setmetatable(ProfileActionScriptItem.new(label, node), BasicProfileActionScriptProcessor)
        -- super(...) made self above
    return self
end


function BasicProfileActionScriptProcessor._new1(label)
    local self = setmetatable(ProfileActionScriptItem.new(label), BasicProfileActionScriptProcessor)
        -- super(...) made self above
    return self
end


function BasicProfileActionScriptProcessor:actionPerformed(actionEvent)
        ProfileActionScriptItem.actionPerformed(self, actionEvent)
        if actionEvent:getActionCommand():compareTo(self.DELETE) == 0 then
            if java_instanceof(self:getParent(), ProfileActionScriptConditionInterface) then
                local profileActionScriptConditionInterface = self:getParent()
                profileActionScriptConditionInterface:removeProcessor(self)
                JTreeInterfaceFactory.getInstance():getJTreeInterface():updateJTree()
            end
        end
end


-- throws Exception
function BasicProfileActionScriptProcessor:toXmlNode(document)
        local node = document:createElement(GenericProfileActionScriptProcessorData.NAME)
        return node
end

return BasicProfileActionScriptProcessor


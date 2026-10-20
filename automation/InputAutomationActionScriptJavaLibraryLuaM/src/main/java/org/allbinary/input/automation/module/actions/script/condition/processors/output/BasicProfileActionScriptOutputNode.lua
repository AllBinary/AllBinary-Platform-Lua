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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local Document = require("org.w3c.dom.Document")
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

local BasicProfileActionScriptOutputNode = {}
BasicProfileActionScriptOutputNode.__index = BasicProfileActionScriptOutputNode
BasicProfileActionScriptOutputNode.className = "BasicProfileActionScriptOutputNode"

function BasicProfileActionScriptOutputNode.new(...)
    local count = select("#", ...)
    if count == 1 then return BasicProfileActionScriptOutputNode._new1(...)
    elseif count == 0 then return BasicProfileActionScriptOutputNode._new0(...)
    end
end


function BasicProfileActionScriptOutputNode._new1(node)
    local self = setmetatable({}, BasicProfileActionScriptOutputNode)
        local actionNode = DomSearchHelper.getNode(GenericProfileActionScriptOutputData.NAME, node:getChildNodes())
    return self
end


function BasicProfileActionScriptOutputNode._new0()
    local self = setmetatable({}, BasicProfileActionScriptOutputNode)
    return self
end


-- throws Exception
function BasicProfileActionScriptOutputNode:toXmlNode(document)
        local node = document:createElement(GenericProfileActionScriptOutputData.NAME)
        return node
end

return BasicProfileActionScriptOutputNode


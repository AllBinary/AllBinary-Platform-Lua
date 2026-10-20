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

local BasicProfileActionScriptProcessor = require("org.allbinary.input.automation.actions.script.condition.processors.BasicProfileActionScriptProcessor")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ProfileActionScriptOutputInterface = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicProfileActionScriptOutput = {}
BasicProfileActionScriptOutput.__index = BasicProfileActionScriptOutput
BasicProfileActionScriptOutput.className = "BasicProfileActionScriptOutput"
setmetatable(BasicProfileActionScriptOutput, {__index = BasicProfileActionScriptProcessor})

function BasicProfileActionScriptOutput.new(...)
    local count = select("#", ...)
    if count == 2 then return BasicProfileActionScriptOutput._new2(...)
    elseif count == 1 then return BasicProfileActionScriptOutput._new1(...)
    end
end


function BasicProfileActionScriptOutput._new2(label, node)
    local self = setmetatable(BasicProfileActionScriptProcessor.new(label, node), BasicProfileActionScriptOutput)
        -- super(...) made self above
    return self
end


function BasicProfileActionScriptOutput._new1(label)
    local self = setmetatable(BasicProfileActionScriptProcessor.new(label), BasicProfileActionScriptOutput)
        -- super(...) made self above
    return self
end


-- throws Exception
function BasicProfileActionScriptOutput:toXmlNode(document)
        local node = document:createElement(GenericProfileActionScriptOutputData.NAME)
        return node
end

return BasicProfileActionScriptOutput


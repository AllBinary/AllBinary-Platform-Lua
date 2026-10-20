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

-- local HashMap = require("java.util.HashMap")
-- local Iterator = require("java.util.Iterator")
-- local Set = require("java.util.Set")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local BasicProfileActionScriptProcessor = require("org.allbinary.input.automation.actions.script.condition.processors.BasicProfileActionScriptProcessor")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ProfileActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicProfileActionScriptInput = {}
BasicProfileActionScriptInput.__index = BasicProfileActionScriptInput
BasicProfileActionScriptInput.className = "BasicProfileActionScriptInput"
setmetatable(BasicProfileActionScriptInput, {__index = BasicProfileActionScriptProcessor})

function BasicProfileActionScriptInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputRobotInterface = nil
    self.time = 0
end

function BasicProfileActionScriptInput.new(...)
    local count = select("#", ...)
    if count == 2 then return BasicProfileActionScriptInput._new2(...)
    elseif count == 1 then return BasicProfileActionScriptInput._new1(...)
    end
end


function BasicProfileActionScriptInput._new2(label, node)
    local self = setmetatable(BasicProfileActionScriptProcessor.new(label, node), BasicProfileActionScriptInput)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(tostring(self.commonStrings.START) .. label, self, self.commonStrings.CONSTRUCTOR)
        local actionNode = DomSearchHelper.getNode(GenericProfileActionScriptInputData.TYPE, node:getChildNodes())
        local inputTypeString = DomNodeHelper.getTextNodeValue(actionNode)
        local timeNode = DomSearchHelper.getNodeNoThrow(GenericProfileActionScriptInputData.DELAY, node:getChildNodes())
        if timeNode ~= nil then
            local delayString = DomNodeHelper.getTextNodeValue(timeNode)
            self:setTime(math.tointeger(tostring(delayString) // 1))
        else
            self:setTime(0)
        end
        self:setInputRobotInterface(InputRobotFactory.getInstance():get(inputTypeString))
    return self
end


function BasicProfileActionScriptInput._new1(label)
    local self = setmetatable(BasicProfileActionScriptProcessor.new(label), BasicProfileActionScriptInput)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(tostring(self.commonStrings.START) .. label, self, self.commonStrings.CONSTRUCTOR)
        local inputRobotFactory = InputRobotFactory.getInstance()
        local hashtable = inputRobotFactory:get()
        local set = hashtable:keySet()
        local iterator = set:iterator()
        self:setInputRobotInterface(inputRobotFactory:get(iterator:next()))
        self:setTime(0)
    return self
end


function BasicProfileActionScriptInput:getTime()
        return self.time
end


function BasicProfileActionScriptInput:setTime(time)
        self.time = time
end


function BasicProfileActionScriptInput:BasicProfileActionScriptInput_toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(GenericProfileActionScriptInputData.TYPE, self:getInputRobotInterface():getName())
        hashMap:put(GenericProfileActionScriptInputData.DELAY, tostring(self:getTime()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function BasicProfileActionScriptInput:toXmlNode(document)
        local node = ModDomHelper.createNodeWithValueNodes(document, GenericProfileActionScriptInputData.NAME, self:BasicProfileActionScriptInput_toHashMap())
        return node
end


function BasicProfileActionScriptInput:setInputRobotInterface(inputRobotInterface)
        self.inputRobotInterface = inputRobotInterface
end


function BasicProfileActionScriptInput:getInputRobotInterface()
        return self.inputRobotInterface
end


function BasicProfileActionScriptInput:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicProfileActionScriptProcessor))
        stringBuffer:append(" Input Type: ")
        if self:getInputRobotInterface() ~= nil then
            stringBuffer:append(self:getInputRobotInterface():getName())
        else
            stringBuffer:append(StringUtil.getInstance().NULL_STRING)
        end
        stringBuffer:append(" Time: ")
        stringBuffer:appendlong(self:getTime())
        return tostring(stringBuffer)
end
BasicProfileActionScriptInput.__tostring = function(self) return self:toString() end

return BasicProfileActionScriptInput


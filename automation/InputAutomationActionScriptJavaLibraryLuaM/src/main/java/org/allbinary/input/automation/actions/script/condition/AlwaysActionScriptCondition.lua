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

-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local BasicProfileActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition")
local AlwaysActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptConditionInterface")

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

local AlwaysActionScriptCondition = {}
AlwaysActionScriptCondition.__index = AlwaysActionScriptCondition
AlwaysActionScriptCondition.className = "AlwaysActionScriptCondition"
setmetatable(AlwaysActionScriptCondition, {__index = BasicProfileActionScriptCondition})

function AlwaysActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.alwaysActionScriptConditionJPanel = nil
    self.isOn = false
end

function AlwaysActionScriptCondition.new(...)
    local count = select("#", ...)
    if count == 1 then return AlwaysActionScriptCondition._new1(...)
    elseif count == 0 then return AlwaysActionScriptCondition._new0(...)
    end
end


function AlwaysActionScriptCondition._new1(node)
    local self = setmetatable(BasicProfileActionScriptCondition.new(AlwaysActionScriptCondition.NAME, node), AlwaysActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        local actionNode = DomSearchHelper.getNode(AlwaysActionScriptConditionData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():compareTo(AlwaysActionScriptConditionData.IS_ON) == 0 then
                    local booleanString = DomNodeHelper.getTextNodeValue(childNode)
                    self:setIsOn(booleanString)
                else
                    error(java_exception("Exception", "Action Script Condition Unknown Node"), 0)
                end
            end
        else
            error(java_exception("Exception", "Action Script Condition Node Null"), 0)
        end
        self:init()
    return self
end


function AlwaysActionScriptCondition._new0()
    local self = setmetatable(BasicProfileActionScriptCondition.new(AlwaysActionScriptCondition.NAME), AlwaysActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        self:init()
    return self
end


function AlwaysActionScriptCondition:init()
        self.alwaysActionScriptConditionJPanel = AlwaysActionScriptConditionJPanel.new(self)
end


function AlwaysActionScriptCondition:isIsOn()
        return self.isOn
end


function AlwaysActionScriptCondition:setIsOn(isOn)
        self.isOn = isOn
end


function AlwaysActionScriptCondition:showDialog()
        self.alwaysActionScriptConditionJPanel:getAlwaysActionJDialog():setVisible(true)
end


function AlwaysActionScriptCondition:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(AlwaysActionScriptConditionData.IS_ON, tostring(self:isIsOn()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function AlwaysActionScriptCondition:toXmlNode(document)
        local node = BasicProfileActionScriptCondition.toXmlNode(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, AlwaysActionScriptConditionData.NAME, self:toHashMap()))
        return node
end


-- throws Exception
function AlwaysActionScriptCondition:shouldProcess(frame)
        if self:isIsOn() then
            return BasicProfileActionScriptCondition.shouldProcess(self, frame)
        end
        return false
end


function AlwaysActionScriptCondition:log()
        self.logUtil:putF("Is On: " .. tostring(self:isIsOn()), self, "log")
end

AlwaysActionScriptCondition.NAME = "Always On/Off"

return AlwaysActionScriptCondition


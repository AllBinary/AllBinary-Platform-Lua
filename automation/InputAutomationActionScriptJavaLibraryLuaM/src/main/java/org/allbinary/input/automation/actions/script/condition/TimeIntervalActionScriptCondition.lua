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
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local BasicProfileActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition")
local TimeIntervalActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionInterface")

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

local TimeIntervalActionScriptCondition = {}
TimeIntervalActionScriptCondition.__index = TimeIntervalActionScriptCondition
TimeIntervalActionScriptCondition.className = "TimeIntervalActionScriptCondition"
setmetatable(TimeIntervalActionScriptCondition, {__index = BasicProfileActionScriptCondition})

function TimeIntervalActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.timeIntervalActionScriptConditionJPanel = nil
    self.timeHelper = nil
end

function TimeIntervalActionScriptCondition.new(...)
    local count = select("#", ...)
    if count == 1 then return TimeIntervalActionScriptCondition._new1(...)
    elseif count == 0 then return TimeIntervalActionScriptCondition._new0(...)
    end
end


function TimeIntervalActionScriptCondition._new1(node)
    local self = setmetatable(BasicProfileActionScriptCondition.new(TimeIntervalActionScriptCondition.NAME, node), TimeIntervalActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        local actionNode = DomSearchHelper.getNode(TimeIntervalActionScriptConditionData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():compareTo(TimeIntervalActionScriptConditionData.TIME) == 0 then
                    local interval = DomNodeHelper.getTextNodeValue(childNode)
                    self:setTimeDelayHelper(TimeDelayHelper.new(tostring(interval)))
                else
                    error(java_exception("Exception", "Time Interval Action Script Condition Unknown Node"), 0)
                end
            end
        else
            error(java_exception("Exception", "Time Interval Action Script Condition Node Null"), 0)
        end
        self:init()
    return self
end


function TimeIntervalActionScriptCondition._new0()
    local self = setmetatable(BasicProfileActionScriptCondition.new(TimeIntervalActionScriptCondition.NAME), TimeIntervalActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        self:setTimeDelayHelper(TimeDelayHelper.new(0))
        self:init()
    return self
end


function TimeIntervalActionScriptCondition:init()
        self.timeIntervalActionScriptConditionJPanel = TimeIntervalActionScriptConditionJPanel.new(self)
end


function TimeIntervalActionScriptCondition:showDialog()
        self.timeIntervalActionScriptConditionJPanel:getTimeIntervalActionJDialog():setVisible(true)
end


function TimeIntervalActionScriptCondition:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(TimeIntervalActionScriptConditionData.TIME, tostring(self.timeHelper.delay))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function TimeIntervalActionScriptCondition:toXmlNode(document)
        local node = BasicProfileActionScriptCondition.toXmlNode(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, TimeIntervalActionScriptConditionData.NAME, self:toHashMap()))
        return node
end


function TimeIntervalActionScriptCondition:log()
        self.logUtil:putF("Time Interval: " .. tostring(self.timeHelper.delay), self, "log")
end


function TimeIntervalActionScriptCondition:getTimeDelayHelper()
        return self.timeHelper
end


function TimeIntervalActionScriptCondition:setTimeDelayHelper(timeHelper)
        self.timeHelper = timeHelper
end


-- throws Exception
function TimeIntervalActionScriptCondition:shouldProcess(frame)
        local timeHelper = self:getTimeDelayHelper()
        if timeHelper:isTimeTNT() then
            timeHelper:setStartTimeTNT()
            return BasicProfileActionScriptCondition.shouldProcess(self, frame)
        end
        return false
end

TimeIntervalActionScriptCondition.NAME = "Time Interval"

return TimeIntervalActionScriptCondition


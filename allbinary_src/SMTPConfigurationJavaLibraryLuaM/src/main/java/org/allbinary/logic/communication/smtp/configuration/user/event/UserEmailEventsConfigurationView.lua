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
-- package org.allbinary.logic.communication.smtp.configuration.user.event

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventsConfigurationView = {}
UserEmailEventsConfigurationView.__index = UserEmailEventsConfigurationView
UserEmailEventsConfigurationView.className = "UserEmailEventsConfigurationView"

function UserEmailEventsConfigurationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.userEmailEventsConfigurationInterface = nil
end

function UserEmailEventsConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return UserEmailEventsConfigurationView._new1(...)
    elseif count == 1 then return UserEmailEventsConfigurationView._new1(...)
    end
end


function UserEmailEventsConfigurationView._new1(node)
    local self = setmetatable({}, UserEmailEventsConfigurationView)
    self:_init_fields()
        self.userEmailEventsConfigurationInterface = UserEmailEventsConfiguration.new()
        local childNodeList = node:getChildNodes()
        local emailEventConfigurationNodeVector = DomSearchHelper.getAllNodesNoThrow(UserEmailEventConfigurationData.NAME, childNodeList)
        local size = emailEventConfigurationNodeVector:size()
        for index = 0, size - 1 do
            local userEmailConfigurationNode = emailEventConfigurationNodeVector:get(index)
            local userEmailEventConfigurationView = UserEmailEventConfigurationView.new(userEmailConfigurationNode)
            self.userEmailEventsConfigurationInterface:addUserEmailEventConfiguration(userEmailEventConfigurationView:getUserEmailEventConfigurationInterface())
        end
    return self
end


function UserEmailEventsConfigurationView._new1(userEmailEventsConfigurationInterface)
    local self = setmetatable({}, UserEmailEventsConfigurationView)
    self:_init_fields()
        self.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface
    return self
end


function UserEmailEventsConfigurationView:getUserEmailEventsConfigurationInterface()
        return self.userEmailEventsConfigurationInterface
end


-- throws Exception
function UserEmailEventsConfigurationView:toXmlNode(document)
        local userEmailConfigurationMapping = UserEmailEventsConfigurationMapping.new(self.userEmailEventsConfigurationInterface)
        local node = document:createElement(UserEmailEventsConfigurationData.NAME)
        local emailEventHashMap = self:getUserEmailEventsConfigurationInterface():getEventConfigurationHashMap()
        local set = emailEventHashMap:keySet()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF("Number Of Email Events Specified in file: " .. tostring(set:size()), self, self.commonStrings.CONSTRUCTOR)
        end
        local eventNameArray = set:toArray()
        local size = (eventNameArray.n or #eventNameArray)
        for index = 0, size - 1 do
            local eventName = eventNameArray[index + 1]
            local userEmailEventsConfigurationInterface = emailEventHashMap:get(eventName)
            local userEmailEventConfigurationView = UserEmailEventConfigurationView.new(userEmailEventsConfigurationInterface)
            node:appendChild(userEmailEventConfigurationView:toXmlNode(document))
        end
        return node
end

return UserEmailEventsConfigurationView


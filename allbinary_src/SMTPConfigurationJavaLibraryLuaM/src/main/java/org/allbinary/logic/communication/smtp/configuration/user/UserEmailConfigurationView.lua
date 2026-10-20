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
-- package org.allbinary.logic.communication.smtp.configuration.user

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventsConfigurationData = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationData")
local UserEmailEventsConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local UserEmailEventsConfigurationView = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationView")
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

local UserEmailConfigurationView = {}
UserEmailConfigurationView.__index = UserEmailConfigurationView
UserEmailConfigurationView.className = "UserEmailConfigurationView"

function UserEmailConfigurationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.userEmailConfigurationInterface = nil
end

function UserEmailConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return UserEmailConfigurationView._new1(...)
    elseif count == 1 then return UserEmailConfigurationView._new1(...)
    end
end


function UserEmailConfigurationView._new1(node)
    local self = setmetatable({}, UserEmailConfigurationView)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        end
        self.userEmailConfigurationInterface = UserEmailConfiguration.new()
        local childNodeList = node:getChildNodes()
        local userEmailEventsConfigurationNode = DomSearchHelper.getNodeNoThrow(UserEmailEventsConfigurationData.NAME, childNodeList)
        local userEmailEventsConfigurationView = UserEmailEventsConfigurationView.new(userEmailEventsConfigurationNode)
        self.userEmailConfigurationInterface:setUserEmailEventsConfigurationInterface(userEmailEventsConfigurationView:getUserEmailEventsConfigurationInterface())
    return self
end


function UserEmailConfigurationView._new1(userEmailConfigurationInterface)
    local self = setmetatable({}, UserEmailConfigurationView)
    self:_init_fields()
        self.userEmailConfigurationInterface = userEmailConfigurationInterface
    return self
end


function UserEmailConfigurationView:getEmailConfigurationInterface()
        return self.userEmailConfigurationInterface
end


-- throws Exception
function UserEmailConfigurationView:toXmlNode(document)
        local emailConfigurationMapping = UserEmailConfigurationMapping.new(self.userEmailConfigurationInterface)
        local hashMap = emailConfigurationMapping:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, UserEmailConfigurationData.NAME, hashMap)
        local userEmailConfigurationInterface = self:getEmailConfigurationInterface()
        local userEmailEventsConfigurationInterface = userEmailConfigurationInterface:getUserEmailEventsConfigurationInterface()
        local userEmailEventsConfigurationView = UserEmailEventsConfigurationView.new(userEmailEventsConfigurationInterface)
        node:appendChild(userEmailEventsConfigurationView:toXmlNode(document))
        return node
end

return UserEmailConfigurationView


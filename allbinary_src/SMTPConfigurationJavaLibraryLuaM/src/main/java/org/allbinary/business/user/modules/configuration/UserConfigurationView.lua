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
-- package org.allbinary.business.user.modules.configuration

local EntryData = require("org.allbinary.business.entry.EntryData")
local TimeCreatedView = require("org.allbinary.business.time.created.TimeCreatedView")
local TimeLastModifiedView = require("org.allbinary.business.time.modified.TimeLastModifiedView")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local UserEmailConfigurationData = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationData")
local UserEmailConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")
local UserEmailConfigurationView = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationView")
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

local UserConfigurationView = {}
UserConfigurationView.__index = UserConfigurationView
UserConfigurationView.className = "UserConfigurationView"

function UserConfigurationView:_init_fields()
    self.userConfigurationInterface = nil
end

function UserConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return UserConfigurationView._new1(...)
    elseif count == 1 then return UserConfigurationView._new1(...)
    end
end


function UserConfigurationView._new1(node)
    local self = setmetatable({}, UserConfigurationView)
    self:_init_fields()
        self.userConfigurationInterface = UserConfiguration.new()
        local childNodeList = node:getChildNodes()
        local emailConfigurationNode = DomSearchHelper.getNode(UserEmailConfigurationData.NAME, childNodeList)
        local userEmailConfigurationView = UserEmailConfigurationView.new(emailConfigurationNode)
        local userEmailConfigurationInterface = userEmailConfigurationView:getEmailConfigurationInterface()
        self.userConfigurationInterface:setUserEmailConfigurationInterface(userEmailConfigurationInterface)
        local timeCreatedNode = DomSearchHelper.getNode(EntryData.getInstance().TIMECREATED, childNodeList)
        local timeCreatedView = TimeCreatedView.new(timeCreatedNode)
        self.userConfigurationInterface:setTimeCreated(timeCreatedView:getTimeCreated())
        local timeLastModifiedNode = DomSearchHelper.getNode(EntryData.getInstance().LASTMODIFIED, childNodeList)
        local timeLastModifiedView = TimeLastModifiedView.new(timeLastModifiedNode)
        self.userConfigurationInterface:setTimeLastModified(timeLastModifiedView:getTimeLastModified())
    return self
end


function UserConfigurationView._new1(userConfigurationInterface)
    local self = setmetatable({}, UserConfigurationView)
    self:_init_fields()
        self.userConfigurationInterface = userConfigurationInterface
    return self
end


function UserConfigurationView:getUserConfigurationInterface()
        return self.userConfigurationInterface
end


-- throws Exception
function UserConfigurationView:toXmlNode(document)
        local node = document:createElement(UserConfigurationData.NAME)
        local userEmailConfigurationView = UserEmailConfigurationView.new(self.userConfigurationInterface:getUserEmailConfigurationInterface())
        node:appendChild(userEmailConfigurationView:toXmlNode(document))
        local timeCreatedView = TimeCreatedView.new(self.userConfigurationInterface:getTimeCreated())
        node:appendChild(timeCreatedView:toXmlNode(document))
        local timeLastModifiedView = TimeLastModifiedView.new(self.userConfigurationInterface:getTimeLastModified())
        node:appendChild(timeLastModifiedView:toXmlNode(document))
        return node
end

return UserConfigurationView


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
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
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

local UserEmailEventConfigurationView = {}
UserEmailEventConfigurationView.__index = UserEmailEventConfigurationView
UserEmailEventConfigurationView.className = "UserEmailEventConfigurationView"

function UserEmailEventConfigurationView:_init_fields()
    self.userEmailEventConfigurationInterface = nil
end

function UserEmailEventConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return UserEmailEventConfigurationView._new1(...)
    elseif count == 1 then return UserEmailEventConfigurationView._new1(...)
    end
end


function UserEmailEventConfigurationView._new1(node)
    local self = setmetatable({}, UserEmailEventConfigurationView)
    self:_init_fields()
        local childNodeList = node:getChildNodes()
        local hashMap = StdUtil.getInstance():createHashMap()
        local name = DomNodeHelper.getTextNodeValue(UserEmailEventConfigurationData.NAME, childNodeList)
        hashMap:put(UserEmailEventConfigurationData.NAME, name)
        local eventListenerClassPath = DomNodeHelper.getTextNodeValue(UserEmailEventConfigurationData.LISTENER_CLASSPATH, childNodeList)
        hashMap:put(UserEmailEventConfigurationData.LISTENER_CLASSPATH, eventListenerClassPath)
        self:setUserEmailEventConfigurationInterface(UserEmailEventConfiguration.new(hashMap))
    return self
end


function UserEmailEventConfigurationView._new1(userEmailEventConfigurationInterface)
    local self = setmetatable({}, UserEmailEventConfigurationView)
    self:_init_fields()
        self:setUserEmailEventConfigurationInterface(userEmailEventConfigurationInterface)
    return self
end


-- throws Exception
function UserEmailEventConfigurationView:toXmlNode(document)
        local userEmailEventConfigurationMapping = UserEmailEventConfigurationMapping.new(self:getUserEmailEventConfigurationInterface())
        local hashMap = userEmailEventConfigurationMapping:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, UserEmailEventConfigurationData.NAME, hashMap)
        return node
end


function UserEmailEventConfigurationView:getUserEmailEventConfigurationInterface()
        return self.userEmailEventConfigurationInterface
end


function UserEmailEventConfigurationView:setUserEmailEventConfigurationInterface(userEmailEventConfigurationInterface)
        self.userEmailEventConfigurationInterface = userEmailEventConfigurationInterface
end

return UserEmailEventConfigurationView


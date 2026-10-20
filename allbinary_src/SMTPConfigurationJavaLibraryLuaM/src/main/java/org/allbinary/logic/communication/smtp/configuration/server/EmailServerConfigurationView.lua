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
-- package org.allbinary.logic.communication.smtp.configuration.server

-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
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

local EmailServerConfigurationView = {}
EmailServerConfigurationView.__index = EmailServerConfigurationView
EmailServerConfigurationView.className = "EmailServerConfigurationView"

function EmailServerConfigurationView:_init_fields()
    self.emailServerConfigurationInterface = nil
end

function EmailServerConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return EmailServerConfigurationView._new1(...)
    elseif count == 1 then return EmailServerConfigurationView._new1(...)
    end
end


function EmailServerConfigurationView._new1(node)
    local self = setmetatable({}, EmailServerConfigurationView)
    self:_init_fields()
        local childNodeList = node:getChildNodes()
        local server = DomNodeHelper.getTextNodeValue(EmailServerConfigurationData.SERVER, childNodeList)
        local accountName = DomNodeHelper.getTextNodeValue(EmailServerConfigurationData.ACCOUNT, childNodeList)
        local password = DomNodeHelper.getTextNodeValue(EmailServerConfigurationData.PASSWORD, childNodeList)
        self.emailServerConfigurationInterface = EmailServerConfiguration.new(accountName, password, server)
    return self
end


function EmailServerConfigurationView._new1(emailServerConfigurationInterface)
    local self = setmetatable({}, EmailServerConfigurationView)
    self:_init_fields()
        self.emailServerConfigurationInterface = emailServerConfigurationInterface
    return self
end


function EmailServerConfigurationView:getEmailConfigurationInterface()
        return self.emailServerConfigurationInterface
end


-- throws Exception
function EmailServerConfigurationView:toXmlNode(document)
        local emailConfigurationMapping = EmailServerConfigurationMapping.new(self.emailServerConfigurationInterface)
        local hashMap = emailConfigurationMapping:toHashMap()
        local node = ModDomHelper.createNodeWithValueNodes(document, EmailServerConfigurationData.NAME, hashMap)
        return node
end

return EmailServerConfigurationView


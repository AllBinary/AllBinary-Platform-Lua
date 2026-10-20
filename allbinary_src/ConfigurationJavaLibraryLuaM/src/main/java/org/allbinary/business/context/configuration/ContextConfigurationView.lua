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
-- package org.allbinary.business.context.configuration

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local EmailServerConfigurationData = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationData")
local EmailServerConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local EmailServerConfigurationView = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationView")
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

local ContextConfigurationView = {}
ContextConfigurationView.__index = ContextConfigurationView
ContextConfigurationView.className = "ContextConfigurationView"

function ContextConfigurationView:_init_fields()
    self.contextConfigurationInterface = nil
end

function ContextConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return ContextConfigurationView._new1(...)
    elseif count == 1 then return ContextConfigurationView._new1(...)
    end
end


function ContextConfigurationView._new1(node)
    local self = setmetatable({}, ContextConfigurationView)
    self:_init_fields()
        local childNodeList = node:getChildNodes()
        self.contextConfigurationInterface = ContextConfiguration.new()
        local emailConfigurationNode = DomSearchHelper.getNode(EmailServerConfigurationData.NAME, childNodeList)
        local emailServerConfigurationView = EmailServerConfigurationView.new(emailConfigurationNode)
        self.contextConfigurationInterface:setEmailServerConfigurationInterface(emailServerConfigurationView:getEmailConfigurationInterface())
    return self
end


function ContextConfigurationView._new1(contextConfigurationInterface)
    local self = setmetatable({}, ContextConfigurationView)
    self:_init_fields()
        self.contextConfigurationInterface = contextConfigurationInterface
    return self
end


function ContextConfigurationView:getContextConfigurationInterface()
        return self.contextConfigurationInterface
end


-- throws Exception
function ContextConfigurationView:toXmlNode(document)
        local node = document:createElement(ContextConfigurationData.getInstance().NAME)
        local emailServerConfigurationView = EmailServerConfigurationView.new(self:getContextConfigurationInterface():getEmailServerConfigurationInterface())
        node:appendChild(emailServerConfigurationView:toXmlNode(document))
        return node
end

return ContextConfigurationView


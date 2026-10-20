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
-- package org.allbinary.logic.communication.ftp.configuration

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

local FtpConfigurationView = {}
FtpConfigurationView.__index = FtpConfigurationView
FtpConfigurationView.className = "FtpConfigurationView"

function FtpConfigurationView:_init_fields()
    self.ftpConfigurationInterface = nil
end

function FtpConfigurationView.new(...)
    local count = select("#", ...)
    if count == 1 then return FtpConfigurationView._new1(...)
    elseif count == 1 then return FtpConfigurationView._new1(...)
    end
end


function FtpConfigurationView._new1(node)
    local self = setmetatable({}, FtpConfigurationView)
    self:_init_fields()
        self:setFtpConfigurationInterface(FtpConfiguration.new())
        local chileNodeList = node:getChildNodes()
        local server = DomNodeHelper.getTextNodeValue(FtpConfigurationData.SERVER, chileNodeList)
        self:getFtpConfigurationInterface():setServer(server)
        local userName = DomNodeHelper.getTextNodeValue(FtpConfigurationData.USERNAME, chileNodeList)
        self:getFtpConfigurationInterface():setUserName(userName)
        local password = DomNodeHelper.getTextNodeValue(FtpConfigurationData.PASSWORD, chileNodeList)
        self:getFtpConfigurationInterface():setPassword(password)
        local path = DomNodeHelper.getTextNodeValue(FtpConfigurationData.PATH, chileNodeList)
        self:getFtpConfigurationInterface():setPath(path)
    return self
end


function FtpConfigurationView._new1(ftpConfigurationInterface)
    local self = setmetatable({}, FtpConfigurationView)
    self:_init_fields()
        self:setFtpConfigurationInterface(ftpConfigurationInterface)
    return self
end


-- throws Exception
function FtpConfigurationView:toXmlNode(document)
        local ftpConfigurationMapping = FtpConfigurationMapping.new(self:getFtpConfigurationInterface())
        local hashMap = ftpConfigurationMapping:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, FtpConfigurationData.NAME, hashMap)
        return node
end


function FtpConfigurationView:getFtpConfigurationInterface()
        return self.ftpConfigurationInterface
end


function FtpConfigurationView:setFtpConfigurationInterface(ftpConfigurationInterface)
        self.ftpConfigurationInterface = ftpConfigurationInterface
end

return FtpConfigurationView


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
-- package org.allbinary.input.automation.module.generic.configuration.profile

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local GenericProfileActions = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local GenericProfile = {}
GenericProfile.__index = GenericProfile
GenericProfile.className = "GenericProfile"

function GenericProfile:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.name = nil
    self.vector = nil
    self.genericProfileActions = nil
end

function GenericProfile.new(...)
    local count = select("#", ...)
    if count == 1 then return GenericProfile._new1(...)
    elseif count == 1 then return GenericProfile._new1(...)
    end
end


function GenericProfile._new1(node)
    local self = setmetatable({}, GenericProfile)
    self:_init_fields()
        self:setName(DomNodeHelper.getTextNodeValue(node))
        self.vector = BasicArrayListD.new()
        local nodeList = node:getChildNodes()
        self.logUtil:putF("Name: " .. self:getName() .. " Child Nodes: " .. tostring(nodeList:getLength()), self, "Contructor")
        for index = 0, nodeList:getLength() - 1 do
            local profileNode = nodeList:item(index)
            if profileNode:getNodeName():compareTo(GenericProfileDataWorkerData.NAME) == 0 then
                local genericProfileDataWorkerType = GenericProfileDataWorkerType.getInstance(profileNode)
                self.logUtil:putF("Adding GenericProfileDataWorkerType: " .. tostring(genericProfileDataWorkerType), self, "Contructor")
                self.vector:add(genericProfileDataWorkerType)
            end
        end
    return self
end


function GenericProfile._new1(name)
    local self = setmetatable({}, GenericProfile)
    self:_init_fields()
        self:setName(name)
        self.vector = BasicArrayListD.new()
    return self
end


function GenericProfile:getGenericProfileDataWorkerTypeVector()
        return self.vector
end


function GenericProfile:add(genericProfileDataWorkerType)
        if not self.vector:contains(genericProfileDataWorkerType) then
            self.vector:add(genericProfileDataWorkerType)
        end
end


function GenericProfile:remove(genericProfileDataWorkerType)
        self.vector:remove(genericProfileDataWorkerType)
end


-- throws Exception
function GenericProfile:toXmlNode(document)
        local node = ModDomHelper.createTextNode(document, GenericProfileData.NAME, self.name)
        local size = self.vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = self.vector:get(index)
            node:appendChild(genericProfileDataWorkerType:toXmlNode(document))
        end
        return node
end


function GenericProfile:getName()
        return self.name
end


function GenericProfile:setName(name)
        self.name = name
end


function GenericProfile:getGenericProfileActions()
        return self.genericProfileActions
end


function GenericProfile:setGenericProfileActions(genericProfileActions)
        self.genericProfileActions = genericProfileActions
end

return GenericProfile


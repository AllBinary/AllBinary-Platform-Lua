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
-- package org.allbinary.input.automation.module.configuration

-- local XmlAccessType = require("javax.xml.bind.annotation.XmlAccessType")
-- local XmlAccessorType = require("javax.xml.bind.annotation.XmlAccessorType")
-- local XmlElement = require("javax.xml.bind.annotation.XmlElement")
-- local XmlRootElement = require("javax.xml.bind.annotation.XmlRootElement")
-- local XmlType = require("javax.xml.bind.annotation.XmlType")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local InputAutomationData = require("org.allbinary.input.automation.InputAutomationData")
local InputAutomationModuleData = require("org.allbinary.input.automation.module.InputAutomationModuleData")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

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

local InputAutomationModuleConfiguration = {}
InputAutomationModuleConfiguration.__index = InputAutomationModuleConfiguration
InputAutomationModuleConfiguration.className = "InputAutomationModuleConfiguration"

function InputAutomationModuleConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.className = nil
    self.name = nil
    self.inputAutomationModuleInterface = nil
end

function InputAutomationModuleConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return InputAutomationModuleConfiguration._new0(...)
    elseif count == 2 then return InputAutomationModuleConfiguration._new2(...)
    elseif count == 3 then return InputAutomationModuleConfiguration._new3(...)
    elseif count == 1 then return InputAutomationModuleConfiguration._new1(...)
    end
end


function InputAutomationModuleConfiguration._new0()
    local self = setmetatable({}, InputAutomationModuleConfiguration)
    self:_init_fields()
    return self
end


function InputAutomationModuleConfiguration._new2(abeClientInformation, node)
    local self = setmetatable({}, InputAutomationModuleConfiguration)
    self:_init_fields()
        self:init(abeClientInformation, node)
    return self
end


function InputAutomationModuleConfiguration._new3(abeClientInformation, name, className)
    local self = setmetatable({}, InputAutomationModuleConfiguration)
    self:_init_fields()
        self:setName(name)
        self:setClassName(className)
        self:init(abeClientInformation)
    return self
end


function InputAutomationModuleConfiguration._new1(inputAutomationModuleInterface)
    local self = setmetatable({}, InputAutomationModuleConfiguration)
    self:_init_fields()
        self:setInputAutomationModuleInterface(inputAutomationModuleInterface)
        self:setClassName(getmetatable(self.inputAutomationModuleInterface).className)
    return self
end


-- throws Exception
function InputAutomationModuleConfiguration:init(abeClientInformation, node)
        local nodeList = node:getChildNodes()
        if nodeList ~= nil then
            local classNameNode = DomSearchHelper.getNode(DynamicObjectData.NAME, nodeList)
            if classNameNode ~= nil then
                self:setClassName(DomNodeHelper.getTextNodeValue(classNameNode))
                self:init(abeClientInformation)
            else
                self.logUtil:putF("Class Node Null", self, self.commonStrings.INIT)
            end
        else
            self.logUtil:putF(tostring(InputAutomationData.NAME) .. " Node Has No Children", self, "Contructor")
        end
end


-- Java overloaded method: Lua keeps the last definition
function InputAutomationModuleConfiguration:init(abeClientInformation)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Name: " .. self:getName(), self, self.commonStrings.INIT)
            self.logUtil:putF("ClassName: " .. self.className, self, self.commonStrings.INIT)
            self:setInputAutomationModuleInterface(AbeFactory.getInstance():getInstance():getInstance(abeClientInformation, self:getClassName()))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
            error(java_exception("RuntimeException"), 0)
        end
end


-- throws Exception
function InputAutomationModuleConfiguration:toDomNode(document)
        local node = document:createElement(InputAutomationModuleData.NAME)
        local classNameNode = ModDomHelper.createTextNode(document, DynamicObjectData.NAME, self:getClassName())
        node:appendChild(classNameNode)
        return node
end


function InputAutomationModuleConfiguration:getName()
        return self.name
end


function InputAutomationModuleConfiguration:setName(name)
        self.logUtil:putF("Name: " .. name, self, "setName")
        self.name = name
end


function InputAutomationModuleConfiguration:getClassName()
        return self.className
end


function InputAutomationModuleConfiguration:setClassName(className)
        self.logUtil:putF("ClassName : " .. className, self, "setClassName")
        self.className = className
end


function InputAutomationModuleConfiguration:getInputAutomationModuleInterface()
        return self.inputAutomationModuleInterface
end


function InputAutomationModuleConfiguration:setInputAutomationModuleInterface(inputAutomationModuleInterface)
        self.logUtil:putF("InputAutomationModuleFactoryInterface : " .. tostring(inputAutomationModuleInterface), self, "setInputAutomationModuleInterface")
        self.inputAutomationModuleInterface = inputAutomationModuleInterface
        self:setName(self.inputAutomationModuleInterface:getName())
end

return InputAutomationModuleConfiguration


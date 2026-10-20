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
-- package org.allbinary.input.automation.configuration

-- local File = require("java.io.File")
-- local List = require("java.util.List")
-- local JAXBContext = require("javax.xml.bind.JAXBContext")
-- local Marshaller = require("javax.xml.bind.Marshaller")
-- local XmlAccessType = require("javax.xml.bind.annotation.XmlAccessType")
-- local XmlAccessorType = require("javax.xml.bind.annotation.XmlAccessorType")
-- local XmlElement = require("javax.xml.bind.annotation.XmlElement")
-- local XmlRootElement = require("javax.xml.bind.annotation.XmlRootElement")
-- local XmlType = require("javax.xml.bind.annotation.XmlType")
local DomDocumentFileHelper = require("org.allbinary.data.tree.dom.document.DomDocumentFileHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local InputAutomationModuleConfiguration = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local FileWrapperUtil = require("org.allbinary.logic.io.file.FileWrapperUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Document = require("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--name="inputAutomationConfiguration", 
local InputAutomationConfiguration = {}
InputAutomationConfiguration.__index = InputAutomationConfiguration
InputAutomationConfiguration.className = "InputAutomationConfiguration"

function InputAutomationConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.installed = false
    self.inputAutomationModuleConfigurationList = nil
end


function InputAutomationConfiguration.new()
    local self = setmetatable({}, InputAutomationConfiguration)
    self:_init_fields()
    return self
end


function InputAutomationConfiguration.getFile()
        return File.new(InputAutomationConfiguration.FILENAME)
end


function InputAutomationConfiguration:isInstalled()
        return self.installed
end


function InputAutomationConfiguration:setInstalled(installed)
        self.installed = installed
        self.logUtil:putF("Installed: " .. tostring(installed), self, "setIntalled")
end


function InputAutomationConfiguration:getInputAutomationModuleConfigurationList()
        return self.inputAutomationModuleConfigurationList
end


-- throws Exception
function InputAutomationConfiguration:save()
        local document = DomDocumentHelper.create()
        local file = File.new(InputAutomationConfiguration.FILENAME)
        FileUtil.getInstance():copy(AbPath.new(file:getAbsolutePath(), StringUtil.getInstance().EMPTY_STRING), AbPath.new(tostring(file:getAbsolutePath()) .. ".bak.xml", StringUtil.getInstance().EMPTY_STRING))
        local jaxbContext = JAXBContext.newInstance(InputAutomationConfiguration)
        local marshaller = jaxbContext:createMarshaller()
        marshaller:setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true)
        marshaller:marshal(self, document)
        DomDocumentFileHelper.save(FileWrapperUtil.wrapFile(file), document)
end

InputAutomationConfiguration.FILENAME = "InputAutomationConfig.xml"

return InputAutomationConfiguration


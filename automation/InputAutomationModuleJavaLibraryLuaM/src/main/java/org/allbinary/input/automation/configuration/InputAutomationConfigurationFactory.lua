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
-- local FileInputStream = require("java.io.FileInputStream")
-- local List = require("java.util.List")
-- local JAXBContext = require("javax.xml.bind.JAXBContext")
-- local JAXBElement = require("javax.xml.bind.JAXBElement")
-- local Unmarshaller = require("javax.xml.bind.Unmarshaller")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local InputAutomationModuleConfiguration = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationConfigurationFactory = {}
InputAutomationConfigurationFactory.__index = InputAutomationConfigurationFactory
InputAutomationConfigurationFactory.className = "InputAutomationConfigurationFactory"

function InputAutomationConfigurationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputAutomationConfiguration = nil
end


function InputAutomationConfigurationFactory.getInstance()
        return InputAutomationConfigurationFactory.instance
end


function InputAutomationConfigurationFactory.new()
    local self = setmetatable({}, InputAutomationConfigurationFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function InputAutomationConfigurationFactory:init(abeClientInformation)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local INPUT_AUTOMATION_CONFIGURATION = "InputAutomationConfiguration"
        local file = InputAutomationConfiguration.getFile()
        if file:isFile() then
            logUtil:putF("LoadingConfiguration", INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT)
            local jaxbContext = JAXBContext.newInstance(InputAutomationConfiguration)
            local unmarshaller = jaxbContext:createUnmarshaller()
            local root = unmarshaller:unmarshal(StreamSource.new(FileInputStream.new(file)), InputAutomationConfiguration)
            self.inputAutomationConfiguration = root:getValue()
            local inputAutomationModuleConfigurationList = self.inputAutomationConfiguration:getInputAutomationModuleConfigurationList()
            logUtil:putF("isInstalled: " .. tostring(self.inputAutomationConfiguration:isInstalled()) .. " inputAutomationModuleConfigurationList: " .. tostring(inputAutomationModuleConfigurationList), INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT)
            if inputAutomationModuleConfigurationList ~= nil then
                local size = inputAutomationModuleConfigurationList:size()
                local inputAutomationModuleConfiguration = nil
                for index = 0, size - 1 do
                    inputAutomationModuleConfiguration = inputAutomationModuleConfigurationList:get(index)
                    inputAutomationModuleConfiguration:init(abeClientInformation)
                end
            end
            logUtil:putF("LoadedConfiguration", INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT)
        else
            logUtil:putF("New Configuration", INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT)
            self.inputAutomationConfiguration = InputAutomationConfiguration.new()
        end
end

InputAutomationConfigurationFactory.instance = InputAutomationConfigurationFactory.new()

return InputAutomationConfigurationFactory


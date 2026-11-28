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

local InputAutomationConfigurationFactory = {}
package.loaded["org.allbinary.input.automation.configuration.InputAutomationConfigurationFactory"] = InputAutomationConfigurationFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local File = java_lazy("java.io.File")
local FileInputStream = java_lazy("java.io.FileInputStream")
-- local List = require("java.util.List")
-- local JAXBContext = require("javax.xml.bind.JAXBContext")
-- local JAXBElement = require("javax.xml.bind.JAXBElement")
-- local Unmarshaller = require("javax.xml.bind.Unmarshaller")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local InputAutomationModuleConfiguration = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local InputAutomationConfiguration = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfiguration")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InputAutomationConfigurationFactory is declared before the requires
InputAutomationConfigurationFactory.__index = InputAutomationConfigurationFactory
InputAutomationConfigurationFactory.className = "InputAutomationConfigurationFactory"
InputAutomationConfigurationFactory.javaClassName = "org.allbinary.input.automation.configuration.InputAutomationConfigurationFactory"

function InputAutomationConfigurationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputAutomationConfiguration = nil
end


function InputAutomationConfigurationFactory.getInstance()
        return InputAutomationConfigurationFactory.instance_f
end


function InputAutomationConfigurationFactory._jinit(self)
    InputAutomationConfigurationFactory._init_fields(self)
    return self
end

function InputAutomationConfigurationFactory.new(...)
    local self = setmetatable({}, InputAutomationConfigurationFactory)
    InputAutomationConfigurationFactory._jinit(self, ...)
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
            logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("isInstalled: ") .. require("allbinary_java").to_string(self.inputAutomationConfiguration:isInstalled())) .. require("allbinary_java").to_string(" inputAutomationModuleConfigurationList: ")) .. require("allbinary_java").to_string(inputAutomationModuleConfigurationList), INPUT_AUTOMATION_CONFIGURATION, commonStrings.INIT)
            if not rawequal(inputAutomationModuleConfigurationList, nil) then
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

InputAutomationConfigurationFactory.instance_f = InputAutomationConfigurationFactory.new()

return InputAutomationConfigurationFactory


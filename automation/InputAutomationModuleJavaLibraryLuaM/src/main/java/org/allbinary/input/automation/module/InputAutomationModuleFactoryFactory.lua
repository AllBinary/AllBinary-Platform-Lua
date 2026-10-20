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
-- package org.allbinary.input.automation.module

-- local Collection = require("java.util.Collection")
-- local HashMap = require("java.util.HashMap")
-- local Iterator = require("java.util.Iterator")
-- local HelpSet = require("javax.help.HelpSet")
-- local HelpSetEvent = require("javax.help.event.HelpSetEvent")
-- local HelpSetListener = require("javax.help.event.HelpSetListener")
-- local ListModel = require("javax.swing.ListModel")
local InputAutomationModuleConfiguration = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local InputAutomationModuleConfigurations = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local JavaHelpSetNotifier = require("org.allbinary.logic.java.help.JavaHelpSetNotifier")
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

local InputAutomationModuleFactoryFactory = {}
InputAutomationModuleFactoryFactory.__index = InputAutomationModuleFactoryFactory
InputAutomationModuleFactoryFactory.className = "InputAutomationModuleFactoryFactory"

function InputAutomationModuleFactoryFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = nil
    self.defaultListModelHelper = nil
    self.helpSetListenerInterface = nil
end


function InputAutomationModuleFactoryFactory.new(inputAutomationModuleConfigurations, helpSetListenerInterface)
    local self = setmetatable({}, InputAutomationModuleFactoryFactory)
    self:_init_fields()
        self.helpSetListenerInterface = helpSetListenerInterface
        self.defaultListModelHelper = DefaultListModelHelper.new()
        self.hashMap = StdUtil.getInstance():createHashMap()
        local collection = inputAutomationModuleConfigurations:getHashMap():values()
        local iterator = collection:iterator()
        local inputAutomationModuleConfiguration = nil
        while iterator:hasNext() do
            inputAutomationModuleConfiguration = iterator:next()
            self:add(inputAutomationModuleConfiguration)
        end
        self.defaultListModelHelper:initDefaultModelList()
        self.logUtil:putF("Loaded " .. tostring(self.hashMap:size()) .. "/" .. tostring(self.defaultListModelHelper:getListModel():getSize()) .. " Input Automation Modules", self, "Contructor")
    return self
end


function InputAutomationModuleFactoryFactory:add(inputAutomationModuleConfiguration)
        local inputAutomationModuleInterface = inputAutomationModuleConfiguration:getInputAutomationModuleInterface()
        self.hashMap:put(inputAutomationModuleConfiguration:getName(), inputAutomationModuleInterface)
        self.defaultListModelHelper:add(inputAutomationModuleConfiguration:getName())
        local helpSet = inputAutomationModuleInterface:getHelpSet()
        if not JavaHelpSetNotifier.isNotified(helpSet) then
            local helpSetEvent = HelpSetEvent.new(self, helpSet, HelpSetEvent.HELPSET_ADDED)
            self.helpSetListenerInterface:helpSetAdded(helpSetEvent)
        end
end


function InputAutomationModuleFactoryFactory:getListModel()
        return self.defaultListModelHelper:getListModel()
end


function InputAutomationModuleFactoryFactory:getInstance(moduleName)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF("Getting Module: " .. moduleName, self, commonStrings.GET_INSTANCE)
        local inputAutomationModuleFactoryInterface = self.hashMap:get(moduleName)
        if inputAutomationModuleFactoryInterface == nil then
            self.logUtil:putF("Module: " .. moduleName .. " was null", self, commonStrings.GET_INSTANCE)
        end
        return inputAutomationModuleFactoryInterface
end

return InputAutomationModuleFactoryFactory


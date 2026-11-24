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

local InputAutomationModuleFactoryFactory = {}
package.loaded["org.allbinary.input.automation.module.InputAutomationModuleFactoryFactory"] = InputAutomationModuleFactoryFactory

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

-- local Collection = require("java.util.Collection")
local HashMap = java_lazy("java.util.HashMap")
local Iterator = java_lazy("java.util.Iterator")
-- local HelpSet = require("javax.help.HelpSet")
-- local HelpSetEvent = require("javax.help.event.HelpSetEvent")
-- local HelpSetListener = require("javax.help.event.HelpSetListener")
-- local ListModel = require("javax.swing.ListModel")
local InputAutomationModuleConfiguration = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local InputAutomationModuleConfigurations = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local JavaHelpSetNotifier = java_lazy("org.allbinary.logic.java.help.JavaHelpSetNotifier")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local DefaultListModelHelper = java_lazy("org.allbinary.input.automation.module.DefaultListModelHelper")
local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")

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

-- class table InputAutomationModuleFactoryFactory is declared before the requires
InputAutomationModuleFactoryFactory.__index = InputAutomationModuleFactoryFactory
InputAutomationModuleFactoryFactory.className = "InputAutomationModuleFactoryFactory"
InputAutomationModuleFactoryFactory.javaClassName = "org.allbinary.input.automation.module.InputAutomationModuleFactoryFactory"

function InputAutomationModuleFactoryFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.hashMap == nil then self.hashMap = nil end
    if self.defaultListModelHelper == nil then self.defaultListModelHelper = nil end
    if self.helpSetListenerInterface == nil then self.helpSetListenerInterface = nil end
end


function InputAutomationModuleFactoryFactory._jinit(self, inputAutomationModuleConfigurations, helpSetListenerInterface)
    InputAutomationModuleFactoryFactory._init_fields(self)
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

function InputAutomationModuleFactoryFactory.new(...)
    local self = setmetatable({}, InputAutomationModuleFactoryFactory)
    InputAutomationModuleFactoryFactory._jinit(self, ...)
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


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

-- local File = require("java.io.File")
-- local FileInputStream = require("java.io.FileInputStream")
-- local HashMap = require("java.util.HashMap")
-- local List = require("java.util.List")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local InputAutomationModuleData = require("org.allbinary.input.automation.module.InputAutomationModuleData")
local NewInputAutomationModulesData = require("org.allbinary.input.automation.module.NewInputAutomationModulesData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local InputAutomationModuleConfigurations = {}
InputAutomationModuleConfigurations.__index = InputAutomationModuleConfigurations
InputAutomationModuleConfigurations.className = "InputAutomationModuleConfigurations"

function InputAutomationModuleConfigurations:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = nil
end

function InputAutomationModuleConfigurations.new(...)
    local count = select("#", ...)
    if count == 2 then return InputAutomationModuleConfigurations._new2(...)
    elseif count == 2 then return InputAutomationModuleConfigurations._new2(...)
    elseif count == 1 then return InputAutomationModuleConfigurations._new1(...)
    elseif count == 0 then return InputAutomationModuleConfigurations._new0(...)
    end
end


function InputAutomationModuleConfigurations._new2(abeClientInformation, file)
    local self = setmetatable({}, InputAutomationModuleConfigurations)
    self:_init_fields()
        self:setHashMap(HashMap.new())
        local bytes = java_new_array(0, 100000)
        local idFile = FileInputStream.new(file)
        local length = idFile:read(bytes)
        local data = string.char(table.unpack(bytes))
        local endIndex = data:lastIndexOf(">")
        local document = DomDocumentHelper.create(string.sub(data, (0) + 1, endIndex + 1))
        local nodeList = document:getElementsByTagName(NewInputAutomationModulesData.NAME)
        if nodeList:getLength() > 0 then
            local nameNodeList = document:getElementsByTagName(InputAutomationModuleData.NAME)
            self.logUtil:putF("Number Of Module(s) Specified: " .. tostring(nameNodeList:getLength()), self, "Contructor")
            for index = 0, nameNodeList:getLength() - 1 do
                local node = nameNodeList:item(index)
                self:add(InputAutomationModuleConfiguration.new(abeClientInformation, node))
            end
        end
    return self
end


function InputAutomationModuleConfigurations._new2(abeClientInformation, document)
    local self = setmetatable({}, InputAutomationModuleConfigurations)
    self:_init_fields()
        self:setHashMap(HashMap.new())
        local nameNodeList = document:getElementsByTagName(InputAutomationModuleData.NAME)
        self.logUtil:putF("Number Of Module(s) Specified: " .. tostring(nameNodeList:getLength()), self, "Contructor")
        for index = 0, nameNodeList:getLength() - 1 do
            local node = nameNodeList:item(index)
            self:add(InputAutomationModuleConfiguration.new(abeClientInformation, node))
        end
    return self
end


function InputAutomationModuleConfigurations._new1(inputAutomationModuleConfigurationList)
    local self = setmetatable({}, InputAutomationModuleConfigurations)
    self:_init_fields()
        self:setHashMap(HashMap.new())
        local size = inputAutomationModuleConfigurationList:size()
        local inputAutomationModuleConfiguration = nil
        for index = 0, size - 1 do
            inputAutomationModuleConfiguration = inputAutomationModuleConfigurationList:get(index)
            self:add(inputAutomationModuleConfiguration)
        end
    return self
end


function InputAutomationModuleConfigurations._new0()
    local self = setmetatable({}, InputAutomationModuleConfigurations)
    self:_init_fields()
        self:setHashMap(HashMap.new())
    return self
end


function InputAutomationModuleConfigurations:add(inputAutomationModuleConfiguration)
        self:getHashMap():put(inputAutomationModuleConfiguration:getClassName(), inputAutomationModuleConfiguration)
end


function InputAutomationModuleConfigurations:remove(inputAutomationModuleConfiguration)
        self:getHashMap():remove(inputAutomationModuleConfiguration:getClassName())
end


function InputAutomationModuleConfigurations:getHashMap()
        return self.hashMap
end


function InputAutomationModuleConfigurations:setHashMap(hashMap)
        self.hashMap = hashMap
end

return InputAutomationModuleConfigurations


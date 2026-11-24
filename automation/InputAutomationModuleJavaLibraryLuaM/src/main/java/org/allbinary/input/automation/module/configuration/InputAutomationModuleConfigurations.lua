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

local InputAutomationModuleConfigurations = {}
package.loaded["org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations"] = InputAutomationModuleConfigurations

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
-- local FileInputStream = require("java.io.FileInputStream")
local HashMap = java_lazy("java.util.HashMap")
-- local List = require("java.util.List")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local InputAutomationModuleData = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleData")
local NewInputAutomationModulesData = java_lazy("org.allbinary.input.automation.module.NewInputAutomationModulesData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local InputAutomationModuleConfiguration = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

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

-- class table InputAutomationModuleConfigurations is declared before the requires
InputAutomationModuleConfigurations.__index = InputAutomationModuleConfigurations
InputAutomationModuleConfigurations.className = "InputAutomationModuleConfigurations"
InputAutomationModuleConfigurations.javaClassName = "org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations"

function InputAutomationModuleConfigurations:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.hashMap == nil then self.hashMap = nil end
end

function InputAutomationModuleConfigurations._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return InputAutomationModuleConfigurations._new2(self, ...)
    elseif count == 1 then return InputAutomationModuleConfigurations._new1(self, ...)
    elseif count == 0 then return InputAutomationModuleConfigurations._new0(self, ...)
    end
    error("No constructor of InputAutomationModuleConfigurations takes " .. count .. " arguments")
end

function InputAutomationModuleConfigurations.new(...)
    local self = setmetatable({}, InputAutomationModuleConfigurations)
    InputAutomationModuleConfigurations._jinit(self, ...)
    return self
end

function InputAutomationModuleConfigurations._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or java_is(java_a2, "File")) then return InputAutomationModuleConfigurations._new2_1(self, ...) end
    return InputAutomationModuleConfigurations._new2_2(self, ...)
end


function InputAutomationModuleConfigurations._new2_1(self, abeClientInformation, file)
    InputAutomationModuleConfigurations._init_fields(self)
        self:setHashMap(HashMap.new())
        local bytes = java_typed_array("B", java_new_array(0, 100000))
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


function InputAutomationModuleConfigurations._new2_2(self, abeClientInformation, document)
    InputAutomationModuleConfigurations._init_fields(self)
        self:setHashMap(HashMap.new())
        local nameNodeList = document:getElementsByTagName(InputAutomationModuleData.NAME)
        self.logUtil:putF("Number Of Module(s) Specified: " .. tostring(nameNodeList:getLength()), self, "Contructor")
        for index = 0, nameNodeList:getLength() - 1 do
            local node = nameNodeList:item(index)
            self:add(InputAutomationModuleConfiguration.new(abeClientInformation, node))
        end
    return self
end


function InputAutomationModuleConfigurations._new1(self, inputAutomationModuleConfigurationList)
    InputAutomationModuleConfigurations._init_fields(self)
        self:setHashMap(HashMap.new())
        local size = inputAutomationModuleConfigurationList:size()
        local inputAutomationModuleConfiguration = nil
        for index = 0, size - 1 do
            inputAutomationModuleConfiguration = inputAutomationModuleConfigurationList:get(index)
            self:add(inputAutomationModuleConfiguration)
        end
    return self
end


function InputAutomationModuleConfigurations._new0(self)
    InputAutomationModuleConfigurations._init_fields(self)
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


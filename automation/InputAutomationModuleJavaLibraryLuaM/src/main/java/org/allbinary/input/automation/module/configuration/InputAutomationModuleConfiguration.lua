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

local InputAutomationModuleConfiguration = {}
package.loaded["org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration"] = InputAutomationModuleConfiguration

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

-- local XmlAccessType = require("javax.xml.bind.annotation.XmlAccessType")
-- local XmlAccessorType = require("javax.xml.bind.annotation.XmlAccessorType")
-- local XmlElement = require("javax.xml.bind.annotation.XmlElement")
-- local XmlRootElement = require("javax.xml.bind.annotation.XmlRootElement")
-- local XmlType = require("javax.xml.bind.annotation.XmlType")
local DynamicObjectData = java_lazy("org.allbinary.business.DynamicObjectData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local InputAutomationData = java_lazy("org.allbinary.input.automation.InputAutomationData")
local InputAutomationModuleData = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleData")
local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table InputAutomationModuleConfiguration is declared before the requires
InputAutomationModuleConfiguration.__index = InputAutomationModuleConfiguration
InputAutomationModuleConfiguration.className = "InputAutomationModuleConfiguration"
InputAutomationModuleConfiguration.javaClassName = "org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration"

function InputAutomationModuleConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.className == nil then self.className = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.inputAutomationModuleInterface == nil then self.inputAutomationModuleInterface = nil end
end

function InputAutomationModuleConfiguration._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return InputAutomationModuleConfiguration._new0(self, ...)
    elseif count == 2 then return InputAutomationModuleConfiguration._new2(self, ...)
    elseif count == 3 then return InputAutomationModuleConfiguration._new3(self, ...)
    elseif count == 1 then return InputAutomationModuleConfiguration._new1(self, ...)
    end
    error("No constructor of InputAutomationModuleConfiguration takes " .. count .. " arguments")
end

function InputAutomationModuleConfiguration.new(...)
    local self = setmetatable({}, InputAutomationModuleConfiguration)
    InputAutomationModuleConfiguration._jinit(self, ...)
    return self
end


function InputAutomationModuleConfiguration._new0(self)
    InputAutomationModuleConfiguration._init_fields(self)
    return self
end


function InputAutomationModuleConfiguration._new2(self, abeClientInformation, node)
    InputAutomationModuleConfiguration._init_fields(self)
        self:init(abeClientInformation, node)
    return self
end


function InputAutomationModuleConfiguration._new3(self, abeClientInformation, name, className)
    InputAutomationModuleConfiguration._init_fields(self)
        self:setName(name)
        self:setClassName(className)
        self:init(abeClientInformation)
    return self
end


function InputAutomationModuleConfiguration._new1(self, inputAutomationModuleInterface)
    InputAutomationModuleConfiguration._init_fields(self)
        self:setInputAutomationModuleInterface(inputAutomationModuleInterface)
        self:setClassName((getmetatable(self.inputAutomationModuleInterface).javaClassName or getmetatable(self.inputAutomationModuleInterface).className))
    return self
end


-- throws Exception
function InputAutomationModuleConfiguration:init_j2(abeClientInformation, node)
        local nodeList = node:getChildNodes()
        if not rawequal(nodeList, nil) then
            local classNameNode = DomSearchHelper.getNode(DynamicObjectData.NAME, nodeList)
            if not rawequal(classNameNode, nil) then
                self:setClassName(DomNodeHelper.getTextNodeValue(classNameNode))
                self:init(abeClientInformation)
            else
                self.logUtil:putF("Class Node Null", self, self.commonStrings.INIT)
            end
        else
            self.logUtil:putF(require("allbinary_java").to_string(InputAutomationData.NAME) .. require("allbinary_java").to_string(" Node Has No Children"), self, "Contructor")
        end
end


function InputAutomationModuleConfiguration:init_j1(abeClientInformation)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(require("allbinary_java").to_string("Name: ") .. require("allbinary_java").to_string(self:getName()), self, self.commonStrings.INIT)
            self.logUtil:putF(require("allbinary_java").to_string("ClassName: ") .. require("allbinary_java").to_string(self.className), self, self.commonStrings.INIT)
            self:setInputAutomationModuleInterface(AbeFactory.getInstance():getInstance():getInstance(abeClientInformation, self:getClassName()))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
            error(require("java.lang.RuntimeException").new(), 0)
        end
end
function InputAutomationModuleConfiguration:init(...)
    local count = select("#", ...)
    if count == 2 then return self:init_j2(...) end
    if count == 1 then return self:init_j1(...) end
    error("No method init takes " .. count .. " arguments")
end
InputAutomationModuleConfiguration.init__jdispatcher = InputAutomationModuleConfiguration.init


-- throws Exception
function InputAutomationModuleConfiguration:toDomNode(document)
        local node = document:createElement(InputAutomationModuleData.NAME)
        local classNameNode = ModDomHelper.createTextNode(document, DynamicObjectData.NAME, self:getClassName())
        node:appendChild(classNameNode)
        return node
end


function InputAutomationModuleConfiguration:getName()
        return self.name_f
end


function InputAutomationModuleConfiguration:setName(name)
        self.logUtil:putF(require("allbinary_java").to_string("Name: ") .. require("allbinary_java").to_string(name), self, "setName")
        self.name_f = name
end


function InputAutomationModuleConfiguration:getClassName()
        return self.className
end


function InputAutomationModuleConfiguration:setClassName(className)
        self.logUtil:putF(require("allbinary_java").to_string("ClassName : ") .. require("allbinary_java").to_string(className), self, "setClassName")
        self.className = className
end


function InputAutomationModuleConfiguration:getInputAutomationModuleInterface()
        return self.inputAutomationModuleInterface
end


function InputAutomationModuleConfiguration:setInputAutomationModuleInterface(inputAutomationModuleInterface)
        self.logUtil:putF(require("allbinary_java").to_string("InputAutomationModuleFactoryInterface : ") .. require("allbinary_java").to_string(inputAutomationModuleInterface), self, "setInputAutomationModuleInterface")
        self.inputAutomationModuleInterface = inputAutomationModuleInterface
        self:setName(self.inputAutomationModuleInterface:getName())
end

return InputAutomationModuleConfiguration


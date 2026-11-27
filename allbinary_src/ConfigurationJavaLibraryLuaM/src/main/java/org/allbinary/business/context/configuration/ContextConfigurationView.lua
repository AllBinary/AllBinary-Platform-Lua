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
-- package org.allbinary.business.context.configuration

local ContextConfigurationView = {}
package.loaded["org.allbinary.business.context.configuration.ContextConfigurationView"] = ContextConfigurationView

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

local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local EmailServerConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationData")
local EmailServerConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local EmailServerConfigurationView = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationView")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local ContextConfiguration = java_lazy("org.allbinary.business.context.configuration.ContextConfiguration")
local ContextConfigurationData = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationData")
local ContextConfigurationInterface = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationInterface")

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

-- class table ContextConfigurationView is declared before the requires
ContextConfigurationView.__index = ContextConfigurationView
ContextConfigurationView.className = "ContextConfigurationView"
ContextConfigurationView.javaClassName = "org.allbinary.business.context.configuration.ContextConfigurationView"
ContextConfigurationView.java_implements = " DomNodeInterface "
ContextConfigurationView.java_interfaces = function() return {DomNodeInterface} end

function ContextConfigurationView:_init_fields()
    if self.contextConfigurationInterface == nil then self.contextConfigurationInterface = nil end
end

function ContextConfigurationView._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return ContextConfigurationView._new1(self, ...)
    end
    error("No constructor of ContextConfigurationView takes " .. count .. " arguments")
end

function ContextConfigurationView.new(...)
    local self = setmetatable({}, ContextConfigurationView)
    ContextConfigurationView._jinit(self, ...)
    return self
end

function ContextConfigurationView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return ContextConfigurationView._new1_1(self, ...) end
    return ContextConfigurationView._new1_2(self, ...)
end


function ContextConfigurationView._new1_1(self, node)
    ContextConfigurationView._init_fields(self)
        local childNodeList = node:getChildNodes()
        self.contextConfigurationInterface = ContextConfiguration.new()
        local emailConfigurationNode = DomSearchHelper.getNode(EmailServerConfigurationData.NAME, childNodeList)
        local emailServerConfigurationView = EmailServerConfigurationView.new(emailConfigurationNode)
        self.contextConfigurationInterface:setEmailServerConfigurationInterface(emailServerConfigurationView:getEmailConfigurationInterface())
    return self
end


function ContextConfigurationView._new1_2(self, contextConfigurationInterface)
    ContextConfigurationView._init_fields(self)
        self.contextConfigurationInterface = contextConfigurationInterface
    return self
end


function ContextConfigurationView:getContextConfigurationInterface()
        return self.contextConfigurationInterface
end


-- throws Exception
function ContextConfigurationView:toXmlNode(document)
        local node = document:createElement(ContextConfigurationData.getInstance().NAME)
        local emailServerConfigurationView = EmailServerConfigurationView.new(self:getContextConfigurationInterface():getEmailServerConfigurationInterface())
        node:appendChild(emailServerConfigurationView:toXmlNode(document))
        return node
end

return ContextConfigurationView


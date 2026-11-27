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
-- package org.allbinary.logic.communication.smtp.configuration.user

local UserEmailConfigurationView = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationView"] = UserEmailConfigurationView

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

local HashMap = java_lazy("java.util.HashMap")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventsConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationData")
local UserEmailEventsConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local UserEmailEventsConfigurationView = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationView")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local UserEmailConfiguration = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfiguration")
local UserEmailConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationData")
local UserEmailConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")
local UserEmailConfigurationMapping = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationMapping")

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

-- class table UserEmailConfigurationView is declared before the requires
UserEmailConfigurationView.__index = UserEmailConfigurationView
UserEmailConfigurationView.className = "UserEmailConfigurationView"
UserEmailConfigurationView.javaClassName = "org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationView"
UserEmailConfigurationView.java_implements = " DomNodeInterface "
UserEmailConfigurationView.java_interfaces = function() return {DomNodeInterface} end

function UserEmailConfigurationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.userEmailConfigurationInterface == nil then self.userEmailConfigurationInterface = nil end
end

function UserEmailConfigurationView._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return UserEmailConfigurationView._new1(self, ...)
    end
    error("No constructor of UserEmailConfigurationView takes " .. count .. " arguments")
end

function UserEmailConfigurationView.new(...)
    local self = setmetatable({}, UserEmailConfigurationView)
    UserEmailConfigurationView._jinit(self, ...)
    return self
end

function UserEmailConfigurationView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return UserEmailConfigurationView._new1_1(self, ...) end
    return UserEmailConfigurationView._new1_2(self, ...)
end


function UserEmailConfigurationView._new1_1(self, node)
    UserEmailConfigurationView._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        end
        self.userEmailConfigurationInterface = UserEmailConfiguration.new()
        local childNodeList = node:getChildNodes()
        local userEmailEventsConfigurationNode = DomSearchHelper.getNodeNoThrow(UserEmailEventsConfigurationData.NAME, childNodeList)
        local userEmailEventsConfigurationView = UserEmailEventsConfigurationView.new(userEmailEventsConfigurationNode)
        self.userEmailConfigurationInterface:setUserEmailEventsConfigurationInterface(userEmailEventsConfigurationView:getUserEmailEventsConfigurationInterface())
    return self
end


function UserEmailConfigurationView._new1_2(self, userEmailConfigurationInterface)
    UserEmailConfigurationView._init_fields(self)
        self.userEmailConfigurationInterface = userEmailConfigurationInterface
    return self
end


function UserEmailConfigurationView:getEmailConfigurationInterface()
        return self.userEmailConfigurationInterface
end


-- throws Exception
function UserEmailConfigurationView:toXmlNode(document)
        local emailConfigurationMapping = UserEmailConfigurationMapping.new(self.userEmailConfigurationInterface)
        local hashMap = emailConfigurationMapping:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, UserEmailConfigurationData.NAME, hashMap)
        local userEmailConfigurationInterface = self:getEmailConfigurationInterface()
        local userEmailEventsConfigurationInterface = userEmailConfigurationInterface:getUserEmailEventsConfigurationInterface()
        local userEmailEventsConfigurationView = UserEmailEventsConfigurationView.new(userEmailEventsConfigurationInterface)
        node:appendChild(userEmailEventsConfigurationView:toXmlNode(document))
        return node
end

return UserEmailConfigurationView


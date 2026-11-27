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
-- package org.allbinary.logic.communication.smtp.configuration.user.event

local UserEmailEventsConfigurationView = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationView"] = UserEmailEventsConfigurationView

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
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local UserEmailEventConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationData")
local UserEmailEventConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationInterface")
local UserEmailEventConfigurationView = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationView")
local UserEmailEventsConfiguration = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfiguration")
local UserEmailEventsConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationData")
local UserEmailEventsConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local UserEmailEventsConfigurationMapping = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationMapping")

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

-- class table UserEmailEventsConfigurationView is declared before the requires
UserEmailEventsConfigurationView.__index = UserEmailEventsConfigurationView
UserEmailEventsConfigurationView.className = "UserEmailEventsConfigurationView"
UserEmailEventsConfigurationView.javaClassName = "org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationView"
UserEmailEventsConfigurationView.java_implements = " DomNodeInterface "
UserEmailEventsConfigurationView.java_interfaces = function() return {DomNodeInterface} end

function UserEmailEventsConfigurationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.userEmailEventsConfigurationInterface == nil then self.userEmailEventsConfigurationInterface = nil end
end

function UserEmailEventsConfigurationView._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return UserEmailEventsConfigurationView._new1(self, ...)
    end
    error("No constructor of UserEmailEventsConfigurationView takes " .. count .. " arguments")
end

function UserEmailEventsConfigurationView.new(...)
    local self = setmetatable({}, UserEmailEventsConfigurationView)
    UserEmailEventsConfigurationView._jinit(self, ...)
    return self
end

function UserEmailEventsConfigurationView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return UserEmailEventsConfigurationView._new1_1(self, ...) end
    return UserEmailEventsConfigurationView._new1_2(self, ...)
end


function UserEmailEventsConfigurationView._new1_1(self, node)
    UserEmailEventsConfigurationView._init_fields(self)
        self.userEmailEventsConfigurationInterface = UserEmailEventsConfiguration.new()
        local childNodeList = node:getChildNodes()
        local emailEventConfigurationNodeVector = DomSearchHelper.getAllNodesNoThrow(UserEmailEventConfigurationData.NAME, childNodeList)
        local size = emailEventConfigurationNodeVector:size()
        for index = 0, size - 1 do
            local userEmailConfigurationNode = emailEventConfigurationNodeVector:get(index)
            local userEmailEventConfigurationView = UserEmailEventConfigurationView.new(userEmailConfigurationNode)
            self.userEmailEventsConfigurationInterface:addUserEmailEventConfiguration(userEmailEventConfigurationView:getUserEmailEventConfigurationInterface())
        end
    return self
end


function UserEmailEventsConfigurationView._new1_2(self, userEmailEventsConfigurationInterface)
    UserEmailEventsConfigurationView._init_fields(self)
        self.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface
    return self
end


function UserEmailEventsConfigurationView:getUserEmailEventsConfigurationInterface()
        return self.userEmailEventsConfigurationInterface
end


-- throws Exception
function UserEmailEventsConfigurationView:toXmlNode(document)
        local userEmailConfigurationMapping = UserEmailEventsConfigurationMapping.new(self.userEmailEventsConfigurationInterface)
        local node = document:createElement(UserEmailEventsConfigurationData.NAME)
        local emailEventHashMap = self:getUserEmailEventsConfigurationInterface():getEventConfigurationHashMap()
        local set = emailEventHashMap:keySet()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF("Number Of Email Events Specified in file: " .. tostring(set:size()), self, self.commonStrings.CONSTRUCTOR)
        end
        local eventNameArray = set:toArray()
        local size = (eventNameArray.n or #eventNameArray)
        for index = 0, size - 1 do
            local eventName = eventNameArray[index + 1]
            local userEmailEventsConfigurationInterface = emailEventHashMap:get(eventName)
            local userEmailEventConfigurationView = UserEmailEventConfigurationView.new(userEmailEventsConfigurationInterface)
            node:appendChild(userEmailEventConfigurationView:toXmlNode(document))
        end
        return node
end

return UserEmailEventsConfigurationView


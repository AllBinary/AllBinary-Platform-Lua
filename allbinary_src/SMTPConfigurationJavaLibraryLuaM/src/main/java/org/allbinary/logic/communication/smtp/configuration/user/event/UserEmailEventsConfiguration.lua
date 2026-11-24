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

local UserEmailEventsConfiguration = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfiguration"] = UserEmailEventsConfiguration

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
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventListenerInterface = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local UserEmailEventsConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local UserEmailEventConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationInterface")
local UserEmailEventListenerFactory = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventListenerFactory")

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

-- class table UserEmailEventsConfiguration is declared before the requires
UserEmailEventsConfiguration.__index = UserEmailEventsConfiguration
UserEmailEventsConfiguration.className = "UserEmailEventsConfiguration"
UserEmailEventsConfiguration.javaClassName = "org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfiguration"
UserEmailEventsConfiguration.java_implements = " UserEmailEventsConfigurationInterface "
UserEmailEventsConfiguration.java_interfaces = function() return {UserEmailEventsConfigurationInterface} end

function UserEmailEventsConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.emailEventHashMap == nil then self.emailEventHashMap = nil end
end

function UserEmailEventsConfiguration._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return UserEmailEventsConfiguration._new0(self, ...)
    elseif count == 1 then return UserEmailEventsConfiguration._new1(self, ...)
    end
    error("No constructor of UserEmailEventsConfiguration takes " .. count .. " arguments")
end

function UserEmailEventsConfiguration.new(...)
    local self = setmetatable({}, UserEmailEventsConfiguration)
    UserEmailEventsConfiguration._jinit(self, ...)
    return self
end


function UserEmailEventsConfiguration._new0(self)
    UserEmailEventsConfiguration._init_fields(self)
        self:init()
    return self
end


function UserEmailEventsConfiguration._new1(self, hashMap)
    UserEmailEventsConfiguration._init_fields(self)
        self:init()
    return self
end


function UserEmailEventsConfiguration:init()
        self.emailEventHashMap = StdUtil.getInstance():createHashMap()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, " Constructor")
        end
end


function UserEmailEventsConfiguration:getEventConfigurationHashMap()
        return self.emailEventHashMap
end


function UserEmailEventsConfiguration:addUserEmailEventConfiguration(userEmailEventConfigurationInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF("Adding: " .. tostring(userEmailEventConfigurationInterface:log()), self, "addUserEmailEventConfiguration")
        end
        self.emailEventHashMap:put(userEmailEventConfigurationInterface:getName(), userEmailEventConfigurationInterface)
end


-- throws Exception
function UserEmailEventsConfiguration:getEventListener(abeClientInformation, userEmailEventNameData, userInterface)
        local userEmailEventConfigurationInterface = self.emailEventHashMap:get(tostring(userEmailEventNameData))
        return UserEmailEventListenerFactory.getInstance(abeClientInformation, userEmailEventConfigurationInterface, userInterface)
end

return UserEmailEventsConfiguration


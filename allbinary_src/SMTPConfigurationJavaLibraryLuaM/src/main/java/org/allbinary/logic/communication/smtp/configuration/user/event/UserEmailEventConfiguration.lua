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

local UserEmailEventConfiguration = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfiguration"] = UserEmailEventConfiguration

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
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local UserEmailEventConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationInterface")
local UserEmailEventConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationData")

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

-- class table UserEmailEventConfiguration is declared before the requires
UserEmailEventConfiguration.__index = UserEmailEventConfiguration
UserEmailEventConfiguration.className = "UserEmailEventConfiguration"
UserEmailEventConfiguration.javaClassName = "org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfiguration"
UserEmailEventConfiguration.java_implements = " UserEmailEventConfigurationInterface "
UserEmailEventConfiguration.java_interfaces = function() return {UserEmailEventConfigurationInterface} end

function UserEmailEventConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.eventListenerClassPath == nil then self.eventListenerClassPath = nil end
end

function UserEmailEventConfiguration._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return UserEmailEventConfiguration._new0(self, ...)
    elseif count == 1 then return UserEmailEventConfiguration._new1(self, ...)
    end
    error("No constructor of UserEmailEventConfiguration takes " .. count .. " arguments")
end

function UserEmailEventConfiguration.new(...)
    local self = setmetatable({}, UserEmailEventConfiguration)
    UserEmailEventConfiguration._jinit(self, ...)
    return self
end


function UserEmailEventConfiguration._new0(self)
    UserEmailEventConfiguration._init_fields(self)
        self:setName(StringUtil.getInstance().EMPTY_STRING)
        self:setEventListenerClassPath(StringUtil.getInstance().EMPTY_STRING)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF("New", self, " Constructor")
        end
    return self
end


function UserEmailEventConfiguration._new1(self, hashMap)
    UserEmailEventConfiguration._init_fields(self)
        self:setName(hashMap:get(UserEmailEventConfigurationData.NAME))
        self:setEventListenerClassPath(hashMap:get(UserEmailEventConfigurationData.LISTENER_CLASSPATH))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("Log: ") .. require("allbinary_java").to_string(self:log()), self, " Constructor")
        end
    return self
end


function UserEmailEventConfiguration:getName()
        return self.name_f
end


function UserEmailEventConfiguration:setName(name)
        self.name_f = name
end


function UserEmailEventConfiguration:getEventListenerClassPath()
        return self.eventListenerClassPath
end


function UserEmailEventConfiguration:setEventListenerClassPath(eventListenerClassPath)
        self.eventListenerClassPath = eventListenerClassPath
end


function UserEmailEventConfiguration:log()
        return require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("\nUser Email Event Log Info:") .. require("allbinary_java").to_string("\nName: ")) .. require("allbinary_java").to_string(self:getName())) .. require("allbinary_java").to_string("\nEventListenerClassPath: ")) .. require("allbinary_java").to_string(self:getEventListenerClassPath())
end

return UserEmailEventConfiguration


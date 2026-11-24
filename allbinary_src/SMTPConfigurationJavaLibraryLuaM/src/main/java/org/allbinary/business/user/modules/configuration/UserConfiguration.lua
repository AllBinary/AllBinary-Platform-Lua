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
-- package org.allbinary.business.user.modules.configuration

local UserConfiguration = {}
package.loaded["org.allbinary.business.user.modules.configuration.UserConfiguration"] = UserConfiguration

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
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local TimeCreated = java_lazy("org.allbinary.business.time.created.TimeCreated")
local TimeLastModified = java_lazy("org.allbinary.business.time.modified.TimeLastModified")
local UserEmailConfiguration = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfiguration")
local UserEmailConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")
local UserConfigurationInterface = require("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")

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

-- class table UserConfiguration is declared before the requires
UserConfiguration.__index = UserConfiguration
UserConfiguration.className = "UserConfiguration"
UserConfiguration.javaClassName = "org.allbinary.business.user.modules.configuration.UserConfiguration"
UserConfiguration.java_implements = " UserConfigurationInterface "
UserConfiguration.java_interfaces = function() return {UserConfigurationInterface} end

function UserConfiguration:_init_fields()
    if self.userEmailConfigurationInterface == nil then self.userEmailConfigurationInterface = nil end
    if self.timeCreated == nil then self.timeCreated = nil end
    if self.timeLastModified == nil then self.timeLastModified = nil end
end

function UserConfiguration._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return UserConfiguration._new0(self, ...)
    elseif count == 1 then return UserConfiguration._new1(self, ...)
    end
    error("No constructor of UserConfiguration takes " .. count .. " arguments")
end

function UserConfiguration.new(...)
    local self = setmetatable({}, UserConfiguration)
    UserConfiguration._jinit(self, ...)
    return self
end


function UserConfiguration._new0(self)
    UserConfiguration._init_fields(self)
        self.userEmailConfigurationInterface = UserEmailConfiguration.new()
        self.timeCreated = TimeCreated.new(0)
        self.timeLastModified = TimeLastModified.new(0)
    return self
end


function UserConfiguration._new1(self, hashMap)
    UserConfiguration._init_fields(self)
        self.userEmailConfigurationInterface = UserEmailConfiguration.new(hashMap)
        self.timeCreated = TimeCreated.new(hashMap:get(EntryData.getInstance().TIMECREATED))
        self.timeLastModified = TimeLastModified.new(hashMap:get(EntryData.getInstance().LASTMODIFIED))
    return self
end


function UserConfiguration:getUserEmailConfigurationInterface()
        return self.userEmailConfigurationInterface
end


function UserConfiguration:setUserEmailConfigurationInterface(userEmailConfigurationInterface)
        self.userEmailConfigurationInterface = userEmailConfigurationInterface
end


function UserConfiguration:getTimeCreated()
        return self.timeCreated
end


function UserConfiguration:getTimeLastModified()
        return self.timeLastModified
end


function UserConfiguration:setTimeCreated(timeCreated)
        self.timeCreated = timeCreated
end


function UserConfiguration:setTimeLastModified(timeLastModified)
        self.timeLastModified = timeLastModified
end

return UserConfiguration


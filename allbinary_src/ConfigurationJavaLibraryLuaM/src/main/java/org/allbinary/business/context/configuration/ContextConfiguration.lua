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

local ContextConfiguration = {}
package.loaded["org.allbinary.business.context.configuration.ContextConfiguration"] = ContextConfiguration

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
local EmailServerConfiguration = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfiguration")
local EmailServerConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ContextConfigurationInterface = require("org.allbinary.business.context.configuration.ContextConfigurationInterface")

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

-- class table ContextConfiguration is declared before the requires
ContextConfiguration.__index = ContextConfiguration
ContextConfiguration.className = "ContextConfiguration"
ContextConfiguration.javaClassName = "org.allbinary.business.context.configuration.ContextConfiguration"
ContextConfiguration.java_implements = " ContextConfigurationInterface "
ContextConfiguration.java_interfaces = function() return {ContextConfigurationInterface} end

function ContextConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.emailServerConfigurationInterface == nil then self.emailServerConfigurationInterface = nil end
end

function ContextConfiguration._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return ContextConfiguration._new0(self, ...)
    elseif count == 1 then return ContextConfiguration._new1(self, ...)
    end
    error("No constructor of ContextConfiguration takes " .. count .. " arguments")
end

function ContextConfiguration.new(...)
    local self = setmetatable({}, ContextConfiguration)
    ContextConfiguration._jinit(self, ...)
    return self
end


function ContextConfiguration._new0(self)
    ContextConfiguration._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, "ContextConfiguration")
        self:setEmailServerConfigurationInterface(EmailServerConfiguration.new())
    return self
end


function ContextConfiguration._new1(self, hashMap)
    ContextConfiguration._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, "ContextConfiguration(HashMap)")
        self:setEmailServerConfigurationInterface(EmailServerConfiguration.new(hashMap))
    return self
end


function ContextConfiguration:getEmailServerConfigurationInterface()
        return self.emailServerConfigurationInterface
end


function ContextConfiguration:setEmailServerConfigurationInterface(emailServerConfigurationInterface)
        self.emailServerConfigurationInterface = emailServerConfigurationInterface
end

return ContextConfiguration


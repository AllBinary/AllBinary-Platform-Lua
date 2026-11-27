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
-- package org.allbinary.logic.communication.smtp.configuration.server

local EmailServerConfiguration = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfiguration"] = EmailServerConfiguration

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
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local EmailServerConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local EmailServerConfigurationData = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationData")

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

-- class table EmailServerConfiguration is declared before the requires
EmailServerConfiguration.__index = EmailServerConfiguration
EmailServerConfiguration.className = "EmailServerConfiguration"
EmailServerConfiguration.javaClassName = "org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfiguration"
EmailServerConfiguration.java_implements = " EmailServerConfigurationInterface "
EmailServerConfiguration.java_interfaces = function() return {EmailServerConfigurationInterface} end

function EmailServerConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.accountName == nil then self.accountName = nil end
    if self.password == nil then self.password = nil end
    if self.smtpServer == nil then self.smtpServer = nil end
end

function EmailServerConfiguration._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return EmailServerConfiguration._new0(self, ...)
    elseif count == 1 then return EmailServerConfiguration._new1(self, ...)
    elseif count == 3 then return EmailServerConfiguration._new3(self, ...)
    end
    error("No constructor of EmailServerConfiguration takes " .. count .. " arguments")
end

function EmailServerConfiguration.new(...)
    local self = setmetatable({}, EmailServerConfiguration)
    EmailServerConfiguration._jinit(self, ...)
    return self
end


function EmailServerConfiguration._new0(self)
    EmailServerConfiguration._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self:setSmtpServer(StringUtil.getInstance().EMPTY_STRING)
    return self
end


function EmailServerConfiguration._new1(self, hashMap)
    EmailServerConfiguration._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, "EmailServerConfiguration(HashMap)")
        end
        self:setAccountName(hashMap:get(EmailServerConfigurationData.ACCOUNT))
        self:setPassword(hashMap:get(EmailServerConfigurationData.PASSWORD))
        self:setSmtpServer(hashMap:get(EmailServerConfigurationData.SERVER))
        self:log()
    return self
end


function EmailServerConfiguration._new3(self, account, password, server)
    EmailServerConfiguration._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, "EmailServerConfiguration(HashMap)")
        end
        self:setAccountName(account)
        self:setPassword(password)
        self:setSmtpServer(server)
        self:log()
    return self
end


function EmailServerConfiguration:setSmtpServer(value)
        self.smtpServer = value
end


function EmailServerConfiguration:getSmtpServer()
        return self.smtpServer
end


function EmailServerConfiguration:getAccountName()
        return self.accountName
end


function EmailServerConfiguration:setAccountName(accountName)
        self.accountName = accountName
end


function EmailServerConfiguration:getPassword()
        return self.password
end


function EmailServerConfiguration:setPassword(password)
        self.password = password
end


function EmailServerConfiguration:log()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(tostring(self), self, "EmailServerConfiguration")
        end
end


function EmailServerConfiguration:toString()
        return "Email Server Configuration:\n" .. "Smtp Server: \n" .. tostring(self:getSmtpServer()) .. "\nAccount Name: " .. tostring(self:getAccountName()) .. "\nPassword: " .. tostring(self:getPassword())
end
EmailServerConfiguration.__tostring = function(self) return self:toString() end

return EmailServerConfiguration


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

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local EmailServerConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EmailServerConfiguration = {}
EmailServerConfiguration.__index = EmailServerConfiguration
EmailServerConfiguration.className = "EmailServerConfiguration"

function EmailServerConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.accountName = nil
    self.password = nil
    self.smtpServer = nil
end

function EmailServerConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return EmailServerConfiguration._new0(...)
    elseif count == 1 then return EmailServerConfiguration._new1(...)
    elseif count == 3 then return EmailServerConfiguration._new3(...)
    end
end


function EmailServerConfiguration._new0()
    local self = setmetatable({}, EmailServerConfiguration)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self:setSmtpServer(StringUtil.getInstance().EMPTY_STRING)
    return self
end


function EmailServerConfiguration._new1(hashMap)
    local self = setmetatable({}, EmailServerConfiguration)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, "EmailServerConfiguration(HashMap)")
        end
        self:setAccountName(hashMap:get(EmailServerConfigurationData.ACCOUNT))
        self:setPassword(hashMap:get(EmailServerConfigurationData.PASSWORD))
        self:setSmtpServer(hashMap:get(EmailServerConfigurationData.SERVER))
        self:log()
    return self
end


function EmailServerConfiguration._new3(account, password, server)
    local self = setmetatable({}, EmailServerConfiguration)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
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
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(tostring(self), self, "EmailServerConfiguration")
        end
end


function EmailServerConfiguration:toString()
        return "Email Server Configuration:\n" .. "Smtp Server: \n" .. tostring(self:getSmtpServer()) .. "\nAccount Name: " .. tostring(self:getAccountName()) .. "\nPassword: " .. tostring(self:getPassword())
end
EmailServerConfiguration.__tostring = function(self) return self:toString() end

return EmailServerConfiguration


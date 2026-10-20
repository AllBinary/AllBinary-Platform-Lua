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

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local EmailServerConfiguration = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfiguration")
local EmailServerConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ContextConfigurationInterface = require("org.allbinary.business.context.configuration.ContextConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ContextConfiguration = {}
ContextConfiguration.__index = ContextConfiguration
ContextConfiguration.className = "ContextConfiguration"

function ContextConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.emailServerConfigurationInterface = nil
end

function ContextConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return ContextConfiguration._new0(...)
    elseif count == 1 then return ContextConfiguration._new1(...)
    end
end


function ContextConfiguration._new0()
    local self = setmetatable({}, ContextConfiguration)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, "ContextConfiguration")
        self:setEmailServerConfigurationInterface(EmailServerConfiguration.new())
    return self
end


function ContextConfiguration._new1(hashMap)
    local self = setmetatable({}, ContextConfiguration)
    self:_init_fields()
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


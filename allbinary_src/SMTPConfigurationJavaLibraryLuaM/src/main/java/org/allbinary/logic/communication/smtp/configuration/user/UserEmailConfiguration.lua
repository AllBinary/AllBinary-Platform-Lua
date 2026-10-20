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

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventsConfiguration = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfiguration")
local UserEmailEventsConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local UserEmailConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailConfiguration = {}
UserEmailConfiguration.__index = UserEmailConfiguration
UserEmailConfiguration.className = "UserEmailConfiguration"

function UserEmailConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.userEmailEventsConfigurationInterface = nil
end

function UserEmailConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return UserEmailConfiguration._new0(...)
    elseif count == 1 then return UserEmailConfiguration._new1(...)
    end
end


function UserEmailConfiguration._new0()
    local self = setmetatable({}, UserEmailConfiguration)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        end
        self:setUserEmailEventsConfigurationInterface(UserEmailEventsConfiguration.new())
    return self
end


function UserEmailConfiguration._new1(hashMap)
    local self = setmetatable({}, UserEmailConfiguration)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        end
        self:setUserEmailEventsConfigurationInterface(UserEmailEventsConfiguration.new(hashMap))
    return self
end


function UserEmailConfiguration:getUserEmailEventsConfigurationInterface()
        return self.userEmailEventsConfigurationInterface
end


function UserEmailConfiguration:setUserEmailEventsConfigurationInterface(userEmailEventsConfigurationInterface)
        self.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface
end

return UserEmailConfiguration


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

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local UserEmailEventConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventConfiguration = {}
UserEmailEventConfiguration.__index = UserEmailEventConfiguration
UserEmailEventConfiguration.className = "UserEmailEventConfiguration"

function UserEmailEventConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.name = nil
    self.eventListenerClassPath = nil
end

function UserEmailEventConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return UserEmailEventConfiguration._new0(...)
    elseif count == 1 then return UserEmailEventConfiguration._new1(...)
    end
end


function UserEmailEventConfiguration._new0()
    local self = setmetatable({}, UserEmailEventConfiguration)
    self:_init_fields()
        self:setName(StringUtil.getInstance().EMPTY_STRING)
        self:setEventListenerClassPath(StringUtil.getInstance().EMPTY_STRING)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF("New", self, " Constructor")
        end
    return self
end


function UserEmailEventConfiguration._new1(hashMap)
    local self = setmetatable({}, UserEmailEventConfiguration)
    self:_init_fields()
        self:setName(hashMap:get(UserEmailEventConfigurationData.NAME))
        self:setEventListenerClassPath(hashMap:get(UserEmailEventConfigurationData.LISTENER_CLASSPATH))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF("Log: " .. tostring(self:log()), self, " Constructor")
        end
    return self
end


function UserEmailEventConfiguration:getName()
        return self.name
end


function UserEmailEventConfiguration:setName(name)
        self.name = name
end


function UserEmailEventConfiguration:getEventListenerClassPath()
        return self.eventListenerClassPath
end


function UserEmailEventConfiguration:setEventListenerClassPath(eventListenerClassPath)
        self.eventListenerClassPath = eventListenerClassPath
end


function UserEmailEventConfiguration:log()
        return "\nUser Email Event Log Info:" .. "\nName: " .. self:getName() .. "\nEventListenerClassPath: " .. tostring(self:getEventListenerClassPath())
end

return UserEmailEventConfiguration


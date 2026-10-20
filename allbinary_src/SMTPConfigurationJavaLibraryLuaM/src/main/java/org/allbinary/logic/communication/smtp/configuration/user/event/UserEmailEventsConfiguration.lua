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
local UserInterface = require("org.allbinary.business.user.UserInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local UserEmailEventsConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventsConfiguration = {}
UserEmailEventsConfiguration.__index = UserEmailEventsConfiguration
UserEmailEventsConfiguration.className = "UserEmailEventsConfiguration"

function UserEmailEventsConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.emailEventHashMap = nil
end

function UserEmailEventsConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return UserEmailEventsConfiguration._new0(...)
    elseif count == 1 then return UserEmailEventsConfiguration._new1(...)
    end
end


function UserEmailEventsConfiguration._new0()
    local self = setmetatable({}, UserEmailEventsConfiguration)
    self:_init_fields()
        self:init()
    return self
end


function UserEmailEventsConfiguration._new1(hashMap)
    local self = setmetatable({}, UserEmailEventsConfiguration)
    self:_init_fields()
        self:init()
    return self
end


function UserEmailEventsConfiguration:init()
        self.emailEventHashMap = StdUtil.getInstance():createHashMap()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, " Constructor")
        end
end


function UserEmailEventsConfiguration:getEventConfigurationHashMap()
        return self.emailEventHashMap
end


function UserEmailEventsConfiguration:addUserEmailEventConfiguration(userEmailEventConfigurationInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
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


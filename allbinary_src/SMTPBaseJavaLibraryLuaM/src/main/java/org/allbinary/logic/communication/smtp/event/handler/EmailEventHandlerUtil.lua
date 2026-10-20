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
-- package org.allbinary.logic.communication.smtp.event.handler

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserConfigurationInterface = require("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")
local UserEmailEventsConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local LogUserEmailEventListenerModule = require("org.allbinary.logic.communication.smtp.event.modules.log.LogUserEmailEventListenerModule")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EmailEventHandlerUtil = {}
EmailEventHandlerUtil.__index = EmailEventHandlerUtil
EmailEventHandlerUtil.className = "EmailEventHandlerUtil"

function EmailEventHandlerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function EmailEventHandlerUtil.getInstance()
        return EmailEventHandlerUtil.instance
end


function EmailEventHandlerUtil.new()
    local self = setmetatable({}, EmailEventHandlerUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function EmailEventHandlerUtil:getEventHandler(abeClientInformation, userEmailEventNameData, userVector)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Returning UserEmailEventHandler for ")
            stringBuffer:appendint(userVector:size())
            stringBuffer:append(" users.")
            self.logUtil:putF(tostring(stringBuffer), self, "getEventHandler")
        end
        local userEmailEventHandler = UserEmailEventHandler.new()
        userEmailEventHandler:addListener(LogUserEmailEventListenerModule.new())
        local size = userVector:size()
        for index = 0, size - 1 do
            local userInterface = userVector:get(index)
            local vector = EmailEventHandlerUtil.getUserEmailEventListenerVector(abeClientInformation, userEmailEventNameData, userInterface)
            userEmailEventHandler:addListener(vector)
        end
        return userEmailEventHandler
end


-- throws Exception
function EmailEventHandlerUtil.getUserEmailEventListenerVector(abeClientInformation, userEmailEventNameData, userInterface)
        local userConfigurationInterface = userInterface:getUserConfigurationInterface()
        local userEmailConfigurationInterface = userConfigurationInterface:getUserEmailConfigurationInterface()
        local userEmailEventsConfigurationInterface = userEmailConfigurationInterface:getUserEmailEventsConfigurationInterface()
        local userEmailEventListenerInterface = userEmailEventsConfigurationInterface:getEventListener(abeClientInformation, userEmailEventNameData, userInterface)
        local vector = BasicArrayListD.new()
        vector:add(userEmailEventListenerInterface)
        return vector
end

EmailEventHandlerUtil.instance = EmailEventHandlerUtil.new()

return EmailEventHandlerUtil


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
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
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

-- Java interface
local UserEmailEventsConfigurationInterface = {}
UserEmailEventsConfigurationInterface.__index = UserEmailEventsConfigurationInterface
UserEmailEventsConfigurationInterface.className = "UserEmailEventsConfigurationInterface"


function UserEmailEventsConfigurationInterface:getEventConfigurationHashMap()
    error("abstract method getEventConfigurationHashMap")
end


function UserEmailEventsConfigurationInterface:addUserEmailEventConfiguration(userEmailEventConfigurationInterface)
    error("abstract method addUserEmailEventConfiguration")
end


-- throws Exception
function UserEmailEventsConfigurationInterface:getEventListener(abeClientInformation, userEmailEventNameData, userInterface)
    error("abstract method getEventListener")
end

return UserEmailEventsConfigurationInterface


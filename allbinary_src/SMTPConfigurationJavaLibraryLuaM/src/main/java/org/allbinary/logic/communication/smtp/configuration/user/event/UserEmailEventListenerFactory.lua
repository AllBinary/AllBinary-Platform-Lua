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

local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventListenerFactory = {}
UserEmailEventListenerFactory.__index = UserEmailEventListenerFactory
UserEmailEventListenerFactory.className = "UserEmailEventListenerFactory"


function UserEmailEventListenerFactory.new()
    local self = setmetatable({}, UserEmailEventListenerFactory)
    return self
end


-- throws Exception
function UserEmailEventListenerFactory.getInstance(abeClientInformation, userEmailEventConfigurationInterface, userInterface)
        local params = java_new_array(nil, 1)
        local classes = java_new_array(nil, 1)
        classes[1] = UserInterface
        params[1] = userInterface
        return AbeFactory.getInstance():getInstance(abeClientInformation, userEmailEventConfigurationInterface:getEventListenerClassPath(), classes, params)
end

return UserEmailEventListenerFactory


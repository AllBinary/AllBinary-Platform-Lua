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
-- package org.allbinary.business.user.modules.configuration

local TimeCreated = require("org.allbinary.business.time.created.TimeCreated")
local TimeLastModified = require("org.allbinary.business.time.modified.TimeLastModified")
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

-- Java interface
local UserConfigurationInterface = {}
UserConfigurationInterface.__index = UserConfigurationInterface
UserConfigurationInterface.className = "UserConfigurationInterface"


function UserConfigurationInterface:getUserEmailConfigurationInterface()
    error("abstract method getUserEmailConfigurationInterface")
end


function UserConfigurationInterface:setUserEmailConfigurationInterface(userEmailConfigurationInterface)
    error("abstract method setUserEmailConfigurationInterface")
end


function UserConfigurationInterface:getTimeCreated()
    error("abstract method getTimeCreated")
end


function UserConfigurationInterface:getTimeLastModified()
    error("abstract method getTimeLastModified")
end


function UserConfigurationInterface:setTimeCreated(timeCreated)
    error("abstract method setTimeCreated")
end


function UserConfigurationInterface:setTimeLastModified(timeLastModified)
    error("abstract method setTimeLastModified")
end

return UserConfigurationInterface


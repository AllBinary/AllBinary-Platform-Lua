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

-- local HashMap = require("java.util.HashMap")
local EntryData = require("org.allbinary.business.entry.EntryData")
local TimeCreated = require("org.allbinary.business.time.created.TimeCreated")
local TimeLastModified = require("org.allbinary.business.time.modified.TimeLastModified")
local UserEmailConfiguration = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfiguration")
local UserEmailConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")
local UserConfigurationInterface = require("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserConfiguration = {}
UserConfiguration.__index = UserConfiguration
UserConfiguration.className = "UserConfiguration"

function UserConfiguration:_init_fields()
    self.userEmailConfigurationInterface = nil
    self.timeCreated = nil
    self.timeLastModified = nil
end

function UserConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return UserConfiguration._new0(...)
    elseif count == 1 then return UserConfiguration._new1(...)
    end
end


function UserConfiguration._new0()
    local self = setmetatable({}, UserConfiguration)
    self:_init_fields()
        self.userEmailConfigurationInterface = UserEmailConfiguration.new()
        self.timeCreated = TimeCreated.new(0)
        self.timeLastModified = TimeLastModified.new(0)
    return self
end


function UserConfiguration._new1(hashMap)
    local self = setmetatable({}, UserConfiguration)
    self:_init_fields()
        self.userEmailConfigurationInterface = UserEmailConfiguration.new(hashMap)
        self.timeCreated = TimeCreated.new(hashMap:get(EntryData.getInstance().TIMECREATED))
        self.timeLastModified = TimeLastModified.new(hashMap:get(EntryData.getInstance().LASTMODIFIED))
    return self
end


function UserConfiguration:getUserEmailConfigurationInterface()
        return self.userEmailConfigurationInterface
end


function UserConfiguration:setUserEmailConfigurationInterface(userEmailConfigurationInterface)
        self.userEmailConfigurationInterface = userEmailConfigurationInterface
end


function UserConfiguration:getTimeCreated()
        return self.timeCreated
end


function UserConfiguration:getTimeLastModified()
        return self.timeLastModified
end


function UserConfiguration:setTimeCreated(timeCreated)
        self.timeCreated = timeCreated
end


function UserConfiguration:setTimeLastModified(timeLastModified)
        self.timeLastModified = timeLastModified
end

return UserConfiguration


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
local EmailServerConfigurationInterface = {}
EmailServerConfigurationInterface.__index = EmailServerConfigurationInterface
EmailServerConfigurationInterface.className = "EmailServerConfigurationInterface"


function EmailServerConfigurationInterface:setSmtpServer(value)
    error("abstract method setSmtpServer")
end


function EmailServerConfigurationInterface:getSmtpServer()
    error("abstract method getSmtpServer")
end


function EmailServerConfigurationInterface:getAccountName()
    error("abstract method getAccountName")
end


function EmailServerConfigurationInterface:setAccountName(accountName)
    error("abstract method setAccountName")
end


function EmailServerConfigurationInterface:getPassword()
    error("abstract method getPassword")
end


function EmailServerConfigurationInterface:setPassword(password)
    error("abstract method setPassword")
end


function EmailServerConfigurationInterface:log()
    error("abstract method log")
end


function EmailServerConfigurationInterface:toString()
    error("abstract method toString")
end
EmailServerConfigurationInterface.__tostring = function(self) return self:toString() end

return EmailServerConfigurationInterface


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
-- package org.allbinary.logic.communication.ftp.configuration


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
local FtpConfigurationInterface = {}
FtpConfigurationInterface.__index = FtpConfigurationInterface
FtpConfigurationInterface.className = "FtpConfigurationInterface"


function FtpConfigurationInterface:getServer()
    error("abstract method getServer")
end


function FtpConfigurationInterface:getPath()
    error("abstract method getPath")
end


function FtpConfigurationInterface:getUserName()
    error("abstract method getUserName")
end


function FtpConfigurationInterface:getPassword()
    error("abstract method getPassword")
end


function FtpConfigurationInterface:setServer(value)
    error("abstract method setServer")
end


function FtpConfigurationInterface:setPath(value)
    error("abstract method setPath")
end


function FtpConfigurationInterface:setUserName(value)
    error("abstract method setUserName")
end


function FtpConfigurationInterface:setPassword(value)
    error("abstract method setPassword")
end

return FtpConfigurationInterface


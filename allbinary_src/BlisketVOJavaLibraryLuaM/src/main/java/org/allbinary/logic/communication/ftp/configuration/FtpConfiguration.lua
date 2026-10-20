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

-- local HashMap = require("java.util.HashMap")
local FtpConfigurationInterface = require("org.allbinary.logic.communication.ftp.configuration.FtpConfigurationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FtpConfiguration = {}
FtpConfiguration.__index = FtpConfiguration
FtpConfiguration.className = "FtpConfiguration"

function FtpConfiguration:_init_fields()
    self.ftpServer = nil
    self.ftpPath = nil
    self.ftpUserName = nil
    self.ftpPassword = nil
end

function FtpConfiguration.new(...)
    local count = select("#", ...)
    if count == 0 then return FtpConfiguration._new0(...)
    elseif count == 1 then return FtpConfiguration._new1(...)
    end
end


function FtpConfiguration._new0()
    local self = setmetatable({}, FtpConfiguration)
    self:_init_fields()
    return self
end


function FtpConfiguration._new1(hashMap)
    local self = setmetatable({}, FtpConfiguration)
    self:_init_fields()
        self.ftpServer = hashMap:get(FtpConfigurationData.SERVER)
        self.ftpPath = hashMap:get(FtpConfigurationData.PATH)
        self.ftpUserName = hashMap:get(FtpConfigurationData.USERNAME)
        self.ftpPassword = hashMap:get(FtpConfigurationData.PASSWORD)
    return self
end


function FtpConfiguration:getServer()
        return self.ftpServer
end


function FtpConfiguration:getPath()
        return self.ftpPath
end


function FtpConfiguration:getUserName()
        return self.ftpUserName
end


function FtpConfiguration:getPassword()
        return self.ftpPassword
end


function FtpConfiguration:setServer(value)
        self.ftpServer = value
end


function FtpConfiguration:setPath(value)
        self.ftpPath = value
end


function FtpConfiguration:setUserName(value)
        self.ftpUserName = value
end


function FtpConfiguration:setPassword(value)
        self.ftpPassword = value
end

return FtpConfiguration


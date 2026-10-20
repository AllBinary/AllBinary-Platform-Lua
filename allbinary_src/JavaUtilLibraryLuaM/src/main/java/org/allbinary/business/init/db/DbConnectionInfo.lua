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
-- package org.allbinary.business.init.db

local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DbConnectionInfo = {}
DbConnectionInfo.__index = DbConnectionInfo
DbConnectionInfo.className = "DbConnectionInfo"

function DbConnectionInfo:_init_fields()
    self.jdbcDriver = nil
    self.name = nil
    self.userName = nil
    self.password = nil
    self.schema = nil
    self.server = nil
    self.port = nil
    self.url = nil
    self.host = nil
    self.SCHEMA_SEP = "://"
    self.USER_NAME_KEY = "?user="
    self.PASSWORD_KEY = "&password="
end


function DbConnectionInfo.new()
    local self = setmetatable({}, DbConnectionInfo)
    self:_init_fields()
    return self
end


function DbConnectionInfo:updateUrl()
        self:updateHost()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self:getHost())
        stringBuffer:append(self:getName())
        stringBuffer:append(self:getUserNameKey())
        stringBuffer:append(self:getUserName())
        stringBuffer:append(self:getPasswordKey())
        stringBuffer:append(self:getPassword())
        self.url = tostring(stringBuffer)
end


function DbConnectionInfo:getUrl()
        return self.url
end


function DbConnectionInfo:getJdbcDriver()
        return self.jdbcDriver
end


function DbConnectionInfo:getName()
        return self.name
end


function DbConnectionInfo:getUserName()
        return self.userName
end


function DbConnectionInfo:getPassword()
        return self.password
end


function DbConnectionInfo:updateHost()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self:getSchema())
        stringBuffer:append(self.SCHEMA_SEP)
        stringBuffer:append(self:getServer())
        if self:getPort() ~= nil and self:getPort():length() > 1 then
            stringBuffer:append(CommonSeps.getInstance().COLON)
            stringBuffer:append(self:getPort())
        end
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.host = tostring(stringBuffer)
end


function DbConnectionInfo:getHost()
        return self.host
end


function DbConnectionInfo:getSchema()
        return self.schema
end


function DbConnectionInfo:getServer()
        return self.server
end


function DbConnectionInfo:getPort()
        return self.port
end


function DbConnectionInfo:setJdbcDriver(value)
        self.jdbcDriver = value
end


function DbConnectionInfo:setName(value)
        self.name = value
        self:updateUrl()
end


function DbConnectionInfo:setUserName(value)
        self.userName = value
        self:updateUrl()
end


function DbConnectionInfo:setPassword(value)
        self.password = value
        self:updateUrl()
end


function DbConnectionInfo:setSchema(value)
        self.schema = value
        self:updateUrl()
end


function DbConnectionInfo:setServer(value)
        self.server = value
        self:updateUrl()
end


function DbConnectionInfo:setPort(value)
        self.port = value
        self:updateUrl()
end


function DbConnectionInfo:getUserNameKey()
        return self.USER_NAME_KEY
end


function DbConnectionInfo:getPasswordKey()
        return self.PASSWORD_KEY
end

return DbConnectionInfo


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

local DbConnectionInfo = {}
package.loaded["org.allbinary.business.init.db.DbConnectionInfo"] = DbConnectionInfo

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table DbConnectionInfo is declared before the requires
DbConnectionInfo.__index = DbConnectionInfo
DbConnectionInfo.className = "DbConnectionInfo"
DbConnectionInfo.javaClassName = "org.allbinary.business.init.db.DbConnectionInfo"
DbConnectionInfo.java_implements = " DatabaseConnectionInfoInterface "
DbConnectionInfo.java_interfaces = function() return {DatabaseConnectionInfoInterface} end

function DbConnectionInfo:_init_fields()
    if self.jdbcDriver == nil then self.jdbcDriver = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.userName == nil then self.userName = nil end
    if self.password == nil then self.password = nil end
    if self.schema == nil then self.schema = nil end
    if self.server == nil then self.server = nil end
    if self.port == nil then self.port = nil end
    if self.url == nil then self.url = nil end
    if self.host == nil then self.host = nil end
    self.SCHEMA_SEP = "://"
    self.USER_NAME_KEY = "?user="
    self.PASSWORD_KEY = "&password="
end


function DbConnectionInfo._jinit(self)
    DbConnectionInfo._init_fields(self)
    return self
end

function DbConnectionInfo.new(...)
    local self = setmetatable({}, DbConnectionInfo)
    DbConnectionInfo._jinit(self, ...)
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
        return self.name_f
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
        if not rawequal(self:getPort(), nil) and self:getPort():length() > 1 then
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
        self.name_f = value
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


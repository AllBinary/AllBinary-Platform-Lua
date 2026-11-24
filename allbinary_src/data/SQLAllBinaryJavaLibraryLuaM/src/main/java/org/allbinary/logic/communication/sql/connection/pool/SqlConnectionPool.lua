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
-- package org.allbinary.logic.communication.sql.connection.pool

local SqlConnectionPool = {}
package.loaded["org.allbinary.logic.communication.sql.connection.pool.SqlConnectionPool"] = SqlConnectionPool

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

-- local Connection = require("java.sql.Connection")
-- local DriverManager = require("java.sql.DriverManager")
-- local SQLException = require("java.sql.SQLException")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table SqlConnectionPool is declared before the requires
SqlConnectionPool.__index = SqlConnectionPool
SqlConnectionPool.className = "SqlConnectionPool"
SqlConnectionPool.javaClassName = "org.allbinary.logic.communication.sql.connection.pool.SqlConnectionPool"

function SqlConnectionPool:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stdUtil = StdUtil.getInstance()
    self.connectionHashMap = nil
    self.FIRST_NEW_CONNECTION_CREATED = "First New Connection Created: "
    self.FIRST = "First "
    self.NEW_CONNECTION_FOR = "New Connection For "
    self.CREATED = " Created"
    self.NUMBER_OF_SQL_CONNECTIONS_FOR = "Number Of Sql Connections for: "
    self.NUMBER_OF_SQL_CONNECTION_VECTORS = "Number Of Sql Connection Vectors: "
    self.IS = " is "
    self.CONNECTION_ALLREADY_CLOSED = "Connection AllReady Closed"
    self.METHOD_GET = "get()"
    self.METHOD_ADD = "add()"
end


function SqlConnectionPool.getInstance()
        return SqlConnectionPool.instance_f
end


function SqlConnectionPool._jinit(self)
    SqlConnectionPool._init_fields(self)
    return self
end

function SqlConnectionPool.new(...)
    local self = setmetatable({}, SqlConnectionPool)
    SqlConnectionPool._jinit(self, ...)
    return self
end


-- throws SQLException
function SqlConnectionPool:get(url)
        if self.connectionHashMap == nil then
            self.connectionHashMap = self.stdUtil:createHashMap()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
                self.logUtil:putF(self.FIRST_NEW_CONNECTION_CREATED .. url, self, self.METHOD_GET)
            end
            return DriverManager.getConnection(url)
        else
            local connectionVector = self.connectionHashMap:get(url)
            if connectionVector == nil then
                connectionVector = BasicArrayListD.new()
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self.FIRST)
                    stringBuffer:append(self.NEW_CONNECTION_FOR)
                    stringBuffer:append(url)
                    stringBuffer:append(self.CREATED)
                    self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET)
                end
                return DriverManager.getConnection(url)
            elseif connectionVector:size() == 0 then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
                    self.logUtil:putF(tostring(StringMaker.new():append(self.NEW_CONNECTION_FOR):append(url):append(self.CREATED)), self, self.METHOD_GET)
                end
                return DriverManager.getConnection(url)
            else
                local stringBuffer = StringMaker.new()
                local size = connectionVector:size()
                for i = 0, size - 1 do
                    local sqlConnection = connectionVector:get(i)
                    if not sqlConnection:isClosed() then
                        connectionVector:remove(sqlConnection)
                        self.connectionHashMap:put(url, connectionVector)
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
                            stringBuffer:delete(0, stringBuffer:length())
                            stringBuffer:append(self.NUMBER_OF_SQL_CONNECTIONS_FOR)
                            stringBuffer:append(url)
                            stringBuffer:append(self.IS)
                            stringBuffer:appendint(connectionVector:size())
                            self.logUtil:putF(self.NUMBER_OF_SQL_CONNECTION_VECTORS .. tostring(self.connectionHashMap:size()), self, self.METHOD_GET)
                            self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET)
                        end
                        return sqlConnection
                    end
                end
            end
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.NEW_CONNECTION_FOR)
            stringBuffer:append(url)
            stringBuffer:append(self.CREATED)
            self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET)
        end
        return DriverManager.getConnection(url)
end


-- throws SQLException
function SqlConnectionPool:add(url, sqlConnection)
        if not sqlConnection:isClosed() then
            local connectionVector = nil
            if self.connectionHashMap == nil then
                self.connectionHashMap = self.stdUtil:createHashMap()
                connectionVector = BasicArrayListD.new()
                connectionVector:add(sqlConnection)
            else
                connectionVector = self.connectionHashMap:get(url)
                if connectionVector == nil then
                    connectionVector = BasicArrayListD.new()
                end
                connectionVector:add(sqlConnection)
                self.connectionHashMap:put(url, connectionVector)
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append(self.NUMBER_OF_SQL_CONNECTIONS_FOR)
                stringBuffer:append(url)
                stringBuffer:append(self.IS)
                stringBuffer:appendint(connectionVector:size())
                self.logUtil:putF(self.NUMBER_OF_SQL_CONNECTION_VECTORS .. tostring(self.connectionHashMap:size()), self, self.METHOD_ADD)
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_ADD)
            end
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGPOOL) then
            self.logUtil:putF(self.CONNECTION_ALLREADY_CLOSED, self, self.METHOD_ADD)
        end
end

SqlConnectionPool.instance_f = SqlConnectionPool.new()

return SqlConnectionPool


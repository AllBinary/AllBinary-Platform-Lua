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

-- local Connection = require("java.sql.Connection")
-- local DriverManager = require("java.sql.DriverManager")
-- local SQLException = require("java.sql.SQLException")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SqlConnectionPool = {}
SqlConnectionPool.__index = SqlConnectionPool
SqlConnectionPool.className = "SqlConnectionPool"

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
        return SqlConnectionPool.instance
end


function SqlConnectionPool.new()
    local self = setmetatable({}, SqlConnectionPool)
    self:_init_fields()
    return self
end


-- throws SQLException
function SqlConnectionPool:get(url)
        if self.connectionHashMap == nil then
            self.connectionHashMap = self.stdUtil:createHashMap()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
                self.logUtil:putF(self.FIRST_NEW_CONNECTION_CREATED .. url, self, self.METHOD_GET)
            end
            return DriverManager.getConnection(url)
        else
            local connectionVector = self.connectionHashMap:get(url)
            if connectionVector == nil then
                connectionVector = BasicArrayListD.new()
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self.FIRST)
                    stringBuffer:append(self.NEW_CONNECTION_FOR)
                    stringBuffer:append(url)
                    stringBuffer:append(self.CREATED)
                    self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET)
                end
                return DriverManager.getConnection(url)
            elseif connectionVector:size() == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
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
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
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
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
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
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append(self.NUMBER_OF_SQL_CONNECTIONS_FOR)
                stringBuffer:append(url)
                stringBuffer:append(self.IS)
                stringBuffer:appendint(connectionVector:size())
                self.logUtil:putF(self.NUMBER_OF_SQL_CONNECTION_VECTORS .. tostring(self.connectionHashMap:size()), self, self.METHOD_ADD)
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_ADD)
            end
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGPOOL) then
            self.logUtil:putF(self.CONNECTION_ALLREADY_CLOSED, self, self.METHOD_ADD)
        end
end

SqlConnectionPool.instance = SqlConnectionPool.new()

return SqlConnectionPool


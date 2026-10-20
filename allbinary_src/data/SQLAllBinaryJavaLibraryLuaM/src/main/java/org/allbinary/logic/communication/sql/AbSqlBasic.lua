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
-- package org.allbinary.logic.communication.sql

-- local Connection = require("java.sql.Connection")
-- local ResultSet = require("java.sql.ResultSet")
-- local SQLException = require("java.sql.SQLException")
-- local Statement = require("java.sql.Statement")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SqlConnectionPool = require("org.allbinary.logic.communication.sql.connection.pool.SqlConnectionPool")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local AbSqlBasic = {}
AbSqlBasic.__index = AbSqlBasic
AbSqlBasic.className = "AbSqlBasic"

function AbSqlBasic:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.sqlConnectionPool = SqlConnectionPool.getInstance()
    self.databaseConnectionInfoInterface = nil
    self.connectAttemptCounter = nil
    self.conn = nil
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.stdUtil = StdUtil.getInstance()
    self.sqlTypeStrings = SqlTypeStrings.getInstance()
    self.sqlStrings = SqlStrings.getInstance()
    self.INSERT = "insert"
    self.UPDATE = "update"
    self.FAILED_SQL_STATEMENT = "Failed\nSQL Statement: "
    self.SUCCESS_SQL_STATEMENT = "Success\nSQL Statement: "
    self.METHOD_EXECUTED_SQL_STATEMENT = "executedSQLStatement"
    self.METHOD_CREATE = "create"
    self.DATABASE_CREATED_LABEL = "Database Created: "
    self.DATABASE_CREATION_FAILED_LABEL = "Database Creation Failed: "
    self.SQL_CONNECTION_FAILED = "SQL Connection Failed"
    self.SQL_CONNECTION_RETRYING = "SQL Connection Retrying"
    self.SQL_CONNECTION_RETRY = "SQL Connection Retry"
    self.METHOD_CREATE_CONNECTION = "createConnection()"
    self.METHOD_INITIALIZE = "initialize"
    self.LOAD_JDBC_DRIVER_FAILED_LABEL = "Load JDBC Driver Failed: "
end


function AbSqlBasic.new(databaseConnectionInfoInterface)
    local self = setmetatable({}, AbSqlBasic)
    self:_init_fields()
        self.databaseConnectionInfoInterface = databaseConnectionInfoInterface
        self.connectAttemptCounter = 0
        self.conn = nil
    return self
end


-- throws SQLException
function AbSqlBasic:executeSQLStatement(statement)
        local try_ok, try_error = pcall(function()
            self:initialize()
            local stmt = self.conn:createStatement()
            stmt:execute(statement)
            local rset = stmt:getResultSet()
            stmt:close()
            local tempConnection = self.conn
            self.conn = nil
            self.sqlConnectionPool:add(self:getDatabaseConnectionInfoInterface():getUrl(), tempConnection)
            return rset
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT .. statement, self, self.METHOD_EXECUTED_SQL_STATEMENT, e)
            end
            self.conn:close()
            self.conn = nil
            error(e, 0)
        end
end


function AbSqlBasic:create(databaseName)
        local try_ok, try_error = pcall(function()
            self:executeSQLStatement(tostring(self.sqlStrings.CREATE_DATABASE) .. databaseName)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.DATABASE_CREATED_LABEL .. databaseName, self, self.METHOD_CREATE)
            end
            return databaseName .. tostring(self.sqlStrings.CREATE_RETURN)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.DATABASE_CREATION_FAILED_LABEL .. databaseName, self, self.METHOD_CREATE, e)
            end
            return self.DATABASE_CREATION_FAILED_LABEL .. databaseName
        end
end


function AbSqlBasic:createConnection()
        local try_ok, try_error = pcall(function()
            self.conn = self.sqlConnectionPool:get(self:getDatabaseConnectionInfoInterface():getUrl())
        end)
        if not try_ok then
            local se = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.SQL_CONNECTION_RETRYING, self, self.METHOD_CREATE_CONNECTION, se)
            end
            local try_ok, try_error = pcall(function()
                Thread.currentThread():sleep(2000)
                if self.connectAttemptCounter < 10 then
                    self.connectAttemptCounter = self.connectAttemptCounter + 1
                    self:initialize()
                end
            end)
            if not try_ok then
                local e = try_error
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                    self.logUtil:put(self.SQL_CONNECTION_RETRY .. tostring(se), self, self.METHOD_CREATE_CONNECTION, e)
                end
            end
        end
end


function AbSqlBasic:initialize()
        local try_ok, try_error = pcall(function()
            do
                local try_ok, try_error = pcall(function()
                    local loader = Thread.currentThread():getContextClassLoader()
                    local jdbcDriverClass = loader:loadClass(self:getDatabaseConnectionInfoInterface():getJdbcDriver())
                    jdbcDriverClass:newInstance()
                end)
                if not try_ok then
                    local e = try_error
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                        self.logUtil:put(self.LOAD_JDBC_DRIVER_FAILED_LABEL .. tostring(self:getDatabaseConnectionInfoInterface():getJdbcDriver()), self, self.METHOD_INITIALIZE, e)
                    end
                end
            end
            self:createConnection()
        end)
        if not try_ok then
            local se = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.SQL_CONNECTION_FAILED, self, self.METHOD_INITIALIZE, se)
            end
        end
end


function AbSqlBasic:getDatabaseConnectionInfoInterface()
        return self.databaseConnectionInfoInterface
end


function AbSqlBasic:setDatabaseConnectionInfoInterface(databaseConnectionInfoInterface)
        self.databaseConnectionInfoInterface = databaseConnectionInfoInterface
end

return AbSqlBasic


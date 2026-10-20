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
-- package org.allbinary.business.init

-- local Connection = require("java.sql.Connection")
-- local DriverManager = require("java.sql.DriverManager")
-- local ResultSet = require("java.sql.ResultSet")
-- local ResultSetMetaData = require("java.sql.ResultSetMetaData")
-- local SQLException = require("java.sql.SQLException")
-- local Statement = require("java.sql.Statement")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local SqlStrings = require("org.allbinary.logic.communication.sql.SqlStrings")
local SqlTypeStrings = require("org.allbinary.logic.communication.sql.SqlTypeStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
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

local InitSql = {}
InitSql.__index = InitSql
InitSql.className = "InitSql"

function InitSql:_init_fields()
    self.stringUtil = StringUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.sqlTypeStrings = SqlTypeStrings.getInstance()
    self.sqlStrings = SqlStrings.getInstance()
    self.stdUtil = StdUtil.getInstance()
    self.INSERT = "insert"
    self.UPDATE = "update"
    self.databaseConnectionInfoInterface = nil
    self.userid = nil
    self.password = nil
    self.tableName = nil
    self.conn = nil
    self.useridAndPassword = false
    self.SUCCESS_SQL_STATEMENT = "Success\nSQL Statement: "
    self.FAILED_SQL_STATEMENT = "Failed\nSQL Statement: "
    self.INIT_SQL = "InitSql"
    self.commonStrings = CommonStrings.getInstance()
    self.EQUAL_QUOTE = "=\""
    self.METHOD_GET_ROW = "getRow()"
    self.METHOD_UPDATE_WHERE = "updateWhere()"
    self.ROW_VALUE_LABEL = "Row Value: "
    self.NO_RESULTS_IN_RESULT_SET = "No Results in ResultSet"
    self.INSERT_END = "')"
end


function InitSql.new(databaseConnectionInfoInterface)
    local self = setmetatable({}, InitSql)
    self:_init_fields()
        self:setDatabaseConnectionInfoInterface(databaseConnectionInfoInterface)
    return self
end


function InitSql:setTable(tableName)
        self.tableName = tableName
end


function InitSql:setDatabaseConnectionInfoInterface(databaseConnectionInfoInterface)
        self.databaseConnectionInfoInterface = databaseConnectionInfoInterface
end


function InitSql:createTable(tableData)
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Creating Table: ")
            stringBuffer:append(tableData)
            PreLogUtil.put(tostring(stringBuffer), self.INIT_SQL, "createTable()")
            self:executeSQLStatement(tableData)
            return true
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.INIT_SQL, "createTable()", e)
            end
            return false
        end
end


function InitSql:dropTable()
        local sqlStatement = tostring(self.sqlStrings.DROP_TABLE) .. self.tableName
        local try_ok, try_error = pcall(function()
            self:executeSQLStatement(sqlStatement)
            return true
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.INIT_SQL, "dropTables()", e)
            end
            return false
        end
end


function InitSql:getRow(keysAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error = pcall(function()
            local result = nil
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local key = keyArray[i + 1]
                local value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            local sqlStatement = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                PreLogUtil.put(tostring(self.sqlStrings.SQL_STATEMENT_LABEL) .. sqlStatement, self.INIT_SQL, self.METHOD_GET_ROW)
            end
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            while rset:next() do
                result = self.stdUtil:createHashMap()
                local columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    local columnName = resultSetMetaData:getColumnName(index)
                    local field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    PreLogUtil.put(self.ROW_VALUE_LABEL .. tostring(result), self.INIT_SQL, self.METHOD_GET_ROW)
                end
                return result
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                PreLogUtil.put(self.NO_RESULTS_IN_RESULT_SET, self.INIT_SQL, self.METHOD_GET_ROW)
            end
            return nil
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.FAILED_SQL_STATEMENT .. tostring(stringBuffer), self.INIT_SQL, self.METHOD_GET_ROW, e)
            end
            return nil
        end
end


function InitSql:updateWhere(key, value, updatedKeyValuePairs)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.UPDATE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.SET)
        local try_ok, try_error = pcall(function()
            local columnArray = updatedKeyValuePairs:keySet():toArray()
            local size = (columnArray.n or #columnArray)
            for i = 0, size - 1 do
                local columnName = tostring(columnArray[i + 1])
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(columnName)
                stringBuffer:append(self.EQUAL_QUOTE)
                local columnValue = updatedKeyValuePairs:get(columnName)
                if columnValue == nil then
                    columnValue = self.stringUtil.EMPTY_STRING
                else
                end
                stringBuffer:append(self:getValue(columnValue))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.commonSeps.COMMA)
                end
            end
            stringBuffer:append(self.sqlStrings.WHERE)
            stringBuffer:append(key)
            stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
            stringBuffer:append(self:getValue(value))
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                PreLogUtil.put(self.SUCCESS_SQL_STATEMENT .. sqlStatement, self.INIT_SQL, self.METHOD_UPDATE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.FAILED_SQL_STATEMENT .. tostring(stringBuffer), self.INIT_SQL, self.METHOD_UPDATE_WHERE, e)
            end
        end
end


function InitSql:insert(values)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.INSERT_INTO)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.VALUES)
        local try_ok, try_error = pcall(function()
            local size = values:size()
            for i = 0, size - 1 - 1 do
                local value = self:getValue(values:get(i))
                stringBuffer:append(value)
                stringBuffer:append(self.sqlStrings.SINGLE_QUOTE_COMMA_SEP)
            end
            local value = self:getValue(values:get(values:size() - 1))
            stringBuffer:append(value)
            stringBuffer:append(self.INSERT_END)
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                PreLogUtil.put(self.SUCCESS_SQL_STATEMENT .. sqlStatement, self.INIT_SQL, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.FAILED_SQL_STATEMENT .. tostring(stringBuffer), self.INIT_SQL, self.INSERT, e)
            end
        end
end


function InitSql:getValue(value)
        if StringValidationUtil.getInstance():isEmpty(value) then
            return self.stringUtil.EMPTY_STRING
        else
            return value
        end
end


-- throws Exception, SQLException
function InitSql:executeSQLStatement(statement)
        local try_ok, try_error = pcall(function()
            if self.conn == nil then
                self:initialize()
            end
            local stmt = self.conn:createStatement()
            stmt:execute(statement)
            local rset = stmt:getResultSet()
            stmt:close()
            return rset
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.INIT_SQL, "executeSQLStatement()", e)
            end
            error(e, 0)
        end
end


-- throws SQLException
function InitSql:createConnection()
        local try_ok, try_error = pcall(function()
            if self.useridAndPassword == true then
                self.conn = DriverManager.getConnection(self.databaseConnectionInfoInterface:getUrl(), self.userid, self.password)
            else
                self.conn = DriverManager.getConnection(self.databaseConnectionInfoInterface:getUrl())
            end
        end)
        if not try_ok then
            local se = try_error
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.INIT_SQL, "createConnection()", se)
            error(se, 0)
        end
end


-- throws Exception
function InitSql:initialize()
        local try_ok, try_error = pcall(function()
            local try_ok, try_error = pcall(function()
                local jdbcDriver = self.databaseConnectionInfoInterface:getJdbcDriver()
                PreLogUtil.put(tostring(StringMaker.new():append("Loading DbConnnectionInfo: "):append(getmetatable(self.databaseConnectionInfoInterface).className):append(" Driver: "):append(jdbcDriver)), self.INIT_SQL, "initialize()")
                Class.forName(jdbcDriver):newInstance()
            end)
            if not try_ok then
                local e = try_error
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                    PreLogUtil.putOE("LoadDriver Failed: " .. tostring(self.databaseConnectionInfoInterface:getJdbcDriver()), self.INIT_SQL, "initialize()", e)
                end
                error(e, 0)
            end
            if self.userid == nil and self.password == nil then
                self.useridAndPassword = true
            end
            self:createConnection()
        end)
        if not try_ok then
            local se = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self.INIT_SQL, "initialize()", se)
            end
            error(se, 0)
        end
end


function InitSql:getDatabaseConnectionInfoInterface()
        return self.databaseConnectionInfoInterface
end

return InitSql


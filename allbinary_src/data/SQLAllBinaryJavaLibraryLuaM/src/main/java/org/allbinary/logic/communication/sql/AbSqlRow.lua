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

-- local ResultSet = require("java.sql.ResultSet")
-- local ResultSetMetaData = require("java.sql.ResultSetMetaData")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local AbSqlColumn = require("org.allbinary.logic.communication.sql.AbSqlColumn")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlRow = {}
AbSqlRow.__index = AbSqlRow
AbSqlRow.className = "AbSqlRow"
setmetatable(AbSqlRow, {__index = AbSqlColumn})

function AbSqlRow:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.EQUAL_QUOTE = "=\""
    self.ESCAPE_QUOTES = "\\\""
    self.GET_ROW = "Row Value: "
    self.METHOD_GET_ROW = "getRow()"
    self.METHOD_GET_ROWS = "getRows()"
    self.METHOD_GET_ALL_ROWS = "getAllRows()"
    self.METHOD_UPDATE_WHERE = "updateWhere()"
    self.METHOD_GET_ROWS_WHERE_BETWEEN = "getRowsWhereBetween()"
    self.METHOD_DELETE_WHERE = "deleteWhere()"
    self.ROW_VALUE_LABEL = "Row Value: "
    self.ROW_VALUES_LABEL = "Row Values: "
    self.NO_RESULTS_IN_RESULT_SET = "No Results in ResultSet"
    self.COLUMN_NAME_LABEL = "columnName: "
    self.INSERT_END = "')"
end


function AbSqlRow.new(databaseConnectionInfoInterface)
    local self = setmetatable(AbSqlColumn.new(databaseConnectionInfoInterface), AbSqlRow)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbSqlRow:getValue(value)
        if StringValidationUtil.getInstance():isEmpty(value) then
            return self.stringUtil.EMPTY_STRING
        else
            return value
        end
end


function AbSqlRow:updateWhere(key, value, updatedKeyValuePairs)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.UPDATE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.SET)
        local try_ok, try_error = pcall(function()
            local keyArray = updatedKeyValuePairs:keySet():toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local columnName = tostring(keyArray[i + 1])
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(columnName)
                stringBuffer:append(self.EQUAL_QUOTE)
                local columnValue = updatedKeyValuePairs:get(columnName)
                if columnValue == nil then
                    columnValue = self.stringUtil.EMPTY_STRING
                else
                    columnValue = Replace.new(self.sqlStrings.CLOSE_QUOTE, self.ESCAPE_QUOTES):all(columnValue)
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
                self.logUtil:putF(tostring(self.SUCCESS_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_UPDATE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_UPDATE_WHERE, e)
            end
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbSqlRow:updateWhere(whereKeyValuePairs, updatedKeyValuePairs)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.UPDATE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.SET)
        local try_ok, try_error = pcall(function()
            local keyArray = updatedKeyValuePairs:keySet():toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local columnName = tostring(keyArray[i + 1])
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(columnName)
                stringBuffer:append(self.EQUAL_QUOTE)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.COLUMN_NAME_LABEL .. columnName, self, self.METHOD_UPDATE_WHERE)
                end
                local columnValue = updatedKeyValuePairs:get(columnName)
                if columnValue == nil then
                    columnValue = self.stringUtil.EMPTY_STRING
                else
                    columnValue = Replace.new(self.sqlStrings.CLOSE_QUOTE, self.ESCAPE_QUOTES):all(columnValue)
                end
                stringBuffer:append(self:getValue(columnValue))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.commonSeps.COMMA)
                end
            end
            stringBuffer:append(self.sqlStrings.WHERE)
            local set = whereKeyValuePairs:keySet()
            local keyArray2 = set:toArray()
            local size2 = (keyArray2.n or #keyArray2)
            for i = 0, size2 - 1 do
                local key = keyArray2[i + 1]
                local value = whereKeyValuePairs:get(key)
                do
                    stringBuffer:append(key)
                    stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                    stringBuffer:append(self:getValue(value))
                    stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                    if i < size2 - 1 then
                        stringBuffer:append(self.sqlStrings.AND)
                    end
                end
            end
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.SUCCESS_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_UPDATE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_UPDATE_WHERE, e)
            end
            error(e, 0)
        end
end


function AbSqlRow:deleteWhere(key, value)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.DELETE)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        stringBuffer:append(key)
        stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
        stringBuffer:append(value)
        stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
        local try_ok, try_error = pcall(function()
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.SUCCESS_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_DELETE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. tostring(stringBuffer), self, self.METHOD_DELETE_WHERE, e)
            end
        end
end


-- Java overloaded method: Lua keeps the last definition
function AbSqlRow:deleteWhere(keysAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.DELETE)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error = pcall(function()
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
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.SUCCESS_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_DELETE_WHERE)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. tostring(stringBuffer), self, self.METHOD_DELETE_WHERE, e)
            end
        end
end


function AbSqlRow:insert(values)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.INSERT_INTO)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.VALUES)
        local try_ok, try_error = pcall(function()
            for i = 0, values:size() - 1 - 1 do
                local value = self:getValue(values:get(i))
                value = Replace.new(self.sqlStrings.ESCAPE, self.sqlStrings.DOUBLE_ESCAPE):all(value)
                stringBuffer:append(value)
                stringBuffer:append(self.sqlStrings.SINGLE_QUOTE_COMMA_SEP)
            end
            local value = self:getValue(values:get(values:size() - 1))
            value = Replace.new(self.sqlStrings.ESCAPE, self.sqlStrings.DOUBLE_ESCAPE):all(value)
            stringBuffer:append(value)
            stringBuffer:append(self.INSERT_END)
            local sqlStatement = tostring(stringBuffer)
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.SUCCESS_SQL_STATEMENT) .. sqlStatement, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. tostring(stringBuffer), self, self.INSERT, e)
            end
        end
end


function AbSqlRow:getRow(keysAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error = pcall(function()
            local result = nil
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for index = 0, size - 1 do
                local key = keyArray[index + 1]
                local value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if index < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            local sqlStatement = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.sqlStrings.SQL_STATEMENT_LABEL) .. sqlStatement, self, self.METHOD_GET_ROW)
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
                    self.logUtil:putF(self.ROW_VALUE_LABEL .. tostring(result), self, self.METHOD_GET_ROW)
                end
                return result
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:putF(self.NO_RESULTS_IN_RESULT_SET, self, self.METHOD_GET_ROW)
            end
            return nil
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROW, e)
            end
            return nil
        end
end


function AbSqlRow:getRows(keysAndValues)
        return self:getRows(keysAndValues, StringUtil.getInstance().EMPTY_STRING)
end


-- Java overloaded method: Lua keeps the last definition
function AbSqlRow:getRows(keysAndValues, more)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error = pcall(function()
            local rows = BasicArrayListD.new()
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for index = 0, size - 1 do
                local key = keyArray[index + 1]
                local value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if index < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.sqlStrings.SQL_STATEMENT_LABEL + stringBuffer, self, self.METHOD_GET_ROWS)
            end
            stringBuffer:append(more)
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            while rset:next() do
                local result = self.stdUtil:createHashMap()
                local columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    local columnName = resultSetMetaData:getColumnName(index)
                    local field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                local resultAsString = tostring(result)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.GET_ROW .. resultAsString, self, self.METHOD_GET_ROWS)
                end
                rows:add(result)
            end
            return rows
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROWS, e)
            end
            return nil
        end
end


function AbSqlRow:getAllRows()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.sqlStrings.SQL_STATEMENT_LABEL + stringBuffer, self, self.METHOD_GET_ALL_ROWS)
            end
            local rows = BasicArrayListD.new()
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            while rset:next() do
                local result = self.stdUtil:createHashMap()
                local columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    local columnName = resultSetMetaData:getColumnName(index)
                    local field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.ROW_VALUES_LABEL .. tostring(result), self, self.METHOD_GET_ALL_ROWS)
                end
                rows:add(result)
            end
            return rows
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ALL_ROWS, e)
            end
            return nil
        end
end


function AbSqlRow:getRowsWhereBetween(whereKeyValuePairs, betweenColumn, smallest, largest)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        local try_ok, try_error = pcall(function()
            local rows = BasicArrayListD.new()
            stringBuffer:append(self.sqlStrings.WHERE)
            local set = whereKeyValuePairs:keySet()
            local key = nil
            local value = nil
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            for index = 0, size - 1 do
                key = keyArray[index + 1]
                value = whereKeyValuePairs:get(key)
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(self:getValue(value))
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                stringBuffer:append(self.sqlStrings.AND)
            end
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.MORE_THAN_QUOTE)
            stringBuffer:append(smallest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            stringBuffer:append(self.sqlStrings.AND)
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.LESS_THAN_QUOTE)
            stringBuffer:append(largest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.sqlStrings.SQL_STATEMENT_LABEL) .. sqlStatement, self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
            end
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            local result = nil
            local columnNames = nil
            local columnCount = 0
            local columnName = nil
            local field = nil
            while rset:next() do
                result = self.stdUtil:createHashMap()
                columnNames = BasicArrayListD.new()
                columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    columnName = resultSetMetaData:getColumnName(index)
                    field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.ROW_VALUE_LABEL .. tostring(result), self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
                end
                rows:add(result)
            end
            return rows
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROWS_WHERE_BETWEEN, e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function AbSqlRow:getRowsWhereBetween(betweenColumn, smallest, largest)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT_ALL_FROM)
        stringBuffer:append(self:getTableName())
        local try_ok, try_error = pcall(function()
            local rows = BasicArrayListD.new()
            stringBuffer:append(self.sqlStrings.WHERE)
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.MORE_THAN_QUOTE)
            stringBuffer:append(smallest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            stringBuffer:append(self.sqlStrings.AND)
            stringBuffer:append(betweenColumn)
            stringBuffer:append(self.sqlStrings.LESS_THAN_QUOTE)
            stringBuffer:append(largest)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.sqlStrings.SQL_STATEMENT_LABEL) .. sqlStatement, self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
            end
            local rset = self:executeSQLStatement(sqlStatement)
            local resultSetMetaData = rset:getMetaData()
            local columnName = nil
            local field = nil
            local result = nil
            local columnNames = nil
            local columnCount = 0
            while rset:next() do
                result = self.stdUtil:createHashMap()
                columnNames = BasicArrayListD.new()
                columnCount = resultSetMetaData:getColumnCount()
                for index = 1, columnCount do
                    columnName = resultSetMetaData:getColumnName(index)
                    field = rset:getString(columnName)
                    result:put(columnName, field)
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.ROW_VALUE_LABEL .. tostring(result), self, self.METHOD_GET_ROWS_WHERE_BETWEEN)
                end
                rows:add(result)
            end
            return rows
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(self.FAILED_SQL_STATEMENT + stringBuffer, self, self.METHOD_GET_ROWS_WHERE_BETWEEN, e)
            end
            return nil
        end
end

return AbSqlRow


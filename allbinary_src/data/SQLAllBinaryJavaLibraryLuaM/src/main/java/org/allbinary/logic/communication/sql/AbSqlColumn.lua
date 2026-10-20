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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbSqlTable = require("org.allbinary.logic.communication.sql.AbSqlTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlColumn = {}
AbSqlColumn.__index = AbSqlColumn
AbSqlColumn.className = "AbSqlColumn"
setmetatable(AbSqlColumn, {__index = AbSqlTable})

function AbSqlColumn:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.LARGEST_INT_VALUE_IN_COLUMN = "\nLargest Int Value in column: "
    self.METHOD_GET_LARGETS_INTEGER_IN_COLUMN = "getLargestIntegerInColumn"
    self.METHOD_GET_COLUMN = "getColumn"
    self.METHOD_GET_COLUMN_WHERE = "getColumnWhere"
    self.INVALID_RESULT = "-1"
end


function AbSqlColumn.new(databaseConnectionInfoInterface)
    local self = setmetatable(AbSqlTable.new(databaseConnectionInfoInterface), AbSqlColumn)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbSqlColumn:getLargestIntegerInColumnWhere(columnName, key, value)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(columnName)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        stringBuffer:append(key)
        stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
        stringBuffer:append(value)
        stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
        local sqlStatement = tostring(stringBuffer)
        local try_ok, try_error = pcall(function()
            local largest = 0
            local rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                local intValue = rset:getInt(columnName)
                if intValue > largest then
                    largest = intValue
                end
            end
            local largestAsString = tostring(largest)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                stringBuffer:append(sqlStatement)
                stringBuffer:append(self.LARGEST_INT_VALUE_IN_COLUMN)
                stringBuffer:append(largestAsString)
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_LARGETS_INTEGER_IN_COLUMN)
            end
            return largestAsString
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_LARGETS_INTEGER_IN_COLUMN, e)
            end
            return self.INVALID_RESULT
        end
end


function AbSqlColumn:getColumn(columnName)
        local column = BasicArrayListD.new()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(columnName)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        local sqlStatement = tostring(stringBuffer)
        local try_ok, try_error = pcall(function()
            local rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                local field = tostring(rset:getObject(columnName))
                column:add(field)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                stringBuffer:append(sqlStatement)
                stringBuffer:append(self.sqlStrings.COLUMN_VALUE)
                stringBuffer:append(tostring(column))
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_COLUMN)
            end
            return column
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_COLUMN, e)
            end
            return column
        end
end


function AbSqlColumn:getColumnWhere(columnName, key, value)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(columnName)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        stringBuffer:append(key)
        stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
        stringBuffer:append(value)
        stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
        local sqlStatement = tostring(stringBuffer)
        local column = BasicArrayListD.new()
        local rset = nil
        local field = nil
        local try_ok, try_error = pcall(function()
            rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                field = tostring(rset:getObject(columnName))
                column:add(field)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                stringBuffer:append(sqlStatement)
                stringBuffer:append(self.sqlStrings.COLUMN_VALUE)
                stringBuffer:append(tostring(column))
                self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_COLUMN_WHERE)
            end
            return column
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_COLUMN_WHERE, e)
            end
            return column
        end
end

return AbSqlColumn


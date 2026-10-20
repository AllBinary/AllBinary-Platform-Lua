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
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbSqlRow = require("org.allbinary.logic.communication.sql.AbSqlRow")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlBean = {}
AbSqlBean.__index = AbSqlBean
AbSqlBean.className = "AbSqlBean"
setmetatable(AbSqlBean, {__index = AbSqlRow})

function AbSqlBean:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.METHOD_GET_FIELD = "getField"
    self.METHOD_IS_SUBSET_OF_ENTRY = "isSubsetOfEntry"
end


function AbSqlBean.new(databaseConnectionInfoInterface)
    local self = setmetatable(AbSqlRow.new(databaseConnectionInfoInterface), AbSqlBean)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbSqlBean:getField(key, value, requestedField)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(requestedField)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        stringBuffer:append(key)
        stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
        stringBuffer:append(value)
        stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
        local sqlStatement = tostring(stringBuffer)
        local try_ok, try_error = pcall(function()
            local field = self.stringUtil.EMPTY_STRING
            local rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                field = rset:getString(requestedField)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                    stringBuffer:append(sqlStatement)
                    stringBuffer:append(self.sqlStrings.FIELD_VALUE)
                    stringBuffer:append(field)
                    self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_FIELD)
                end
                return field
            end
            return nil
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_FIELD, e)
            end
            return tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement
        end
end


-- Java overloaded method: Lua keeps the last definition
function AbSqlBean:getField(keysAndValues, requestedField)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        stringBuffer:append(requestedField)
        stringBuffer:append(self.sqlStrings.FROM)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.WHERE)
        local try_ok, try_error = pcall(function()
            local field = self.stringUtil.EMPTY_STRING
            local set = keysAndValues:keySet()
            local keyArray = set:toArray()
            local size = (keyArray.n or #keyArray)
            local key = nil
            local value = nil
            for i = 0, size - 1 do
                key = keyArray[i + 1]
                value = tostring(keysAndValues:get(key))
                stringBuffer:append(key)
                stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
                stringBuffer:append(value)
                stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
                if i < size - 1 then
                    stringBuffer:append(self.sqlStrings.AND)
                end
            end
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            while rset:next() do
                field = rset:getString(requestedField)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(self.sqlStrings.SQL_STATEMENT_LABEL)
                    stringBuffer:append(sqlStatement)
                    stringBuffer:append(self.sqlStrings.FIELD_VALUE)
                    stringBuffer:append(field)
                    self.logUtil:putF(tostring(stringBuffer), self, self.METHOD_GET_FIELD)
                end
                return field
            end
            return nil
        end)
        if not try_ok then
            local e = try_error
            local sqlStatement = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_GET_FIELD, e)
            end
            return tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement
        end
end


function AbSqlBean:isSubsetOfEntry(key, value, columnsAndValues)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.SELECT)
        local try_ok, try_error = pcall(function()
            local keyArray = columnsAndValues:keySet():toArray()
            local size = (keyArray.n or #keyArray)
            stringBuffer:append(self.commonSeps.SPACE)
            stringBuffer:append(key)
            for i = 0, size - 1 do
                stringBuffer:append(self.commonSeps.SPACE)
                stringBuffer:append(tostring(keyArray[i + 1]))
            end
            stringBuffer:append(self.sqlStrings.FROM)
            stringBuffer:append(self:getTableName())
            stringBuffer:append(self.sqlStrings.WHERE)
            stringBuffer:append(key)
            stringBuffer:append(self.sqlStrings.EQUAL_QUOTE)
            stringBuffer:append(value)
            stringBuffer:append(self.sqlStrings.CLOSE_QUOTE)
            local sqlStatement = tostring(stringBuffer)
            local rset = self:executeSQLStatement(sqlStatement)
            local columnName = nil
            local field = nil
            while rset:next() do
                local keyArray2 = columnsAndValues:keySet():toArray()
                local size2 = (keyArray2.n or #keyArray2)
                for i = 0, size2 - 1 do
                    columnName = tostring(keyArray2[i + 1])
                    field = tostring(rset:getObject(columnName))
                    if ((field < columnsAndValues:get(columnName) and -1) or (field > columnsAndValues:get(columnName) and 1) or 0) ~= 0 then
                        return org.allbinary.globals.GLOBALS2.NOTASUBSET
                    end
                end
            end
            if rset:getRow() ~= 1 then
                return org.allbinary.globals.GLOBALS2.NOTASUBSET
            else
                return org.allbinary.globals.GLOBALS2.ISASUBSET
            end
        end)
        if not try_ok then
            local e = try_error
            local sqlStatement = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_IS_SUBSET_OF_ENTRY, e)
            end
            return tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement
        end
end

return AbSqlBean


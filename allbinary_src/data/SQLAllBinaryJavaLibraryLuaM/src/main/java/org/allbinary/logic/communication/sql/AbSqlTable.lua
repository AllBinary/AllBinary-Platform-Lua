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

local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBasic = require("org.allbinary.logic.communication.sql.AbSqlBasic")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlTable = {}
AbSqlTable.__index = AbSqlTable
AbSqlTable.className = "AbSqlTable"
setmetatable(AbSqlTable, {__index = AbSqlBasic})

function AbSqlTable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = nil
    self.METHOD_CREATED_TABLE = "createTable()"
    self.METHOD_DROP_TABLE = "dropTable()"
    self.TABLE_CREATION_SUCCESS = "Table Creation Successful: "
    self.DROPPED_SUCCESS = " Dropped Successfully"
end


function AbSqlTable.new(databaseConnectionInfoInterface)
    local self = setmetatable(AbSqlBasic.new(databaseConnectionInfoInterface), AbSqlTable)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbSqlTable:setTableName(tableName)
        self.tableName = tableName
end


function AbSqlTable:getTableName()
        return self.tableName
end


function AbSqlTable:createTable(data)
        local try_ok, try_error = pcall(function()
            self:executeSQLStatement(data)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.TABLE_CREATION_SUCCESS .. self.tableName .. " with statement: " .. data, self, self.METHOD_CREATED_TABLE)
            end
            return self.tableName .. tostring(self.sqlStrings.CREATE_RETURN)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put("Table Creation Failed: " .. self.tableName .. " with statement: " .. data, self, self.METHOD_CREATED_TABLE, e)
            end
            return "Failed to Create " .. self.tableName .. " table."
        end
end


function AbSqlTable:dropTable()
        local sqlStatement = tostring(self.sqlStrings.DROP_TABLE) .. self.tableName
        local try_ok, try_error = pcall(function()
            self:executeSQLStatement(sqlStatement)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(tostring(self.SUCCESS_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_DROP_TABLE)
            end
            return self.tableName .. self.DROPPED_SUCCESS
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                self.logUtil:put(tostring(self.FAILED_SQL_STATEMENT) .. sqlStatement, self, self.METHOD_DROP_TABLE, e)
            end
            return "Failed to Drop " .. self.tableName .. " table."
        end
end

return AbSqlTable


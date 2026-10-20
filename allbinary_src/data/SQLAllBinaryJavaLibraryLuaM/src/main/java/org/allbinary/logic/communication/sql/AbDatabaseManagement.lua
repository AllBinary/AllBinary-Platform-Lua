-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.sql

-- local InetAddress = require("java.net.InetAddress")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbDatabaseManagement = {}
AbDatabaseManagement.__index = AbDatabaseManagement
AbDatabaseManagement.className = "AbDatabaseManagement"
setmetatable(AbDatabaseManagement, {__index = AbSqlBean})

function AbDatabaseManagement:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.sqlCommandLog = StringMaker.new()
    self.GRANT_ALL = "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON "
    self.DOT_STAR = ".*"
    self.TO = " TO "
    self.AT_LOCALHOST = "@localhost"
    self.IDENTIFIED_BY = " IDENTIFIED BY '"
    self.WITH_GRANT_OPTION = "' WITH GRANT OPTION"
    self.FAILED = "Failed"
    self.GET_HOST_NAME = "getHostName()"
    self.METHOD_ADD_USER = "addUser()"
    self.METHOD_ADD_USERS = "addUsers()"
    self.METHOD_ADD_DB = "addDb()"
    self.METHOD_ADD_DATABASES = "addDatabases()"
    self.METHOD_ADD_TABLES = "addTables()"
    self.UNABLE_TO_CREATE_USER = "Unable to Create User: "
    self.UNABLE_TO_CREATE_DATABASE = "Unable to Create Database: "
    self.UNABLE_TO_CREATE_TABLES = "Unable to Create Tables"
    self.ADD_TABLES_RESULTS_LABEL = "Add Table Results: "
end

function AbDatabaseManagement.new(...)
    local count = select("#", ...)
    if count == 1 then return AbDatabaseManagement._new1(...)
    elseif count == 1 then return AbDatabaseManagement._new1(...)
    end
end


function AbDatabaseManagement._new1(databaseConnectionInfoInterface)
    local self = setmetatable(AbSqlBean.new(databaseConnectionInfoInterface), AbDatabaseManagement)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbDatabaseManagement._new1(connectionInfo)
    local self = setmetatable(AbSqlBean.new(connectionInfo), AbDatabaseManagement)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbDatabaseManagement:getHostName()
        local try_ok, try_error = pcall(function()
            local addr = InetAddress.getLocalHost()
            return addr:getHostName()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.FAILED, self, self.GET_HOST_NAME, e)
            return nil
        end
end


-- throws Exception
function AbDatabaseManagement:addDbUser(hostName, db, userName, password)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.GRANT_ALL)
        stringBuffer:append(db)
        stringBuffer:append(self.DOT_STAR)
        stringBuffer:append(self.TO)
        stringBuffer:append(userName)
        stringBuffer:append(hostName)
        stringBuffer:append(self.IDENTIFIED_BY)
        stringBuffer:append(password)
        stringBuffer:append(self.WITH_GRANT_OPTION)
        local sqlStatement = tostring(stringBuffer)
        self.sqlCommandLog:append(sqlStatement)
        self.sqlCommandLog:append(self.commonSeps.NEW_LINE)
        AbSqlBean.executeSQLStatement(self, sqlStatement)
        return true
end


-- Java overloaded method: Lua keeps the last definition
function AbDatabaseManagement:addDbUser(db, userName, password)
        local try_ok, try_error = pcall(function()
            self:addDbUser(self.AT_LOCALHOST, db, userName, password)
            local hostName = self:getHostName()
            if hostName ~= nil then
                self:addDbUser(hostName, db, userName, password)
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.UNABLE_TO_CREATE_USER .. userName, self, self.METHOD_ADD_USER, e)
            return false
        end
end


function AbDatabaseManagement:addDb(db)
        local try_ok, try_error = pcall(function()
            local sqlStatement = tostring(self.sqlStrings.CREATE_DATABASE) .. db
            self.sqlCommandLog:append(sqlStatement)
            self.sqlCommandLog:append(self.commonSeps.NEW_LINE)
            AbSqlBean.executeSQLStatement(self, sqlStatement)
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.UNABLE_TO_CREATE_DATABASE .. db, self, self.METHOD_ADD_DB, e)
            return false
        end
end

return AbDatabaseManagement


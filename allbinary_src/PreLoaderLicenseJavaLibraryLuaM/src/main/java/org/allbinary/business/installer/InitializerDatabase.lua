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
-- package org.allbinary.business.installer

-- local HashMap = require("java.util.HashMap")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
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

local InitializerDatabase = {}
InitializerDatabase.__index = InitializerDatabase
InitializerDatabase.className = "InitializerDatabase"

function InitializerDatabase:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.adminDbUserName = nil
    self.adminDbPassword = nil
    self.adminJdbcDriver = nil
    self.adminSchema = nil
    self.adminServer = nil
    self.adminPort = nil
    self.initDb = nil
end

function InitializerDatabase.new(...)
    local count = select("#", ...)
    if count == 2 then return InitializerDatabase._new2(...)
    elseif count == 2 then return InitializerDatabase._new2(...)
    end
end


function InitializerDatabase._new2(abeClientInformation, map)
    local self = setmetatable({}, InitializerDatabase)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        local hashMap = StdUtil.getInstance():createHashMap()
        local keys = map:keySet()
        local keyArray = keys:toArray()
        local size = (keyArray.n or #keyArray)
        for index = 0, size - 1 do
            local key = keyArray[index + 1]
            local values = map:get(key)
            hashMap:put(tostring(key), tostring(values[1]))
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("key: ")
            stringBuffer:append(key)
            stringBuffer:append(" Value: ")
            stringBuffer:append(values[1])
            self.logUtil:putF(tostring(stringBuffer), self, "getFormData()")
        end
        self:getFormData(abeClientInformation, hashMap)
    return self
end


function InitializerDatabase._new2(abeClientInformation, initHashMap)
    local self = setmetatable({}, InitializerDatabase)
    self:_init_fields()
        self:getFormData(abeClientInformation, initHashMap)
    return self
end


function InitializerDatabase:getFormData(abeClientInformation, hashMap)
        local try_ok, try_error = pcall(function()
            local initializerData = InitializerData.getInstance()
            self:setAdminDbUserName(hashMap:get(initializerData.DBUSER))
            self:setAdminDbPassword(hashMap:get(initializerData.DBPASSWORD))
            self:setAdminJdbcDriver(hashMap:get(initializerData.ADMINJDBCDRIVER))
            self:setAdminSchema(hashMap:get(initializerData.ADMINSCHEMA))
            self:setAdminServer(hashMap:get(initializerData.ADMINSERVER))
            self:setAdminPort(hashMap:get(initializerData.ADMINPORT))
            local dbConnectionInfo = DbConnectionInfo.new()
            local adminDbName = StringUtil.getInstance().EMPTY_STRING
            dbConnectionInfo:setJdbcDriver(self:getAdminJdbcDriver())
            dbConnectionInfo:setName(adminDbName)
            dbConnectionInfo:setUserName(self:getAdminDbUserName())
            dbConnectionInfo:setPassword(self:getAdminDbPassword())
            dbConnectionInfo:setSchema(self:getAdminSchema())
            dbConnectionInfo:setServer(self:getAdminServer())
            dbConnectionInfo:setPort(self:getAdminPort())
            self.initDb = DynamicInitDb.new(abeClientInformation, dbConnectionInfo)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Unable to get form data", self, "getFormData()", e)
        end
end


function InitializerDatabase:isJdbcDriverValid(jdbcDriverClassPathString)
        local try_ok, try_error = pcall(function()
            Class.forName(jdbcDriverClassPathString):newInstance()
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRELOADERERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.IS_VALID, e)
            end
            return false
        end
end


function InitializerDatabase:isValid()
        local isValid = true
        if not self:isJdbcDriverValid(self.adminJdbcDriver) then
            isValid = false
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self.adminDbUserName, InitializerDatabase.MIN, InitializerDatabase.MAX) then
            isValid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.adminDbPassword, InitializerDatabase.MINPASSWORD, InitializerDatabase.MAX) then
            isValid = false
        end
        return isValid
end


function InitializerDatabase:getJdbcDriverValidationInfo(jdbcDriver)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("The JDBC driver (")
        stringBuffer:append(jdbcDriver)
        stringBuffer:append(") you have provided is not valid.<br/>")
        return tostring(stringBuffer)
end


function InitializerDatabase:getInvalidInfo()
        local isValid = true
        local isJdbcDriversValid = true
        local stringBuffer = StringMaker.new()
        if not self:isJdbcDriverValid(self.adminJdbcDriver) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self:getAdminJdbcDriver()))
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self.adminDbUserName, InitializerDatabase.MIN, InitializerDatabase.MAX) then
            stringBuffer:append("Admin username should be < " .. tostring(InitializerDatabase.MAX) .. " and > " .. tostring(InitializerDatabase.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidNotRequired(self.adminDbPassword, InitializerDatabase.MINPASSWORD, InitializerDatabase.MAX) then
            stringBuffer:append("Admin password should be < " .. tostring(InitializerDatabase.MAX) .. " and > " .. tostring(InitializerDatabase.MINPASSWORD) .. " characters in length.<br />")
        end
        if not isJdbcDriversValid then
            stringBuffer:append(InitializerData.getInstance():getJdbcDriverSolutionInfo())
        end
        return tostring(stringBuffer)
end


function InitializerDatabase:createUsers()
        local try_ok, try_error = pcall(function()
            self.initDb:addUsers()
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Unable to Create Users", self, "createUsers()", e)
            return false
        end
end


function InitializerDatabase:createDatabases()
        local try_ok, try_error = pcall(function()
            self.initDb:addDatabases()
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Unable to Create Databases", self, "createDatabases()", e)
            return false
        end
end


function InitializerDatabase:createTables()
        local try_ok, try_error = pcall(function()
            self.initDb:addTables()
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Unable to Create Tables", self, "createTables()", e)
            return false
        end
end


function InitializerDatabase:getAdminDbUserName()
        return self.adminDbUserName
end


function InitializerDatabase:setAdminDbUserName(adminDbUserName)
        self.adminDbUserName = adminDbUserName
end


function InitializerDatabase:getAdminDbPassword()
        return self.adminDbPassword
end


function InitializerDatabase:setAdminDbPassword(adminDbPassword)
        self.adminDbPassword = adminDbPassword
end


function InitializerDatabase:getAdminJdbcDriver()
        return self.adminJdbcDriver
end


function InitializerDatabase:setAdminJdbcDriver(adminJdbcDriver)
        self.adminJdbcDriver = adminJdbcDriver
end


function InitializerDatabase:getAdminSchema()
        return self.adminSchema
end


function InitializerDatabase:setAdminSchema(adminSchema)
        self.adminSchema = adminSchema
end


function InitializerDatabase:getAdminServer()
        return self.adminServer
end


function InitializerDatabase:setAdminServer(adminServer)
        self.adminServer = adminServer
end


function InitializerDatabase:getAdminPort()
        return self.adminPort
end


function InitializerDatabase:setAdminPort(adminPort)
        self.adminPort = adminPort
end

InitializerDatabase.MAXDB = 30
InitializerDatabase.MAX = 16
InitializerDatabase.MIN = 4
InitializerDatabase.MINPASSWORD = 0

return InitializerDatabase


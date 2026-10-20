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
local HistoryDbInitInfo = require("org.allbinary.business.init.db.HistoryDbInitInfo")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local LogDbInitInfo = require("org.allbinary.business.init.db.LogDbInitInfo")
local StaticPagesDbInitInfo = require("org.allbinary.business.init.db.StaticPagesDbInitInfo")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
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

local Initializer = {}
Initializer.__index = Initializer
Initializer.className = "Initializer"

function Initializer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userJdbcDriver = nil
    self.userName = nil
    self.userUserName = nil
    self.userPassword = nil
    self.userSchema = nil
    self.userServer = nil
    self.userPort = nil
    self.historyJdbcDriver = nil
    self.historyName = nil
    self.historyUserName = nil
    self.historyPassword = nil
    self.historySchema = nil
    self.historyServer = nil
    self.historyPort = nil
    self.logJdbcDriver = nil
    self.logName = nil
    self.logUserName = nil
    self.logPassword = nil
    self.logSchema = nil
    self.logServer = nil
    self.logPort = nil
    self.inventoryJdbcDriver = nil
    self.inventoryName = nil
    self.inventoryUserName = nil
    self.inventoryPassword = nil
    self.inventorySchema = nil
    self.inventoryServer = nil
    self.inventoryPort = nil
    self.staticPagesJdbcDriver = nil
    self.staticPagesName = nil
    self.staticPagesUserName = nil
    self.staticPagesPassword = nil
    self.staticPagesSchema = nil
    self.staticPagesServer = nil
    self.staticPagesPort = nil
end

function Initializer.new(...)
    local count = select("#", ...)
    if count == 1 then return Initializer._new1(...)
    elseif count == 1 then return Initializer._new1(...)
    end
end


function Initializer._new1(map)
    local self = setmetatable({}, Initializer)
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
        self:getFormData(hashMap)
    return self
end


function Initializer._new1(initHashMap)
    local self = setmetatable({}, Initializer)
    self:_init_fields()
        self:getFormData(initHashMap)
    return self
end


function Initializer:getFormData(hashMap)
        local try_ok, try_error = pcall(function()
            local initializerData = InitializerData.getInstance()
            self.userJdbcDriver = hashMap:get(initializerData.CUSTOMERJDBCDRIVER)
            self.userName = hashMap:get(initializerData.CUSTOMERNAME)
            self.userUserName = hashMap:get(initializerData.CUSTOMERUSERNAME)
            self.userPassword = hashMap:get(initializerData.CUSTOMERPASSWORD)
            self.userSchema = hashMap:get(initializerData.CUSTOMERSCHEMA)
            self.userServer = hashMap:get(initializerData.CUSTOMERSERVER)
            self.userPort = hashMap:get(initializerData.CUSTOMERPORT)
            self.historyJdbcDriver = hashMap:get(initializerData.HISTORYJDBCDRIVER)
            self.historyName = hashMap:get(initializerData.HISTORYNAME)
            self.historyUserName = hashMap:get(initializerData.HISTORYUSERNAME)
            self.historyPassword = hashMap:get(initializerData.HISTORYPASSWORD)
            self.historySchema = hashMap:get(initializerData.HISTORYSCHEMA)
            self.historyServer = hashMap:get(initializerData.HISTORYSERVER)
            self.historyPort = hashMap:get(initializerData.HISTORYPORT)
            self.logJdbcDriver = hashMap:get(initializerData.LOGJDBCDRIVER)
            self.logName = hashMap:get(initializerData.LOGNAME)
            self.logUserName = hashMap:get(initializerData.LOGUSERNAME)
            self.logPassword = hashMap:get(initializerData.LOGPASSWORD)
            self.logSchema = hashMap:get(initializerData.LOGSCHEMA)
            self.logServer = hashMap:get(initializerData.LOGSERVER)
            self.logPort = hashMap:get(initializerData.LOGPORT)
            self.inventoryJdbcDriver = hashMap:get(initializerData.INVENTORYJDBCDRIVER)
            self.inventoryName = hashMap:get(initializerData.INVENTORYNAME)
            self.inventoryUserName = hashMap:get(initializerData.INVENTORYUSERNAME)
            self.inventoryPassword = hashMap:get(initializerData.INVENTORYPASSWORD)
            self.inventorySchema = hashMap:get(initializerData.INVENTORYSCHEMA)
            self.inventoryServer = hashMap:get(initializerData.INVENTORYSERVER)
            self.inventoryPort = hashMap:get(initializerData.INVENTORYPORT)
            self.staticPagesJdbcDriver = hashMap:get(initializerData.STATICPAGESJDBCDRIVER)
            self.staticPagesName = hashMap:get(initializerData.STATICPAGESNAME)
            self.staticPagesUserName = hashMap:get(initializerData.STATICPAGESUSERNAME)
            self.staticPagesPassword = hashMap:get(initializerData.STATICPAGESPASSWORD)
            self.staticPagesSchema = hashMap:get(initializerData.STATICPAGESSCHEMA)
            self.staticPagesServer = hashMap:get(initializerData.STATICPAGESSERVER)
            self.staticPagesPort = hashMap:get(initializerData.STATICPAGESPORT)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Unable to get form data", self, "getFormData()", e)
        end
end


function Initializer:isJdbcDriverValid(jdbcDriverClassPathString)
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


function Initializer:isValid()
        local isValid = true
        if not self:isJdbcDriverValid(self.userJdbcDriver) then
            isValid = false
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self.userName, Initializer.MIN, Initializer.MAXDB) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.userUserName, Initializer.MIN, Initializer.MAX) then
            isValid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.userPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            isValid = false
        end
        if not self:isJdbcDriverValid(self.historyJdbcDriver) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.historyName, Initializer.MIN, Initializer.MAXDB) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.historyUserName, Initializer.MIN, Initializer.MAX) then
            isValid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.historyPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            isValid = false
        end
        if not self:isJdbcDriverValid(self.logJdbcDriver) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.logName, Initializer.MIN, Initializer.MAXDB) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.logUserName, Initializer.MIN, Initializer.MAX) then
            isValid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.logPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            isValid = false
        end
        if not self:isJdbcDriverValid(self.inventoryJdbcDriver) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.inventoryName, Initializer.MIN, Initializer.MAXDB) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.inventoryUserName, Initializer.MIN, Initializer.MAX) then
            isValid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.inventoryPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            isValid = false
        end
        if not self:isJdbcDriverValid(self.staticPagesJdbcDriver) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.staticPagesName, Initializer.MIN, Initializer.MAXDB) then
            isValid = false
        end
        if not stringValidationUtil:isValidRequired(self.staticPagesUserName, Initializer.MIN, Initializer.MAX) then
            isValid = false
        end
        if not stringValidationUtil:isValidNotRequired(self.staticPagesPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            isValid = false
        end
        return isValid
end


function Initializer:getJdbcDriverValidationInfo(jdbcDriver)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("The JDBC driver (")
        stringBuffer:append(jdbcDriver)
        stringBuffer:append(") you have provided is not valid.<br/>")
        return tostring(stringBuffer)
end


function Initializer:getJdbcDriverSolutionInfo()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("The following describes the possible problems and solutions regarding the Jdbc Driver error(s):<p/>")
        stringBuffer:append("1. A JDBC driver you specified is not in your classpath.<br/>")
        stringBuffer:append("Solution 1: Move the JDBC driver into any directory specified in the existing classpath. <br/>")
        stringBuffer:append("Solution 2: Add the directory that contains the JDBC driver to the classpath.<br/>")
        stringBuffer:append("Solution 3: Add the JDBC driver to the WEB-INF/lib directory where you installed this webapp.<br/>")
        stringBuffer:append("2. The JDBC driver you specified does not exit.<br/>")
        stringBuffer:append("Solution: Get a JDBC driver. <br/>")
        stringBuffer:append("3. The JDBC driver you specified is not valid.<br/>")
        stringBuffer:append("Solution: Use a valid JDBC driver.<p/>")
        return tostring(stringBuffer)
end


function Initializer:getInvalidInfo()
        local isJdbcDriversValid = true
        local stringBuffer = StringMaker.new()
        if not self:isJdbcDriverValid(self.userJdbcDriver) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.userJdbcDriver))
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self.userName, Initializer.MIN, Initializer.MAXDB) then
            stringBuffer:append("User db name should be < " .. tostring(Initializer.MAXDB) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidRequired(self.userUserName, Initializer.MIN, Initializer.MAX) then
            stringBuffer:append("User db username should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidNotRequired(self.userPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            stringBuffer:append("User DB password should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MINPASSWORD) .. " characters in length.<br />")
        end
        if not self:isJdbcDriverValid(self.historyJdbcDriver) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.historyJdbcDriver))
        end
        if not stringValidationUtil:isValidRequired(self.historyName, Initializer.MIN, Initializer.MAXDB) then
            stringBuffer:append("History db should be < " .. tostring(Initializer.MAXDB) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidRequired(self.historyUserName, Initializer.MIN, Initializer.MAX) then
            stringBuffer:append("History db username should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidNotRequired(self.historyPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            stringBuffer:append("History db password should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MINPASSWORD) .. " characters in length.<br />")
        end
        if not self:isJdbcDriverValid(self.logJdbcDriver) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.logJdbcDriver))
        end
        if not stringValidationUtil:isValidRequired(self.logName, Initializer.MIN, Initializer.MAXDB) then
            stringBuffer:append("Log db should be < " .. tostring(Initializer.MAXDB) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidRequired(self.logUserName, Initializer.MIN, Initializer.MAX) then
            stringBuffer:append("Log db username should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidNotRequired(self.logPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            stringBuffer:append("Log db password should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MINPASSWORD) .. " characters in length.<br />")
        end
        if not self:isJdbcDriverValid(self.inventoryJdbcDriver) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.inventoryJdbcDriver))
        end
        if not stringValidationUtil:isValidRequired(self.inventoryName, Initializer.MIN, Initializer.MAXDB) then
            stringBuffer:append("Inventory db should be < " .. tostring(Initializer.MAXDB) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidRequired(self.inventoryUserName, Initializer.MIN, Initializer.MAX) then
            stringBuffer:append("Inventory db username should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidNotRequired(self.inventoryPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            stringBuffer:append("Inventory DB password should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MINPASSWORD) .. " characters in length.<br />")
        end
        if not self:isJdbcDriverValid(self.staticPagesJdbcDriver) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.staticPagesJdbcDriver))
        end
        if not stringValidationUtil:isValidRequired(self.staticPagesName, Initializer.MIN, Initializer.MAXDB) then
            stringBuffer:append("Static Pages db should be < " .. tostring(Initializer.MAXDB) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidRequired(self.staticPagesUserName, Initializer.MIN, Initializer.MAX) then
            stringBuffer:append("Static Pages db username should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MIN) .. " characters in length.<br />")
        end
        if not stringValidationUtil:isValidNotRequired(self.staticPagesPassword, Initializer.MINPASSWORD, Initializer.MAX) then
            stringBuffer:append("Static Pages DB password should be < " .. tostring(Initializer.MAX) .. " and > " .. tostring(Initializer.MINPASSWORD) .. " characters in length.<br />")
        end
        if not isJdbcDriversValid then
            stringBuffer:append(self:getJdbcDriverSolutionInfo())
        end
        return tostring(stringBuffer)
end


-- throws Exception
function Initializer:set()
        self.logUtil:putF("Creating DB connection files", self, "set()")
        local userDbInitInfo = UserDbInitInfo.new(false)
        userDbInitInfo:setJdbcDriver(self.userJdbcDriver)
        userDbInitInfo:setName(self.userName)
        userDbInitInfo:setUserName(self.userUserName)
        userDbInitInfo:setPassword(self.userPassword)
        userDbInitInfo:setSchema(self.userSchema)
        userDbInitInfo:setServer(self.userServer)
        userDbInitInfo:setPort(self.userPort)
        userDbInitInfo:setHasRead(true)
        userDbInitInfo:write()
        local historyDbInitInfo = HistoryDbInitInfo.new(false)
        historyDbInitInfo:setJdbcDriver(self.historyJdbcDriver)
        historyDbInitInfo:setName(self.historyName)
        historyDbInitInfo:setUserName(self.historyUserName)
        historyDbInitInfo:setPassword(self.historyPassword)
        historyDbInitInfo:setSchema(self.historySchema)
        historyDbInitInfo:setServer(self.historyServer)
        historyDbInitInfo:setPort(self.historyPort)
        historyDbInitInfo:setHasRead(true)
        historyDbInitInfo:write()
        local logDbInitInfo = LogDbInitInfo.new(false)
        logDbInitInfo:setJdbcDriver(self.logJdbcDriver)
        logDbInitInfo:setName(self.logName)
        logDbInitInfo:setUserName(self.logUserName)
        logDbInitInfo:setPassword(self.logPassword)
        logDbInitInfo:setSchema(self.logSchema)
        logDbInitInfo:setServer(self.logServer)
        logDbInitInfo:setPort(self.logPort)
        logDbInitInfo:setHasRead(true)
        logDbInitInfo:write()
        local staticPagesDbInitInfo = StaticPagesDbInitInfo.new(false)
        staticPagesDbInitInfo:setJdbcDriver(self.staticPagesJdbcDriver)
        staticPagesDbInitInfo:setName(self.staticPagesName)
        staticPagesDbInitInfo:setUserName(self.staticPagesUserName)
        staticPagesDbInitInfo:setPassword(self.staticPagesPassword)
        staticPagesDbInitInfo:setSchema(self.staticPagesSchema)
        staticPagesDbInitInfo:setServer(self.staticPagesServer)
        staticPagesDbInitInfo:setPort(self.staticPagesPort)
        staticPagesDbInitInfo:setHasRead(true)
        staticPagesDbInitInfo:write()
        local inventoryDbInitInfo = InventoryDbInitInfo.new(false)
        inventoryDbInitInfo:setJdbcDriver(self.inventoryJdbcDriver)
        inventoryDbInitInfo:setName(self.inventoryName)
        inventoryDbInitInfo:setUserName(self.inventoryUserName)
        inventoryDbInitInfo:setPassword(self.inventoryPassword)
        inventoryDbInitInfo:setSchema(self.inventorySchema)
        inventoryDbInitInfo:setServer(self.inventoryServer)
        inventoryDbInitInfo:setPort(self.inventoryPort)
        inventoryDbInitInfo:setHasRead(true)
        inventoryDbInitInfo:write()
        self.logUtil:putF("Created DB connection files", self, "set()")
end

Initializer.MAXDB = 30
Initializer.MAX = 16
Initializer.MIN = 4
Initializer.MINPASSWORD = 0

return Initializer


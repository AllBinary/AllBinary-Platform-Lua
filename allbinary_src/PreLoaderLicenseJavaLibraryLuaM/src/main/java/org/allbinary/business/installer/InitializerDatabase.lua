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

local InitializerDatabase = {}
package.loaded["org.allbinary.business.installer.InitializerDatabase"] = InitializerDatabase

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
local DatabaseConnectionInfoInterface = java_lazy("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local DynamicInitDb = java_lazy("org.allbinary.business.installer.DynamicInitDb")
local InitializerData = java_lazy("org.allbinary.business.installer.InitializerData")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InitializerDatabase is declared before the requires
InitializerDatabase.__index = InitializerDatabase
InitializerDatabase.className = "InitializerDatabase"
InitializerDatabase.javaClassName = "org.allbinary.business.installer.InitializerDatabase"

function InitializerDatabase:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.adminDbUserName == nil then self.adminDbUserName = nil end
    if self.adminDbPassword == nil then self.adminDbPassword = nil end
    if self.adminJdbcDriver == nil then self.adminJdbcDriver = nil end
    if self.adminSchema == nil then self.adminSchema = nil end
    if self.adminServer == nil then self.adminServer = nil end
    if self.adminPort == nil then self.adminPort = nil end
    if self.initDb == nil then self.initDb = nil end
end

function InitializerDatabase._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return InitializerDatabase._new2(self, ...)
    end
    error("No constructor of InitializerDatabase takes " .. count .. " arguments")
end

function InitializerDatabase.new(...)
    local self = setmetatable({}, InitializerDatabase)
    InitializerDatabase._jinit(self, ...)
    return self
end

function InitializerDatabase._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or java_is(java_a2, "Map")) then return InitializerDatabase._new2_1(self, ...) end
    return InitializerDatabase._new2_2(self, ...)
end


function InitializerDatabase._new2_1(self, abeClientInformation, map)
    InitializerDatabase._init_fields(self)
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


function InitializerDatabase._new2_2(self, abeClientInformation, initHashMap)
    InitializerDatabase._init_fields(self)
        self:getFormData(abeClientInformation, initHashMap)
    return self
end


function InitializerDatabase:getFormData(abeClientInformation, hashMap)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Unable to get form data", self, "getFormData()", e)
        end
end


function InitializerDatabase:isJdbcDriverValid(jdbcDriverClassPathString)
        local try_ok, try_error, try_value = pcall(function()
            require((jdbcDriverClassPathString)):newInstance()
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitializerDatabase:isValid()
        local isValid = true
        if not (self:isJdbcDriverValid(self.adminJdbcDriver)) then
            isValid = false
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not (stringValidationUtil:isValidRequired(self.adminDbUserName, InitializerDatabase.MIN, InitializerDatabase.MAX)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidNotRequired(self.adminDbPassword, InitializerDatabase.MINPASSWORD, InitializerDatabase.MAX)) then
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
        if not (self:isJdbcDriverValid(self.adminJdbcDriver)) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self:getAdminJdbcDriver()))
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not (stringValidationUtil:isValidRequired(self.adminDbUserName, InitializerDatabase.MIN, InitializerDatabase.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Admin username should be < ") .. require("allbinary_java").to_string(InitializerDatabase.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(InitializerDatabase.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidNotRequired(self.adminDbPassword, InitializerDatabase.MINPASSWORD, InitializerDatabase.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Admin password should be < ") .. require("allbinary_java").to_string(InitializerDatabase.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(InitializerDatabase.MINPASSWORD)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (isJdbcDriversValid) then
            stringBuffer:append(InitializerData.getInstance():getJdbcDriverSolutionInfo())
        end
        return tostring(stringBuffer)
end


function InitializerDatabase:createUsers()
        local try_ok, try_error, try_value = pcall(function()
            self.initDb:addUsers()
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Unable to Create Users", self, "createUsers()", e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitializerDatabase:createDatabases()
        local try_ok, try_error, try_value = pcall(function()
            self.initDb:addDatabases()
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Unable to Create Databases", self, "createDatabases()", e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitializerDatabase:createTables()
        local try_ok, try_error, try_value = pcall(function()
            self.initDb:addTables()
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Unable to Create Tables", self, "createTables()", e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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


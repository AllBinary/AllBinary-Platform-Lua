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

local Initializer = {}
package.loaded["org.allbinary.business.installer.Initializer"] = Initializer

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
local HistoryDbInitInfo = java_lazy("org.allbinary.business.init.db.HistoryDbInitInfo")
local InventoryDbInitInfo = java_lazy("org.allbinary.business.init.db.InventoryDbInitInfo")
local LogDbInitInfo = java_lazy("org.allbinary.business.init.db.LogDbInitInfo")
local StaticPagesDbInitInfo = java_lazy("org.allbinary.business.init.db.StaticPagesDbInitInfo")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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

-- class table Initializer is declared before the requires
Initializer.__index = Initializer
Initializer.className = "Initializer"
Initializer.javaClassName = "org.allbinary.business.installer.Initializer"

function Initializer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.userJdbcDriver == nil then self.userJdbcDriver = nil end
    if self.userName == nil then self.userName = nil end
    if self.userUserName == nil then self.userUserName = nil end
    if self.userPassword == nil then self.userPassword = nil end
    if self.userSchema == nil then self.userSchema = nil end
    if self.userServer == nil then self.userServer = nil end
    if self.userPort == nil then self.userPort = nil end
    if self.historyJdbcDriver == nil then self.historyJdbcDriver = nil end
    if self.historyName == nil then self.historyName = nil end
    if self.historyUserName == nil then self.historyUserName = nil end
    if self.historyPassword == nil then self.historyPassword = nil end
    if self.historySchema == nil then self.historySchema = nil end
    if self.historyServer == nil then self.historyServer = nil end
    if self.historyPort == nil then self.historyPort = nil end
    if self.logJdbcDriver == nil then self.logJdbcDriver = nil end
    if self.logName == nil then self.logName = nil end
    if self.logUserName == nil then self.logUserName = nil end
    if self.logPassword == nil then self.logPassword = nil end
    if self.logSchema == nil then self.logSchema = nil end
    if self.logServer == nil then self.logServer = nil end
    if self.logPort == nil then self.logPort = nil end
    if self.inventoryJdbcDriver == nil then self.inventoryJdbcDriver = nil end
    if self.inventoryName == nil then self.inventoryName = nil end
    if self.inventoryUserName == nil then self.inventoryUserName = nil end
    if self.inventoryPassword == nil then self.inventoryPassword = nil end
    if self.inventorySchema == nil then self.inventorySchema = nil end
    if self.inventoryServer == nil then self.inventoryServer = nil end
    if self.inventoryPort == nil then self.inventoryPort = nil end
    if self.staticPagesJdbcDriver == nil then self.staticPagesJdbcDriver = nil end
    if self.staticPagesName == nil then self.staticPagesName = nil end
    if self.staticPagesUserName == nil then self.staticPagesUserName = nil end
    if self.staticPagesPassword == nil then self.staticPagesPassword = nil end
    if self.staticPagesSchema == nil then self.staticPagesSchema = nil end
    if self.staticPagesServer == nil then self.staticPagesServer = nil end
    if self.staticPagesPort == nil then self.staticPagesPort = nil end
end

function Initializer._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Initializer._new1(self, ...)
    end
    error("No constructor of Initializer takes " .. count .. " arguments")
end

function Initializer.new(...)
    local self = setmetatable({}, Initializer)
    Initializer._jinit(self, ...)
    return self
end

function Initializer._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Map")) then return Initializer._new1_1(self, ...) end
    return Initializer._new1_2(self, ...)
end


function Initializer._new1_1(self, map)
    Initializer._init_fields(self)
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


function Initializer._new1_2(self, initHashMap)
    Initializer._init_fields(self)
        self:getFormData(initHashMap)
    return self
end


function Initializer:getFormData(hashMap)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Unable to get form data", self, "getFormData()", e)
        end
end


function Initializer:isJdbcDriverValid(jdbcDriverClassPathString)
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


function Initializer:isValid()
        local isValid = true
        if not (self:isJdbcDriverValid(self.userJdbcDriver)) then
            isValid = false
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not (stringValidationUtil:isValidRequired(self.userName, Initializer.MIN, Initializer.MAXDB)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.userUserName, Initializer.MIN, Initializer.MAX)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidNotRequired(self.userPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            isValid = false
        end
        if not (self:isJdbcDriverValid(self.historyJdbcDriver)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.historyName, Initializer.MIN, Initializer.MAXDB)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.historyUserName, Initializer.MIN, Initializer.MAX)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidNotRequired(self.historyPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            isValid = false
        end
        if not (self:isJdbcDriverValid(self.logJdbcDriver)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.logName, Initializer.MIN, Initializer.MAXDB)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.logUserName, Initializer.MIN, Initializer.MAX)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidNotRequired(self.logPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            isValid = false
        end
        if not (self:isJdbcDriverValid(self.inventoryJdbcDriver)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.inventoryName, Initializer.MIN, Initializer.MAXDB)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.inventoryUserName, Initializer.MIN, Initializer.MAX)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidNotRequired(self.inventoryPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            isValid = false
        end
        if not (self:isJdbcDriverValid(self.staticPagesJdbcDriver)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.staticPagesName, Initializer.MIN, Initializer.MAXDB)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidRequired(self.staticPagesUserName, Initializer.MIN, Initializer.MAX)) then
            isValid = false
        end
        if not (stringValidationUtil:isValidNotRequired(self.staticPagesPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
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
        if not (self:isJdbcDriverValid(self.userJdbcDriver)) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.userJdbcDriver))
        end
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not (stringValidationUtil:isValidRequired(self.userName, Initializer.MIN, Initializer.MAXDB)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("User db name should be < ") .. require("allbinary_java").to_string(Initializer.MAXDB)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidRequired(self.userUserName, Initializer.MIN, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("User db username should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidNotRequired(self.userPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("User DB password should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MINPASSWORD)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (self:isJdbcDriverValid(self.historyJdbcDriver)) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.historyJdbcDriver))
        end
        if not (stringValidationUtil:isValidRequired(self.historyName, Initializer.MIN, Initializer.MAXDB)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("History db should be < ") .. require("allbinary_java").to_string(Initializer.MAXDB)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidRequired(self.historyUserName, Initializer.MIN, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("History db username should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidNotRequired(self.historyPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("History db password should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MINPASSWORD)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (self:isJdbcDriverValid(self.logJdbcDriver)) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.logJdbcDriver))
        end
        if not (stringValidationUtil:isValidRequired(self.logName, Initializer.MIN, Initializer.MAXDB)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Log db should be < ") .. require("allbinary_java").to_string(Initializer.MAXDB)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidRequired(self.logUserName, Initializer.MIN, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Log db username should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidNotRequired(self.logPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Log db password should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MINPASSWORD)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (self:isJdbcDriverValid(self.inventoryJdbcDriver)) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.inventoryJdbcDriver))
        end
        if not (stringValidationUtil:isValidRequired(self.inventoryName, Initializer.MIN, Initializer.MAXDB)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Inventory db should be < ") .. require("allbinary_java").to_string(Initializer.MAXDB)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidRequired(self.inventoryUserName, Initializer.MIN, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Inventory db username should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidNotRequired(self.inventoryPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Inventory DB password should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MINPASSWORD)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (self:isJdbcDriverValid(self.staticPagesJdbcDriver)) then
            isJdbcDriversValid = false
            stringBuffer:append(self:getJdbcDriverValidationInfo(self.staticPagesJdbcDriver))
        end
        if not (stringValidationUtil:isValidRequired(self.staticPagesName, Initializer.MIN, Initializer.MAXDB)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Static Pages db should be < ") .. require("allbinary_java").to_string(Initializer.MAXDB)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidRequired(self.staticPagesUserName, Initializer.MIN, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Static Pages db username should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MIN)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (stringValidationUtil:isValidNotRequired(self.staticPagesPassword, Initializer.MINPASSWORD, Initializer.MAX)) then
            stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Static Pages DB password should be < ") .. require("allbinary_java").to_string(Initializer.MAX)) .. require("allbinary_java").to_string(" and > ")) .. require("allbinary_java").to_string(Initializer.MINPASSWORD)) .. require("allbinary_java").to_string(" characters in length.<br />"))
        end
        if not (isJdbcDriversValid) then
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


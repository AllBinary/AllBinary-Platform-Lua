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

local InitializerData = {}
package.loaded["org.allbinary.business.installer.InitializerData"] = InitializerData

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table InitializerData is declared before the requires
InitializerData.__index = InitializerData
InitializerData.className = "InitializerData"
InitializerData.javaClassName = "org.allbinary.business.installer.InitializerData"

function InitializerData:_init_fields()
    self.DBUSER = "DBUSER"
    self.DBPASSWORD = "DBPASSWORD"
    self.ADMINJDBCDRIVER = "ADMIN_JDBCDRIVER"
    self.ADMINSCHEMA = "ADMINSCHEMA"
    self.ADMINSERVER = "ADMINSERVER"
    self.ADMINPORT = "ADMINPORT"
    self.CUSTOMERJDBCDRIVER = "CUSTOMER_JDBCDRIVER"
    self.CUSTOMERNAME = "CUSTOMERNAME"
    self.CUSTOMERUSERNAME = "CUSTOMERUSERNAME"
    self.CUSTOMERPASSWORD = "CUSTOMERPASSWORD"
    self.CUSTOMERSCHEMA = "CUSTOMERSCHEMA"
    self.CUSTOMERSERVER = "CUSTOMERSERVER"
    self.CUSTOMERPORT = "CUSTOMERPORT"
    self.HISTORYJDBCDRIVER = "HISTORY_JDBCDRIVER"
    self.HISTORYNAME = "HISTORYNAME"
    self.HISTORYUSERNAME = "HISTORYUSERNAME"
    self.HISTORYPASSWORD = "HISTORYPASSWORD"
    self.HISTORYSCHEMA = "HISTORYSCHEMA"
    self.HISTORYSERVER = "HISTORYSERVER"
    self.HISTORYPORT = "HISTORYPORT"
    self.LOGJDBCDRIVER = "LOG_JDBCDRIVER"
    self.LOGNAME = "LOGNAME"
    self.LOGUSERNAME = "LOGUSERNAME"
    self.LOGPASSWORD = "LOGPASSWORD"
    self.LOGSCHEMA = "LOGSCHEMA"
    self.LOGSERVER = "LOGSERVER"
    self.LOGPORT = "LOGPORT"
    self.INVENTORYJDBCDRIVER = "INVENTORY_JDBCDRIVER"
    self.INVENTORYNAME = "INVENTORYNAME"
    self.INVENTORYUSERNAME = "INVENTORYUSERNAME"
    self.INVENTORYPASSWORD = "INVENTORYPASSWORD"
    self.INVENTORYSCHEMA = "INVENTORYSCHEMA"
    self.INVENTORYSERVER = "INVENTORYSERVER"
    self.INVENTORYPORT = "INVENTORYPORT"
    self.STATICPAGESJDBCDRIVER = "STATICPAGES_JDBCDRIVER"
    self.STATICPAGESNAME = "STATICPAGESNAME"
    self.STATICPAGESUSERNAME = "STATICPAGESUSERNAME"
    self.STATICPAGESPASSWORD = "STATICPAGESPASSWORD"
    self.STATICPAGESSCHEMA = "STATICPAGESSCHEMA"
    self.STATICPAGESSERVER = "STATICPAGESSERVER"
    self.STATICPAGESPORT = "STATICPAGESPORT"
end

function InitializerData._jinit(self)
    InitializerData._init_fields(self)
    return self
end

function InitializerData.new()
    return InitializerData._jinit(setmetatable({}, InitializerData))
end


function InitializerData.getInstance()
        return InitializerData.instance_f
end


function InitializerData:getJdbcDriverSolutionInfo()
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

InitializerData.instance_f = InitializerData.new()

return InitializerData


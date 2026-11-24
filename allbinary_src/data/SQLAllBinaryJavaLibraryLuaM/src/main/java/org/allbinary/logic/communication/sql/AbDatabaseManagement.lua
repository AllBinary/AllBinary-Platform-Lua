-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.sql

local AbDatabaseManagement = {}
package.loaded["org.allbinary.logic.communication.sql.AbDatabaseManagement"] = AbDatabaseManagement

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

-- local InetAddress = require("java.net.InetAddress")
local DatabaseConnectionInfoInterface = java_lazy("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table AbDatabaseManagement is declared before the requires
AbDatabaseManagement.__index = AbDatabaseManagement
AbDatabaseManagement.className = "AbDatabaseManagement"
AbDatabaseManagement.javaClassName = "org.allbinary.logic.communication.sql.AbDatabaseManagement"
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

function AbDatabaseManagement._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return AbDatabaseManagement._new1(self, ...)
    end
    error("No constructor of AbDatabaseManagement takes " .. count .. " arguments")
end

function AbDatabaseManagement.new(...)
    local self = setmetatable({}, AbDatabaseManagement)
    AbDatabaseManagement._jinit(self, ...)
    return self
end

function AbDatabaseManagement._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "DatabaseConnectionInfoInterface")) then return AbDatabaseManagement._new1_1(self, ...) end
    return AbDatabaseManagement._new1_2(self, ...)
end


function AbDatabaseManagement._new1_1(self, databaseConnectionInfoInterface)
    java_super_init(AbSqlBean, self, databaseConnectionInfoInterface)
    AbDatabaseManagement._init_fields(self)
        -- super(...) made self above
    return self
end


function AbDatabaseManagement._new1_2(self, connectionInfo)
    java_super_init(AbSqlBean, self, connectionInfo)
    AbDatabaseManagement._init_fields(self)
        -- super(...) made self above
    return self
end


function AbDatabaseManagement:getHostName()
        local try_ok, try_error, try_value = pcall(function()
            local addr = InetAddress.getLocalHost()
            do return "__jreturn", addr:getHostName() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.FAILED, self, self.GET_HOST_NAME, e)
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbDatabaseManagement, "getHostName", 0)


-- throws Exception
function AbDatabaseManagement:addDbUser_j4(hostName, db, userName, password)
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
        java_super(AbSqlBean, "executeSQLStatement", 1)(self, sqlStatement)
        return true
end


function AbDatabaseManagement:addDbUser_j3(db, userName, password)
        local try_ok, try_error, try_value = pcall(function()
            self:addDbUser(self.AT_LOCALHOST, db, userName, password)
            local hostName = self:getHostName()
            if hostName ~= nil then
                self:addDbUser(hostName, db, userName, password)
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.UNABLE_TO_CREATE_USER .. userName, self, self.METHOD_ADD_USER, e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbDatabaseManagement:addDbUser(...)
    local count = select("#", ...)
    if count == 4 then return self:addDbUser_j4(...) end
    if count == 3 then return self:addDbUser_j3(...) end
    error("No method addDbUser takes " .. count .. " arguments")
end
AbDatabaseManagement.addDbUser__jdispatcher = AbDatabaseManagement.addDbUser


function AbDatabaseManagement:addDb(db)
        local try_ok, try_error, try_value = pcall(function()
            local sqlStatement = tostring(self.sqlStrings.CREATE_DATABASE) .. db
            self.sqlCommandLog:append(sqlStatement)
            self.sqlCommandLog:append(self.commonSeps.NEW_LINE)
            java_super(AbSqlBean, "executeSQLStatement", 1)(self, sqlStatement)
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.UNABLE_TO_CREATE_DATABASE .. db, self, self.METHOD_ADD_DB, e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbDatabaseManagement, "addDb", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)

return AbDatabaseManagement


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

local InitDb = {}
package.loaded["org.allbinary.business.installer.InitDb"] = InitDb

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

-- local Method = require("java.lang.reflect.Method")
local DbConnectionInfo = java_lazy("org.allbinary.business.init.db.DbConnectionInfo")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")

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

--Warning you must have sql root access
-- class table InitDb is declared before the requires
InitDb.__index = InitDb
InitDb.className = "InitDb"
InitDb.javaClassName = "org.allbinary.business.installer.InitDb"

function InitDb:_init_fields()
    if self.anyType == nil then self.anyType = nil end
    self.METHOD_CALL_GET_HOST_NAME = "getHostName"
    self.METHOD_CALL_ADD_USERS = "addUsers"
    self.METHOD_CALL_ADD_DATABASES = "addDatabases"
    self.METHOD_CALL_ADD_TABLES = "addTables"
    self.METHOD_CALL_TEMP_MAIN_PATH = "useTemporaryMainPath"
    self.METHOD_CALL_MAIN_PATH = "useNormalMainPath"
end

function InitDb._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return InitDb._new0(self, ...)
    elseif count == 1 then return InitDb._new1(self, ...)
    end
    error("No constructor of InitDb takes " .. count .. " arguments")
end

function InitDb.new(...)
    local self = setmetatable({}, InitDb)
    InitDb._jinit(self, ...)
    return self
end


function InitDb._new0(self)
    InitDb._init_fields(self)
    return self
end


function InitDb._new1(self, dbConnectionInfo)
    InitDb._init_fields(self)
    return self
end


function InitDb:setHelper(anyType)
        self.anyType = anyType
end


function InitDb:getHelper()
        return self.anyType
end


function InitDb:getHostName()
        local try_ok, try_error, try_value = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_GET_HOST_NAME, nil)
            local result = method:invoke(self.anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitDb:addUsers()
        local try_ok, try_error, try_value = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_ADD_USERS, nil)
            local result = method:invoke(self.anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitDb:addDatabases()
        local try_ok, try_error, try_value = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_ADD_DATABASES, nil)
            local result = method:invoke(self.anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitDb:addTables()
        local try_ok, try_error, try_value = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_ADD_TABLES, nil)
            local result = method:invoke(self.anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitDb:useTemporaryMainPath()
        local try_ok, try_error, try_value = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_TEMP_MAIN_PATH, nil)
            local result = method:invoke(self.anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function InitDb:useNormalMainPath()
        local try_ok, try_error, try_value = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_MAIN_PATH, nil)
            local result = method:invoke(self.anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return InitDb


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

-- local Method = require("java.lang.reflect.Method")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Warning you must have sql root access
local InitDb = {}
InitDb.__index = InitDb
InitDb.className = "InitDb"

function InitDb:_init_fields()
    self.anyType = nil
    self.METHOD_CALL_GET_HOST_NAME = "getHostName"
    self.METHOD_CALL_ADD_USERS = "addUsers"
    self.METHOD_CALL_ADD_DATABASES = "addDatabases"
    self.METHOD_CALL_ADD_TABLES = "addTables"
    self.METHOD_CALL_TEMP_MAIN_PATH = "useTemporaryMainPath"
    self.METHOD_CALL_MAIN_PATH = "useNormalMainPath"
end

function InitDb.new(...)
    local count = select("#", ...)
    if count == 0 then return InitDb._new0(...)
    elseif count == 1 then return InitDb._new1(...)
    end
end


function InitDb._new0()
    local self = setmetatable({}, InitDb)
    self:_init_fields()
    return self
end


function InitDb._new1(dbConnectionInfo)
    local self = setmetatable({}, InitDb)
    self:_init_fields()
    return self
end


function InitDb:setHelper(anyType)
        self.anyType = anyType
end


function InitDb:getHelper()
        return self.anyType
end


function InitDb:getHostName()
        local try_ok, try_error = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_GET_HOST_NAME, nil)
            local result = method:invoke(self.anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            return nil
        end
end


function InitDb:addUsers()
        local try_ok, try_error = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_ADD_USERS, nil)
            local result = method:invoke(self.anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function InitDb:addDatabases()
        local try_ok, try_error = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_ADD_DATABASES, nil)
            local result = method:invoke(self.anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function InitDb:addTables()
        local try_ok, try_error = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_ADD_TABLES, nil)
            local result = method:invoke(self.anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function InitDb:useTemporaryMainPath()
        local try_ok, try_error = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_TEMP_MAIN_PATH, nil)
            local result = method:invoke(self.anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function InitDb:useNormalMainPath()
        local try_ok, try_error = pcall(function()
            local dynamicClass = getmetatable(self.anyType)
            local method = dynamicClass:getMethod(self.METHOD_CALL_MAIN_PATH, nil)
            local result = method:invoke(self.anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end

return InitDb


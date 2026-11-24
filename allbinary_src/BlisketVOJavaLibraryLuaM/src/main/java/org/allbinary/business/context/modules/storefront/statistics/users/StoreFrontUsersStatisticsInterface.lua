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
-- package org.allbinary.business.context.modules.storefront.statistics.users

local StoreFrontUsersStatisticsInterface = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface"] = StoreFrontUsersStatisticsInterface

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

local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")

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

--import org.allbinary.business.user.commerce.money.Money;
-- Java interface
-- class table StoreFrontUsersStatisticsInterface is declared before the requires
StoreFrontUsersStatisticsInterface.__index = StoreFrontUsersStatisticsInterface
StoreFrontUsersStatisticsInterface.className = "StoreFrontUsersStatisticsInterface"
StoreFrontUsersStatisticsInterface.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface"
setmetatable(StoreFrontUsersStatisticsInterface, {__index = TableMappingInterface})
StoreFrontUsersStatisticsInterface.java_interfaces = function() return {TableMappingInterface} end


function StoreFrontUsersStatisticsInterface:getNumberOfUsers()
    error("abstract method getNumberOfUsers")
end


function StoreFrontUsersStatisticsInterface:getNumberOfUsersByRole(role)
    error("abstract method getNumberOfUsersByRole")
end

return StoreFrontUsersStatisticsInterface


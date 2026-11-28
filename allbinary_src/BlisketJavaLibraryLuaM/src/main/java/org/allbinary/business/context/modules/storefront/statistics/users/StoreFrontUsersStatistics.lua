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

local StoreFrontUsersStatistics = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatistics"] = StoreFrontUsersStatistics

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
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserEntityFactory = java_lazy("org.allbinary.data.tables.user.UserEntityFactory")
local UserEntityInterface = java_lazy("org.allbinary.data.tables.user.UserEntityInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StoreFrontUsersStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")
local StoreFrontUsersStatisticsData = java_lazy("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsData")

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

-- class table StoreFrontUsersStatistics is declared before the requires
StoreFrontUsersStatistics.__index = StoreFrontUsersStatistics
StoreFrontUsersStatistics.className = "StoreFrontUsersStatistics"
StoreFrontUsersStatistics.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatistics"
StoreFrontUsersStatistics.java_implements = " StoreFrontUsersStatisticsInterface "
StoreFrontUsersStatistics.java_interfaces = function() return {StoreFrontUsersStatisticsInterface} end

function StoreFrontUsersStatistics:_init_fields()
    if self.totalNumberOfUsers == nil then self.totalNumberOfUsers = nil end
    if self.totalUsersByRoleHashMap == nil then self.totalUsersByRoleHashMap = nil end
end


function StoreFrontUsersStatistics._jinit(self, storeFrontInterface)
    StoreFrontUsersStatistics._init_fields(self)
        self.totalUsersByRoleHashMap = StdUtil.getInstance():createHashMap()
        local userEntityInterface = UserEntityFactory.getInstance()
        local userVector = userEntityInterface:getCustomers()
        self.totalNumberOfUsers = userVector:size()
        local size = userVector:size()
        for index = 0, size - 1 do
            local userInterface = userVector:get(index)
            local nextUserRole = userInterface:getRole()
            local currentNumberOfUsersForRole = self:getNewTotal(nextUserRole)
            self.totalUsersByRoleHashMap:put(nextUserRole, currentNumberOfUsersForRole)
        end
    return self
end

function StoreFrontUsersStatistics.new(...)
    local self = setmetatable({}, StoreFrontUsersStatistics)
    StoreFrontUsersStatistics._jinit(self, ...)
    return self
end


function StoreFrontUsersStatistics:getNewTotal(userRole)
        local numberOfUsersForRoleLong = self.totalUsersByRoleHashMap:get(userRole)
        if rawequal(numberOfUsersForRoleLong, nil) then
            numberOfUsersForRoleLong = 0
        end
        return require("allbinary_java").number_value(numberOfUsersForRoleLong, "longValue") + 1
end


function StoreFrontUsersStatistics:getNumberOfUsers()
        return self.totalNumberOfUsers
end


function StoreFrontUsersStatistics:getNumberOfUsersByRole(role)
        local totalForRole = self.totalUsersByRoleHashMap:get(role)
        return totalForRole
end


function StoreFrontUsersStatistics:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(StoreFrontUsersStatisticsData.getInstance().NUMBEROFUSERS, tostring(self:getNumberOfUsers()))
        local setOfUserRoles = self.totalUsersByRoleHashMap:keySet()
        local nextUserRole = nil
        local userRoleArray = setOfUserRoles:toArray()
        local size = (userRoleArray.n or #userRoleArray)
        for index = 0, size - 1 do
            nextUserRole = userRoleArray[index + 1]
            local totalForRole = self.totalUsersByRoleHashMap:get(nextUserRole)
            hashMap:put(tostring(nextUserRole), tostring(totalForRole))
        end
        return hashMap
end


function StoreFrontUsersStatistics:toVector()
        return nil
end


function StoreFrontUsersStatistics:getKey()
        return nil
end

return StoreFrontUsersStatistics


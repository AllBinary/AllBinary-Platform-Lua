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

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local UserEntityInterface = require("org.allbinary.data.tables.user.UserEntityInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StoreFrontUsersStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontUsersStatistics = {}
StoreFrontUsersStatistics.__index = StoreFrontUsersStatistics
StoreFrontUsersStatistics.className = "StoreFrontUsersStatistics"

function StoreFrontUsersStatistics:_init_fields()
    self.totalNumberOfUsers = nil
    self.totalUsersByRoleHashMap = nil
end


function StoreFrontUsersStatistics.new(storeFrontInterface)
    local self = setmetatable({}, StoreFrontUsersStatistics)
    self:_init_fields()
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


function StoreFrontUsersStatistics:getNewTotal(userRole)
        local numberOfUsersForRoleLong = self.totalUsersByRoleHashMap:get(userRole)
        if numberOfUsersForRoleLong == nil then
            numberOfUsersForRoleLong = 0
        end
        return math.tointeger(numberOfUsersForRoleLong // 1) + 1
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


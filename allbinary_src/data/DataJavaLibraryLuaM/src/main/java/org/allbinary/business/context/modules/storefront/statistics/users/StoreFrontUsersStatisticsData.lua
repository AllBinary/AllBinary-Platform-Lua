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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontUsersStatisticsData = {}
StoreFrontUsersStatisticsData.__index = StoreFrontUsersStatisticsData
StoreFrontUsersStatisticsData.className = "StoreFrontUsersStatisticsData"

function StoreFrontUsersStatisticsData:_init_fields()
    self.NAME = "STOREFRONT_USERS_STATISTICS_NAME"
    self.NUMBEROFUSERS = "STOREFRONT_USERS_STATISTICS_NUMBER_OF_USERS"
end


function StoreFrontUsersStatisticsData.new()
    local self = setmetatable({}, StoreFrontUsersStatisticsData)
    self:_init_fields()
    return self
end


function StoreFrontUsersStatisticsData.getInstance()
        return StoreFrontUsersStatisticsData.instance
end

StoreFrontUsersStatisticsData.instance = StoreFrontUsersStatisticsData.new()

return StoreFrontUsersStatisticsData


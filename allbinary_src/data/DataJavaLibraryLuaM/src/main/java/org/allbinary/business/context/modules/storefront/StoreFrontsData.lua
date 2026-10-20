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
-- package org.allbinary.business.context.modules.storefront


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontsData = {}
StoreFrontsData.__index = StoreFrontsData
StoreFrontsData.className = "StoreFrontsData"

function StoreFrontsData:_init_fields()
    self.TYPE = "STOREFRONTS_TYPE"
    self.RETAIL = "STOREFRONTS_RETAIL"
    self.SUBSCRIPTION = "STOREFRONTS_SUBSCRIPTION"
    self.AUCTION = "STOREFRONTS_AUCTION"
    self.NEWS = "STOREFRONTS_NEWS"
    self.BLOG = "STOREFRONTS_BLOG"
    self.FORUM = "STOREFRONTS_FORUM"
end

function StoreFrontsData.new()
    local self = setmetatable({}, StoreFrontsData)
    self:_init_fields()
    return self
end


function StoreFrontsData.getInstance()
        return StoreFrontsData.instance
end

StoreFrontsData.instance = StoreFrontsData.new()

return StoreFrontsData


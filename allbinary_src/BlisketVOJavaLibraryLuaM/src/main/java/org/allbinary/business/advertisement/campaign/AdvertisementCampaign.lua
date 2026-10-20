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
-- package org.allbinary.business.advertisement.campaign

-- local HashMap = require("java.util.HashMap")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local AdvertisementsInterface = require("org.allbinary.business.advertisement.AdvertisementsInterface")
local AdvertisementSearchInterface = require("org.allbinary.business.advertisement.search.AdvertisementSearchInterface")
local AdvertisementCampaignInterface = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementCampaign = {}
AdvertisementCampaign.__index = AdvertisementCampaign
AdvertisementCampaign.className = "AdvertisementCampaign"

function AdvertisementCampaign:_init_fields()
    self.hashMap = nil
end


function AdvertisementCampaign.new(hashMap)
    local self = setmetatable({}, AdvertisementCampaign)
    self:_init_fields()
        self.hashMap = hashMap
    return self
end


function AdvertisementCampaign:getComponent()
        return nil
end


function AdvertisementCampaign:getName()
        return self.hashMap:get(AdvertisementCampaignData.getInstance().NAME)
end


function AdvertisementCampaign:setComponentName(name)
        self.hashMap:put(DynamicObjectData.NAME, name)
end


function AdvertisementCampaign:setName(name)
        self.hashMap:put(AdvertisementCampaignData.getInstance().NAME, name)
end


function AdvertisementCampaign:search(advertisementSearchInterface)
        return nil
end

return AdvertisementCampaign


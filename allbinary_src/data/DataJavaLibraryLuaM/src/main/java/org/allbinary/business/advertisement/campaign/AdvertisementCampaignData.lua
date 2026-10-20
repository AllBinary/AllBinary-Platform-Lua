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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementCampaignData = {}
AdvertisementCampaignData.__index = AdvertisementCampaignData
AdvertisementCampaignData.className = "AdvertisementCampaignData"

function AdvertisementCampaignData:_init_fields()
    self.NAME = "ADVERTISEMENTCAMPAIGN_NAME"
    self.DESCRIPTION = "ADVERTISEMENTCAMPAIGN_DESCRIPTION"
    self.CONFIG = "ADVERTISEMENTCAMPAIGN_CONFIG"
end


function AdvertisementCampaignData.getInstance()
        return AdvertisementCampaignData.instance
end


function AdvertisementCampaignData.new()
    local self = setmetatable({}, AdvertisementCampaignData)
    self:_init_fields()
    return self
end

AdvertisementCampaignData.instance = AdvertisementCampaignData.new()

return AdvertisementCampaignData


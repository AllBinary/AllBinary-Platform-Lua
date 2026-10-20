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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AdvertisementInterface = require("org.allbinary.business.advertisement.AdvertisementInterface")
local AdvertisementsInterface = require("org.allbinary.business.advertisement.AdvertisementsInterface")
local AdvertisementSearchInterface = require("org.allbinary.business.advertisement.search.AdvertisementSearchInterface")
local AdvertisementCampaignsInterface = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementCampaigns = {}
AdvertisementCampaigns.__index = AdvertisementCampaigns
AdvertisementCampaigns.className = "AdvertisementCampaigns"

function AdvertisementCampaigns:_init_fields()
    self.advertisementsVector = nil
end


function AdvertisementCampaigns.new(vector)
    local self = setmetatable({}, AdvertisementCampaigns)
    self:_init_fields()
        self.advertisementsVector = self.advertisementsVector
    return self
end


function AdvertisementCampaigns:add(advertisementInterface)
        self.advertisementsVector:add(advertisementInterface)
end


function AdvertisementCampaigns:get(index)
        return self.advertisementsVector:get(index)
end


function AdvertisementCampaigns:size()
        return self.advertisementsVector:size()
end


function AdvertisementCampaigns:isEnabled()
        return true
end


function AdvertisementCampaigns:search(advertisementSearchInterface)
        return nil
end

return AdvertisementCampaigns


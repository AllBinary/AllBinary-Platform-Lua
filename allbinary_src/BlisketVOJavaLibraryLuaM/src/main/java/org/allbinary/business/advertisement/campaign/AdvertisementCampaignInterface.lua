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

local AdvertisementsInterface = require("org.allbinary.business.advertisement.AdvertisementsInterface")
local AdvertisementSearchInterface = require("org.allbinary.business.advertisement.search.AdvertisementSearchInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local AdvertisementCampaignInterface = {}
AdvertisementCampaignInterface.__index = AdvertisementCampaignInterface
AdvertisementCampaignInterface.className = "AdvertisementCampaignInterface"


function AdvertisementCampaignInterface:getName()
    error("abstract method getName")
end


function AdvertisementCampaignInterface:getComponent()
    error("abstract method getComponent")
end


function AdvertisementCampaignInterface:setName(name)
    error("abstract method setName")
end


function AdvertisementCampaignInterface:setComponentName(name)
    error("abstract method setComponentName")
end


function AdvertisementCampaignInterface:search(advertisementSearchInterface)
    error("abstract method search")
end

return AdvertisementCampaignInterface


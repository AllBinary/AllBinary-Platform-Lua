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
-- package org.allbinary.data.tables.advertisement.campaign.internal

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementCampaignInternalEntityFactory = {}
AdvertisementCampaignInternalEntityFactory.__index = AdvertisementCampaignInternalEntityFactory
AdvertisementCampaignInternalEntityFactory.className = "AdvertisementCampaignInternalEntityFactory"


function AdvertisementCampaignInternalEntityFactory.new()
    local self = setmetatable({}, AdvertisementCampaignInternalEntityFactory)
    return self
end


function AdvertisementCampaignInternalEntityFactory.getInstance()
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            return AdvertisementCampaignInternalEntity.new()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, "AdvertisementCampaignEntityFactory", commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

AdvertisementCampaignInternalEntityFactory.CLASSNAME = "org.allbinary.data.tables.AdvertisementCampaignEntity"

return AdvertisementCampaignInternalEntityFactory


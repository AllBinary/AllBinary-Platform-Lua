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
-- package org.allbinary.business.advertisement.area

-- local HashMap = require("java.util.HashMap")
local AdvertisementCampaignData = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignData")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local Document = require("org.w3c.dom.Document")
local AdvertisementAreaInterface = require("org.allbinary.business.advertisement.area.AdvertisementAreaInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementArea = {}
AdvertisementArea.__index = AdvertisementArea
AdvertisementArea.className = "AdvertisementArea"

function AdvertisementArea:_init_fields()
    self.name = nil
    self.storeName = nil
    self.description = nil
    self.advertisementAreaConstraintsInterface = nil
    self.campaign = nil
end


function AdvertisementArea.new(hashMap)
    local self = setmetatable({}, AdvertisementArea)
    self:_init_fields()
        self.name = hashMap:get(AdvertisementAreaData.getInstance().NAME)
        self.storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        self.description = hashMap:get(AdvertisementAreaData.getInstance().DESCRIPTION)
        local constraintsDomString = hashMap:get(AdvertisementAreaData.getInstance().CONSTRAINTS)
        local document = DomDocumentHelper.create(constraintsDomString)
        self.advertisementAreaConstraintsInterface = AdvertisementAreaConstraints.new(document)
        self.campaign = hashMap:get(AdvertisementCampaignData.getInstance().NAME)
    return self
end


function AdvertisementArea:getName()
        return self.name
end


function AdvertisementArea:getStoreName()
        return self.storeName
end


function AdvertisementArea:getDescription()
        return self.description
end


function AdvertisementArea:getConstraints()
        return self.advertisementAreaConstraintsInterface
end


function AdvertisementArea:getCampaign()
        return self.campaign
end


function AdvertisementArea:setName(name)
        self.name = name
end


function AdvertisementArea:setStoreName(storeName)
        self.storeName = storeName
end


function AdvertisementArea:setDescription(description)
        self.description = description
end


function AdvertisementArea:setConstraints(advertisementConstraintsInterface)
        self.advertisementAreaConstraintsInterface = self.advertisementAreaConstraintsInterface
end


function AdvertisementArea:setCampaign(campaign)
        self.campaign = campaign
end

return AdvertisementArea


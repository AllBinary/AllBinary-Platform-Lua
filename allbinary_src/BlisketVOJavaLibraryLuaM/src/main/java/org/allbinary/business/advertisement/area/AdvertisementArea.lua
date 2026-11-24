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

local AdvertisementArea = {}
package.loaded["org.allbinary.business.advertisement.area.AdvertisementArea"] = AdvertisementArea

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
local AdvertisementCampaignData = java_lazy("org.allbinary.business.advertisement.campaign.AdvertisementCampaignData")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local Document = java_lazy("org.w3c.dom.Document")
local AdvertisementAreaInterface = require("org.allbinary.business.advertisement.area.AdvertisementAreaInterface")
local AdvertisementAreaConstraints = java_lazy("org.allbinary.business.advertisement.area.AdvertisementAreaConstraints")
local AdvertisementAreaConstraintsInterface = java_lazy("org.allbinary.business.advertisement.area.AdvertisementAreaConstraintsInterface")

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

-- class table AdvertisementArea is declared before the requires
AdvertisementArea.__index = AdvertisementArea
AdvertisementArea.className = "AdvertisementArea"
AdvertisementArea.javaClassName = "org.allbinary.business.advertisement.area.AdvertisementArea"
AdvertisementArea.java_implements = " AdvertisementAreaInterface "
AdvertisementArea.java_interfaces = function() return {AdvertisementAreaInterface} end

function AdvertisementArea:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.description == nil then self.description = nil end
    if self.advertisementAreaConstraintsInterface == nil then self.advertisementAreaConstraintsInterface = nil end
    if self.campaign == nil then self.campaign = nil end
end


function AdvertisementArea._jinit(self, hashMap)
    AdvertisementArea._init_fields(self)
        self.name_f = hashMap:get(AdvertisementAreaData.getInstance().NAME)
        self.storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        self.description = hashMap:get(AdvertisementAreaData.getInstance().DESCRIPTION)
        local constraintsDomString = hashMap:get(AdvertisementAreaData.getInstance().CONSTRAINTS)
        local document = DomDocumentHelper.create(constraintsDomString)
        self.advertisementAreaConstraintsInterface = AdvertisementAreaConstraints.new(document)
        self.campaign = hashMap:get(AdvertisementCampaignData.getInstance().NAME)
    return self
end

function AdvertisementArea.new(...)
    local self = setmetatable({}, AdvertisementArea)
    AdvertisementArea._jinit(self, ...)
    return self
end


function AdvertisementArea:getName()
        return self.name_f
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
        self.name_f = name
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


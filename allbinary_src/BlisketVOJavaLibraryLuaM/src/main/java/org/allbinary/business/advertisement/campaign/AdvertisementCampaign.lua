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

local AdvertisementCampaign = {}
package.loaded["org.allbinary.business.advertisement.campaign.AdvertisementCampaign"] = AdvertisementCampaign

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
local DynamicObjectData = java_lazy("org.allbinary.business.DynamicObjectData")
local AdvertisementsInterface = java_lazy("org.allbinary.business.advertisement.AdvertisementsInterface")
local AdvertisementSearchInterface = java_lazy("org.allbinary.business.advertisement.search.AdvertisementSearchInterface")
local AdvertisementCampaignInterface = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignInterface")

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

-- class table AdvertisementCampaign is declared before the requires
AdvertisementCampaign.__index = AdvertisementCampaign
AdvertisementCampaign.className = "AdvertisementCampaign"
AdvertisementCampaign.javaClassName = "org.allbinary.business.advertisement.campaign.AdvertisementCampaign"
AdvertisementCampaign.java_implements = " AdvertisementCampaignInterface "
AdvertisementCampaign.java_interfaces = function() return {AdvertisementCampaignInterface} end

function AdvertisementCampaign:_init_fields()
    if self.hashMap == nil then self.hashMap = nil end
end


function AdvertisementCampaign._jinit(self, hashMap)
    AdvertisementCampaign._init_fields(self)
        self.hashMap = hashMap
    return self
end

function AdvertisementCampaign.new(...)
    local self = setmetatable({}, AdvertisementCampaign)
    AdvertisementCampaign._jinit(self, ...)
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


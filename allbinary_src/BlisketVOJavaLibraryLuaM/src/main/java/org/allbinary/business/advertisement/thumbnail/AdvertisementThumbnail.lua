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
-- package org.allbinary.business.advertisement.thumbnail

local TwoDimensionalConstraintInterface = require("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")
local AdvertisementThumbnailInterface = require("org.allbinary.business.advertisement.thumbnail.AdvertisementThumbnailInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementThumbnail = {}
AdvertisementThumbnail.__index = AdvertisementThumbnail
AdvertisementThumbnail.className = "AdvertisementThumbnail"

function AdvertisementThumbnail:_init_fields()
    self.imageFileName = nil
    self.imageUrl = nil
    self.constraint = nil
end


function AdvertisementThumbnail.new()
    local self = setmetatable({}, AdvertisementThumbnail)
    self:_init_fields()
    return self
end


function AdvertisementThumbnail:getFileName()
        return self.imageFileName
end


function AdvertisementThumbnail:getUrl()
        return self.imageUrl
end


function AdvertisementThumbnail:getTwoDimensionalConstraint()
        return self.constraint
end

return AdvertisementThumbnail


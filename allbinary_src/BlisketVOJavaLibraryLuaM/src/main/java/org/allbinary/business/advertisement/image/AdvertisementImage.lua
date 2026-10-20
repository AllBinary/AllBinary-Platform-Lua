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
-- package org.allbinary.business.advertisement.image

local TwoDimensionalConstraintInterface = require("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")
local AdvertisementImageInterface = require("org.allbinary.business.advertisement.image.AdvertisementImageInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementImage = {}
AdvertisementImage.__index = AdvertisementImage
AdvertisementImage.className = "AdvertisementImage"

function AdvertisementImage:_init_fields()
    self.imageFileName = nil
    self.imageUrl = nil
    self.constraint = nil
end


function AdvertisementImage.new()
    local self = setmetatable({}, AdvertisementImage)
    self:_init_fields()
    return self
end


function AdvertisementImage:getFileName()
        return self.imageFileName
end


function AdvertisementImage:getUrl()
        return self.imageUrl
end


function AdvertisementImage:getTwoDimensionalConstraint()
        return self.constraint
end

return AdvertisementImage


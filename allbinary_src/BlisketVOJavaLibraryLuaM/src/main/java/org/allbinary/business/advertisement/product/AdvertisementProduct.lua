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
-- package org.allbinary.business.advertisement.product

local TwoDimensionalConstraintInterface = require("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")
local AdvertisementProductInterface = require("org.allbinary.business.advertisement.product.AdvertisementProductInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementProduct = {}
AdvertisementProduct.__index = AdvertisementProduct
AdvertisementProduct.className = "AdvertisementProduct"

function AdvertisementProduct:_init_fields()
    self.type = nil
    self.link = nil
    self.number = 0
    self.constraint = nil
end


function AdvertisementProduct.new()
    local self = setmetatable({}, AdvertisementProduct)
    self:_init_fields()
    return self
end


function AdvertisementProduct:getType()
        return self.type
end


function AdvertisementProduct:getLink()
        return self.link
end


function AdvertisementProduct:getNumber()
        return self.number
end


function AdvertisementProduct:getTwoDimensionalConstraint()
        return self.constraint
end

return AdvertisementProduct


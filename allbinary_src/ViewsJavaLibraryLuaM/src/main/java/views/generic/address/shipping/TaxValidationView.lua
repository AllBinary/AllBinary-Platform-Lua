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
-- package views.generic.address.shipping

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local ShippingAddressesEntity = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ShippingAddressView = require("views.generic.address.shipping.ShippingAddressView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TaxValidationView = {}
TaxValidationView.__index = TaxValidationView
TaxValidationView.className = "TaxValidationView"
setmetatable(TaxValidationView, {__index = ShippingAddressView})


function TaxValidationView.new(transformInfoInterface)
    local self = setmetatable(ShippingAddressView.new(transformInfoInterface), TaxValidationView)
        -- super(...) made self above
    return self
end


function TaxValidationView:isValid()
        local billingAddressesEntity = ShippingAddressesEntity.new(self:getWeblisketSession():getUserName())
        local streetAddressList = billingAddressesEntity:get()
        if streetAddressList == nil then
            return false
        end
        local size = streetAddressList:size()
        for index = 0, size - 1 do
            local aStreetAddress = streetAddressList:get(index)
            if aStreetAddress:getName():compareTo(ShippingAddressData.TAX) == 0 then
                self.streetAddress = aStreetAddress
                return true
            end
        end
        return false
end


function TaxValidationView:validationInfo()
        return StringUtil.getInstance().EMPTY_STRING
end


function TaxValidationView:toValidationInfoDoc()
        return nil
end


function TaxValidationView:toValidationInfoNode(document)
        return nil
end

return TaxValidationView


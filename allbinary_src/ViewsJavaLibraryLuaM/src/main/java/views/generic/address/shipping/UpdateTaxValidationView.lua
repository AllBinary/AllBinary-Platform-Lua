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
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local TaxFactory = require("org.allbinary.business.user.commerce.money.tax.TaxFactory")
local ShippingAddressesEntity = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
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

local UpdateTaxValidationView = {}
UpdateTaxValidationView.__index = UpdateTaxValidationView
UpdateTaxValidationView.className = "UpdateTaxValidationView"
setmetatable(UpdateTaxValidationView, {__index = ShippingAddressView})


function UpdateTaxValidationView.new(transformInfoInterface)
    local self = setmetatable(ShippingAddressView.new(transformInfoInterface), UpdateTaxValidationView)
        -- super(...) made self above
    return self
end


-- throws Exception
function UpdateTaxValidationView:isValid()
        self.streetAddress = StreetAddress.new(self:getRequest())
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getTransformInfoInterface():getStoreName())
        if TaxFactory.getInstance():getInstance(self.abeClientInformation, storeFrontInterface):isValid(self.streetAddress, storeFrontInterface) == false then
            return false
        end
        local billingAddressesEntity = ShippingAddressesEntity.new(self:getWeblisketSession():getUserName())
        local streetAddressList = billingAddressesEntity:get()
        if streetAddressList == nil then
            return false
        end
        local count = 0
        local size = streetAddressList:size()
        for index = 0, size - 1 do
            local aStreetAddress = streetAddressList:get(index)
            if aStreetAddress:getName():compareTo(ShippingAddressData.TAX) == 0 then
                count = count + 1
            end
        end
        if count ~= 1 then
            return false
        end
        return true
end


function UpdateTaxValidationView:validationInfo()
        return "Unable to update tax location."
end


function UpdateTaxValidationView:toValidationInfoDoc()
        return nil
end


function UpdateTaxValidationView:toValidationInfoNode(document)
        return nil
end

return UpdateTaxValidationView


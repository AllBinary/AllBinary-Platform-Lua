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

local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local ShippingAddressesEntity = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
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

local EditValidationView = {}
EditValidationView.__index = EditValidationView
EditValidationView.className = "EditValidationView"
setmetatable(EditValidationView, {__index = ShippingAddressView})

function EditValidationView:_init_fields()
    self.value = nil
end


function EditValidationView.new(transformInfoInterface)
    local self = setmetatable(ShippingAddressView.new(transformInfoInterface), EditValidationView)
    self:_init_fields()
        -- super(...) made self above
        local httpTransformInfoInterface = self:getTransformInfoInterface()
        self.value = httpTransformInfoInterface:getPageContext():getRequest():getParameter(StreetAddressData.ID)
    return self
end


function EditValidationView:isValid()
        if self:getWeblisketSession():getUserName() ~= nil then
            return false
        end
        local billingAddressesEntity = ShippingAddressesEntity.new(self:getWeblisketSession():getUserName())
        self.streetAddress = billingAddressesEntity:get(self.value)
        if self.streetAddress == nil then
            return false
        end
        return self.streetAddress:isValid()
end


function EditValidationView:validationInfo()
        return self.streetAddress:validationInfo()
end


function EditValidationView:toValidationInfoDoc()
        return nil
end


function EditValidationView:toValidationInfoNode(document)
        return nil
end

return EditValidationView


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
-- package org.allbinary.logic.visual.transform.info


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicViewData = {}
BasicViewData.__index = BasicViewData
BasicViewData.className = "BasicViewData"

function BasicViewData:_init_fields()
    self.GENERICDIR = "generic/"
    self.USERDIR = self.GENERICDIR .. "user/"
    self.ADDRESSDIR = self.USERDIR .. "address/"
    self.BILLINGADDRESSDIR = self.ADDRESSDIR .. "billing/"
    self.SHIPPINGADDRESSDIR = self.ADDRESSDIR .. "shipping/"
    self.COMMERCEDIR = self.USERDIR .. "commerce/"
    self.INVENTORYDIR = self.COMMERCEDIR .. "inventory/"
    self.BASKETDIR = self.INVENTORYDIR .. "basket/"
    self.ITEMDIR = self.INVENTORYDIR .. "item/"
    self.MONEYDIR = self.COMMERCEDIR .. "money/"
    self.SHIPPINGDIR = self.COMMERCEDIR .. "shipping/"
    self.ORDERDIR = self.INVENTORYDIR .. "order/"
    self.ORDEREMAILDIR = self.ORDERDIR .. "email/"
    self.ORDERHISTORYDIR = self.ORDERDIR .. "history/"
    self.ORDERREVIEWDIR = self.ORDERDIR .. "review/"
    self.PAYMENTDIR = self.MONEYDIR .. "payment/"
    self.GENERATIONDIR = self.GENERICDIR .. "generation/"
    self.PRODUCTSDIR = self.GENERICDIR .. "products/"
    self.IGNOREXMLXSL = self.GENERICDIR .. "ignoreXmlView.xsl"
    self.REVIEWORDERVIEWXSL = self.ORDERREVIEWDIR .. "reviewOrderView.xsl"
    self.ORDERVIEWXSL = self.REVIEWORDERVIEWXSL
    self.INVENTORYXSL = self.INVENTORYDIR .. "inventory.xsl"
    self.BASKETXSL = self.BASKETDIR .. "basket.xsl"
    self.CHECKOUTBASKETXSL = self.BASKETDIR .. "staticBasket.xsl"
    self.MINIBASKETXSL = self.BASKETDIR .. "miniBasket.xsl"
    self.BILLINGADDRESSCHANGEFORMXSL = self.BILLINGADDRESSDIR .. "billingAddressChangeForm.xsl"
    self.BILLINGADDRESSINPUTFORMXSL = self.BILLINGADDRESSDIR .. "billingAddressInputForm.xsl"
    self.BILLINGADDRESSVIEWXSL = self.BILLINGADDRESSDIR .. "billingAddressView.xsl"
    self.SHIPPINGADDRESSCHANGEFORMXSL = self.SHIPPINGADDRESSDIR .. "shippingAddressChangeForm.xsl"
    self.SHIPPINGADDRESSINPUTFORMXSL = self.SHIPPINGADDRESSDIR .. "shippingAddressInputForm.xsl"
    self.SHIPPINGADDRESSVIEWXSL = self.SHIPPINGADDRESSDIR .. "shippingAddressView.xsl"
    self.NEWTAXADDRESSXSL = self.SHIPPINGADDRESSDIR .. "newTaxAddressView.xsl"
    self.EDITTAXADDRESSXSL = self.SHIPPINGADDRESSDIR .. "editTaxAddressView.xsl"
    self.SHIPPINGMETHODSXSL = self.SHIPPINGDIR .. "shippingMethods.xsl"
    self.ORDERCUSTOMEREMAILVIEWXSL = self.ORDEREMAILDIR .. "orderCustomerEmailView.xsl"
    self.ORDERMANAGEREMAILVIEWXSL = self.ORDEREMAILDIR .. "orderManagerEmailView.xsl"
    self.EDITCUSTOMERXSL = self.USERDIR .. "editCustomerInputForm.xsl"
    self.ORDERHISTORYXSL = self.ORDERHISTORYDIR .. "orderHistory.xsl"
    self.PAYMENTVIEWXSL = self.PAYMENTDIR .. "paymentView.xsl"
    self.SUMMARYXSL = self.ITEMDIR .. "summary/summary.xsl"
    self.PAYMENTGATEWAYOPTIONSXSL = self.PAYMENTDIR .. "paymentGatewayOptions.xsl"
    self.MAKEPAYMENTVIEWXSL = self.PAYMENTDIR .. "invoice/" .. "makePayment.xsl"
end


function BasicViewData.getInstance()
        return BasicViewData.instance
end


function BasicViewData.new()
    local self = setmetatable({}, BasicViewData)
    self:_init_fields()
    return self
end

BasicViewData.instance = BasicViewData.new()

return BasicViewData


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

local BasicViewData = {}
package.loaded["org.allbinary.logic.visual.transform.info.BasicViewData"] = BasicViewData

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

-- class table BasicViewData is declared before the requires
BasicViewData.__index = BasicViewData
BasicViewData.className = "BasicViewData"
BasicViewData.javaClassName = "org.allbinary.logic.visual.transform.info.BasicViewData"

function BasicViewData:_init_fields()
    self.GENERICDIR = "generic/"
    self.USERDIR = require("allbinary_java").to_string(self.GENERICDIR) .. require("allbinary_java").to_string("user/")
    self.ADDRESSDIR = require("allbinary_java").to_string(self.USERDIR) .. require("allbinary_java").to_string("address/")
    self.BILLINGADDRESSDIR = require("allbinary_java").to_string(self.ADDRESSDIR) .. require("allbinary_java").to_string("billing/")
    self.SHIPPINGADDRESSDIR = require("allbinary_java").to_string(self.ADDRESSDIR) .. require("allbinary_java").to_string("shipping/")
    self.COMMERCEDIR = require("allbinary_java").to_string(self.USERDIR) .. require("allbinary_java").to_string("commerce/")
    self.INVENTORYDIR = require("allbinary_java").to_string(self.COMMERCEDIR) .. require("allbinary_java").to_string("inventory/")
    self.BASKETDIR = require("allbinary_java").to_string(self.INVENTORYDIR) .. require("allbinary_java").to_string("basket/")
    self.ITEMDIR = require("allbinary_java").to_string(self.INVENTORYDIR) .. require("allbinary_java").to_string("item/")
    self.MONEYDIR = require("allbinary_java").to_string(self.COMMERCEDIR) .. require("allbinary_java").to_string("money/")
    self.SHIPPINGDIR = require("allbinary_java").to_string(self.COMMERCEDIR) .. require("allbinary_java").to_string("shipping/")
    self.ORDERDIR = require("allbinary_java").to_string(self.INVENTORYDIR) .. require("allbinary_java").to_string("order/")
    self.ORDEREMAILDIR = require("allbinary_java").to_string(self.ORDERDIR) .. require("allbinary_java").to_string("email/")
    self.ORDERHISTORYDIR = require("allbinary_java").to_string(self.ORDERDIR) .. require("allbinary_java").to_string("history/")
    self.ORDERREVIEWDIR = require("allbinary_java").to_string(self.ORDERDIR) .. require("allbinary_java").to_string("review/")
    self.PAYMENTDIR = require("allbinary_java").to_string(self.MONEYDIR) .. require("allbinary_java").to_string("payment/")
    self.GENERATIONDIR = require("allbinary_java").to_string(self.GENERICDIR) .. require("allbinary_java").to_string("generation/")
    self.PRODUCTSDIR = require("allbinary_java").to_string(self.GENERICDIR) .. require("allbinary_java").to_string("products/")
    self.IGNOREXMLXSL = require("allbinary_java").to_string(self.GENERICDIR) .. require("allbinary_java").to_string("ignoreXmlView.xsl")
    self.REVIEWORDERVIEWXSL = require("allbinary_java").to_string(self.ORDERREVIEWDIR) .. require("allbinary_java").to_string("reviewOrderView.xsl")
    self.ORDERVIEWXSL = self.REVIEWORDERVIEWXSL
    self.INVENTORYXSL = require("allbinary_java").to_string(self.INVENTORYDIR) .. require("allbinary_java").to_string("inventory.xsl")
    self.BASKETXSL = require("allbinary_java").to_string(self.BASKETDIR) .. require("allbinary_java").to_string("basket.xsl")
    self.CHECKOUTBASKETXSL = require("allbinary_java").to_string(self.BASKETDIR) .. require("allbinary_java").to_string("staticBasket.xsl")
    self.MINIBASKETXSL = require("allbinary_java").to_string(self.BASKETDIR) .. require("allbinary_java").to_string("miniBasket.xsl")
    self.BILLINGADDRESSCHANGEFORMXSL = require("allbinary_java").to_string(self.BILLINGADDRESSDIR) .. require("allbinary_java").to_string("billingAddressChangeForm.xsl")
    self.BILLINGADDRESSINPUTFORMXSL = require("allbinary_java").to_string(self.BILLINGADDRESSDIR) .. require("allbinary_java").to_string("billingAddressInputForm.xsl")
    self.BILLINGADDRESSVIEWXSL = require("allbinary_java").to_string(self.BILLINGADDRESSDIR) .. require("allbinary_java").to_string("billingAddressView.xsl")
    self.SHIPPINGADDRESSCHANGEFORMXSL = require("allbinary_java").to_string(self.SHIPPINGADDRESSDIR) .. require("allbinary_java").to_string("shippingAddressChangeForm.xsl")
    self.SHIPPINGADDRESSINPUTFORMXSL = require("allbinary_java").to_string(self.SHIPPINGADDRESSDIR) .. require("allbinary_java").to_string("shippingAddressInputForm.xsl")
    self.SHIPPINGADDRESSVIEWXSL = require("allbinary_java").to_string(self.SHIPPINGADDRESSDIR) .. require("allbinary_java").to_string("shippingAddressView.xsl")
    self.NEWTAXADDRESSXSL = require("allbinary_java").to_string(self.SHIPPINGADDRESSDIR) .. require("allbinary_java").to_string("newTaxAddressView.xsl")
    self.EDITTAXADDRESSXSL = require("allbinary_java").to_string(self.SHIPPINGADDRESSDIR) .. require("allbinary_java").to_string("editTaxAddressView.xsl")
    self.SHIPPINGMETHODSXSL = require("allbinary_java").to_string(self.SHIPPINGDIR) .. require("allbinary_java").to_string("shippingMethods.xsl")
    self.ORDERCUSTOMEREMAILVIEWXSL = require("allbinary_java").to_string(self.ORDEREMAILDIR) .. require("allbinary_java").to_string("orderCustomerEmailView.xsl")
    self.ORDERMANAGEREMAILVIEWXSL = require("allbinary_java").to_string(self.ORDEREMAILDIR) .. require("allbinary_java").to_string("orderManagerEmailView.xsl")
    self.EDITCUSTOMERXSL = require("allbinary_java").to_string(self.USERDIR) .. require("allbinary_java").to_string("editCustomerInputForm.xsl")
    self.ORDERHISTORYXSL = require("allbinary_java").to_string(self.ORDERHISTORYDIR) .. require("allbinary_java").to_string("orderHistory.xsl")
    self.PAYMENTVIEWXSL = require("allbinary_java").to_string(self.PAYMENTDIR) .. require("allbinary_java").to_string("paymentView.xsl")
    self.SUMMARYXSL = require("allbinary_java").to_string(self.ITEMDIR) .. require("allbinary_java").to_string("summary/summary.xsl")
    self.PAYMENTGATEWAYOPTIONSXSL = require("allbinary_java").to_string(self.PAYMENTDIR) .. require("allbinary_java").to_string("paymentGatewayOptions.xsl")
    self.MAKEPAYMENTVIEWXSL = require("allbinary_java").to_string(require("allbinary_java").to_string(self.PAYMENTDIR) .. require("allbinary_java").to_string("invoice/")) .. require("allbinary_java").to_string("makePayment.xsl")
end


function BasicViewData.getInstance()
        return BasicViewData.instance_f
end


function BasicViewData._jinit(self)
    BasicViewData._init_fields(self)
    return self
end

function BasicViewData.new(...)
    local self = setmetatable({}, BasicViewData)
    BasicViewData._jinit(self, ...)
    return self
end

BasicViewData.instance_f = BasicViewData.new()

return BasicViewData


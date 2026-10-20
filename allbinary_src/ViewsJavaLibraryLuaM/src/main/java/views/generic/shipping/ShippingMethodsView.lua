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
-- package views.generic.shipping

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = require("org.allbinary.business.entry.EntryData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local TaxFactory = require("org.allbinary.business.user.commerce.money.tax.TaxFactory")
local ShippingMethods = require("org.allbinary.business.user.commerce.shipping.ShippingMethods")
local ShippingMethodsData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodsData")
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local StreetAddressesEntityInterface = require("org.allbinary.data.tables.user.address.StreetAddressesEntityInterface")
local ShippingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShippingMethodsView = {}
ShippingMethodsView.__index = ShippingMethodsView
ShippingMethodsView.className = "ShippingMethodsView"
setmetatable(ShippingMethodsView, {__index = HttpStoreComponentView})

function ShippingMethodsView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.shippingMethods = nil
    self.storeFrontInterface = nil
end


function ShippingMethodsView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), ShippingMethodsView)
    self:_init_fields()
        -- super(...) made self above
        self.storeFrontInterface = StoreFrontFactory.getInstance(self:getTransformInfoInterface():getStoreName())
        self.shippingMethods = ShippingMethods.new(self.abeClientInformation, self.storeFrontInterface)
    return self
end


-- throws Exception
function ShippingMethodsView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local shippingMethodsNode = document:createElement(ShippingMethodsData.SHIPPINGMETHODSORDERSUMMARIES)
            local order = self:getWeblisketSession():getOrder()
            local basket = self:getWeblisketSession():getOrder():getBasket()
            local shippingAddressesEntityInterface = ShippingAddressesEntityFactory.getInstance():getInstance(self:getWeblisketSession():getUserName())
            local streetAddress = shippingAddressesEntityInterface:getDefault()
            local shippingVector = self.shippingMethods:get()
            local size = shippingVector:size()
            for index = 0, size - 1 do
                local shippingMethodNode = document:createElement(ShippingMethodsData.SHIPPINGMETHODORDERSUMMARY)
                local shipping = shippingVector:get(index)
                local shippingView = shipping
                shippingMethodNode:appendChild(shippingView:toXmlNode(document))
                local shippingCost = shipping:getCost(order)
                local subTotal = basket:getSubTotal()
                local taxRate = TaxFactory.getInstance():getInstance(self.abeClientInformation, self.storeFrontInterface):getTaxRate(streetAddress, self.storeFrontInterface)
                local tax = Money.new()
                local total = Money.new()
                total:add(tostring(shippingCost))
                total:add(tostring(subTotal))
                tax:add(tostring(total))
                tax:multiply(taxRate)
                total:add(tostring(tax))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.SHIPPINGCOST, tostring(shippingCost)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TAXRATE, tostring(taxRate)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.SUBTOTAL, tostring(subTotal)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TAX, tostring(tax)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TOTAL, tostring(total)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, EntryData.getInstance().DEFAULT, self.shippingMethods:getDefault():getName()))
                shippingMethodsNode:appendChild(shippingMethodNode)
            end
            return shippingMethodsNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function ShippingMethodsView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


function ShippingMethodsView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view ShippingMethods"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
end

return ShippingMethodsView


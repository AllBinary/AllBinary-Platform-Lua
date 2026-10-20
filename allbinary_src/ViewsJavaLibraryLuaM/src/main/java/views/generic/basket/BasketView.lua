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
-- package views.generic.basket

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local BasketData = require("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local BasicItemView = require("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchData = require("org.allbinary.logic.control.search.SearchData")
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

local BasketView = {}
BasketView.__index = BasketView
BasketView.className = "BasketView"
setmetatable(BasketView, {__index = HttpStoreComponentView})

function BasketView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
end


function BasketView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), BasketView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
    return self
end


-- throws Exception
function BasketView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local inventoryEntity = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local basketInterface = self:getWeblisketSession():getOrder():getBasket()
            local basketNode = document:createElement(BasketData.BASKET)
            local itemsAndNumberInBasket = basketInterface:getItems()
            local numberOfResults = 1
            local items = itemsAndNumberInBasket:keySet()
            local productArray = items:toArray()
            local size = (productArray.n or #productArray)
            for index = 0, size - 1 do
                local product = tostring(productArray[index + 1])
                local itemInterface = inventoryEntity:getItem(product)
                if itemInterface ~= nil then
                    local basicItemView = BasicItemView.new(itemInterface, BasicArrayListD.new())
                    local node = basicItemView:toXmlNode(document)
                    local numberInBasket = tostring(basketInterface:getNumberOf(product))
                    node:appendChild(ModDomHelper.createNameValueNodes(document, BasketData.ITEMTOTALINBASKET, numberInBasket))
                    local itemPrice = itemInterface:getPrice()
                    local itemTotal = Money.new(itemPrice)
                    itemTotal:multiply(math.tointeger(basketInterface:getNumberOf(product) // 1))
                    node:appendChild(ModDomHelper.createNameValueNodes(document, BasketData.ITEMTOTAL, tostring(itemTotal)))
                    basketNode:appendChild(node)
                else
                    self.logUtil:putF("Product Failed: " .. product, self, "toXmlNode")
                end
                numberOfResults = numberOfResults + 1
            end
            local totalNumberNode = document:createElement(SearchData.TOTAL_NUMBER_ITEMS)
            local totalNumberTextNode = document:createTextNode(tostring(basketInterface:getNumberOfItems()))
            totalNumberNode:appendChild(totalNumberTextNode)
            local totalWeightNode = document:createElement(BasketData.TOTALWEIGHT)
            local totalWeightTextNode = document:createTextNode(tostring(basketInterface:getTotalWeight()))
            totalWeightNode:appendChild(totalWeightTextNode)
            local subTotalNode = document:createElement(BasketData.SUBTOTAL)
            local subTotalTextNode = document:createTextNode(tostring(basketInterface:getSubTotal()))
            subTotalNode:appendChild(subTotalTextNode)
            basketNode:appendChild(totalNumberNode)
            basketNode:appendChild(totalWeightNode)
            basketNode:appendChild(subTotalNode)
            return basketNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function BasketView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function BasketView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return BasketView


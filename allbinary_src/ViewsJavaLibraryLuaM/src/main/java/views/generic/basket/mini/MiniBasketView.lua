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
-- package views.generic.basket.mini

local BasketData = require("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
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

local MiniBasketView = {}
MiniBasketView.__index = MiniBasketView
MiniBasketView.className = "MiniBasketView"
setmetatable(MiniBasketView, {__index = HttpStoreComponentView})

function MiniBasketView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function MiniBasketView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), MiniBasketView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function MiniBasketView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local basketInterface = self:getWeblisketSession():getOrder():getBasket()
            local basketNode = document:createElement(BasketData.BASKET)
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


function MiniBasketView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function MiniBasketView:view()
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

return MiniBasketView


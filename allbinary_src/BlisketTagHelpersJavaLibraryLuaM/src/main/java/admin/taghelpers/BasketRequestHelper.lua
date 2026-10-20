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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasketData = require("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasketRequestHelper = {}
BasketRequestHelper.__index = BasketRequestHelper
BasketRequestHelper.className = "BasketRequestHelper"
setmetatable(BasketRequestHelper, {__index = TagHelper})

function BasketRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.propertiesHashMap = nil
    self.pageContext = nil
    self.request = nil
    self.id = nil
    self.num = nil
    self.MAX = 200
end


function BasketRequestHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(TagHelper.new(), BasketRequestHelper)
    self:_init_fields()
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        local storeName = propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        else
            self.storeFrontInterface = StoreFront.new()
        end
        self.weblisketSession = WeblisketSession.new(propertiesHashMap, pageContext)
        self:getFormData()
    return self
end


function BasketRequestHelper:getFormData()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.num = self.request:getParameter(BasketData.ITEMTOTALINBASKET)
end


function BasketRequestHelper:addItemToBasket()
        local try_ok, try_error = pcall(function()
            if self.id ~= nil and self.num ~= nil then
                local basket = self.weblisketSession:getOrder():getBasket()
                if InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.id) == nil then
                    return false
                end
                basket:addItem(self.id, self.num)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfully added item to Basket", self, "addItemToBasket()")
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "addItemToBasket()", e)
            end
            return false
        end
end


function BasketRequestHelper:removeItemFromBasket()
        local try_ok, try_error = pcall(function()
            if self.id ~= nil then
                local basket = self.weblisketSession:getOrder():getBasket()
                basket:removeItem(self.id)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfully removed item from Basket", self, "removeItemFromBasket()")
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "removeItemFromBasket()", e)
            end
            return false
        end
end


function BasketRequestHelper:adjustBasket()
        local try_ok, try_error = pcall(function()
            local basket = self.weblisketSession:getOrder():getBasket()
            if self.id ~= nil and self.num ~= nil then
                basket:adjustItem(self.id, self.num)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfull Adjusted Basket", self, "adjustBasket()")
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "adjustBasket()", e)
            end
            return false
        end
end

return BasketRequestHelper


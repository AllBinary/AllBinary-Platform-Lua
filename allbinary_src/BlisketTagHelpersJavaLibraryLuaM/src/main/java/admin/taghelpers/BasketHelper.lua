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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
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

local BasketHelper = {}
BasketHelper.__index = BasketHelper
BasketHelper.className = "BasketHelper"
setmetatable(BasketHelper, {__index = TagHelper})

function BasketHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.propertiesHashMap = nil
    self.pageContext = nil
    self.MAX = 200
end


function BasketHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), BasketHelper)
    self:_init_fields()
        self.propertiesHashMap = hashMap
        self.pageContext = pageContext
        local storeName = self.propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        end
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
    return self
end


function BasketHelper:isBasketEmpty()
        local try_ok, try_error = pcall(function()
            local basket = self.weblisketSession:getOrder():getBasket()
            if math.tointeger(basket:getNumberOfItems() // 1) <= 0 then
                return true
            else
                return false
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "isBasketEmpty()", e)
            end
            return true
        end
end

return BasketHelper


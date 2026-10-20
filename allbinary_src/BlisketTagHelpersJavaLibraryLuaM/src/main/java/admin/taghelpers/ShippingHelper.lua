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
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
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

local ShippingHelper = {}
ShippingHelper.__index = ShippingHelper
ShippingHelper.className = "ShippingHelper"
setmetatable(ShippingHelper, {__index = TagHelper})

function ShippingHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.propertiesHashMap = nil
    self.pageContext = nil
    self.request = nil
    self.shippingType = nil
end


function ShippingHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), ShippingHelper)
    self:_init_fields()
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        local storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        end
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self:getFormData()
    return self
end


function ShippingHelper:getFormData()
        self.shippingType = self.request:getParameter(ShippingMethodData.NAME)
end


function ShippingHelper:setShippingType()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Set Shipping Type"
            local order = self.weblisketSession:getOrder()
            order:setShippingMethod(self.shippingType)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "setShippingType()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view Shipping Type"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setShippingType()", e)
            end
            return error
        end
end

return ShippingHelper


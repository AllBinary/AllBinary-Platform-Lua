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
-- package views.generic.order

local OrderHistoryFactory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory")
local OrderItemsEntity = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local OrderView = require("views.generic.order.OrderView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ValidationView = {}
ValidationView.__index = ValidationView
ValidationView.className = "ValidationView"
setmetatable(ValidationView, {__index = OrderView})

function ValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ValidationView.new(transformInfoInterface)
    local self = setmetatable(OrderView.new(transformInfoInterface), ValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if self.order:isIdValid() == false then
                return false
            else
                self.orderHistory = OrderHistoryFactory.getInstance(self.order:getId())
                if self.orderHistory == nil or self.orderHistory:isValid() == false then
                    return false
                end
                local orderItems = OrderItemsEntity.new()
                self.basketReview = orderItems:getBasketReview(self.order:getId())
                if self.basketReview == nil or self.basketReview:isValid() == false then
                    return false
                end
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function ValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.order:isIdValid() == false then
                stringBuffer:append(self.order:getIdValidationInfo())
            else
                self.orderHistory = OrderHistoryFactory.getInstance(self.order:getId())
                if self.orderHistory == nil or self.orderHistory:isValid() == false then
                    stringBuffer:append("Order History data error for: ")
                    stringBuffer:append(self.order:getId())
                    stringBuffer:append("<br />")
                end
                local orderItems = OrderItemsEntity.new()
                self.basketReview = orderItems:getBasketReview(self.order:getId())
                if self.basketReview == nil then
                    stringBuffer:append("Order Items data error - does not exist for: ")
                    stringBuffer:append(self.order:getId())
                    stringBuffer:append("<br />")
                elseif self.basketReview:isValid() == false then
                    stringBuffer:append("Order Items data error - not valid for: ")
                    stringBuffer:append(self.order:getId())
                    stringBuffer:append("<br />")
                end
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function ValidationView:toValidationInfoDoc()
        return nil
end


function ValidationView:toValidationInfoNode(document)
        return nil
end

return ValidationView


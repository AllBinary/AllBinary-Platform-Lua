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
-- package org.allbinary.business.user.commerce.inventory.order.status

local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local UserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons")
local AdminEmailInfo = require("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = require("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderStatusEmail = {}
OrderStatusEmail.__index = OrderStatusEmail
OrderStatusEmail.className = "OrderStatusEmail"

function OrderStatusEmail:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = nil
    self.orderHistory = nil
    self.storeFrontInterface = nil
    self.user = nil
end


function OrderStatusEmail.new(abeClientInformation, orderHistory)
    local self = setmetatable({}, OrderStatusEmail)
    self:_init_fields()
        self.abeClientInformation = abeClientInformation
        self.orderHistory = orderHistory
        local storeName = orderHistory:getStoreName()
        self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        self.user = UserEntityFactory.getInstance():getUser(orderHistory:getUserName())
    return self
end


-- throws Exception
function OrderStatusEmail:process()
        self:notifyStoreAdmin()
        self:notifyUser()
end


-- throws Exception
function OrderStatusEmail:notifyStoreAdmin()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Order Email", self, "emailStoreAdmin")
            end
            local adminEmailSubject = "Order " .. tostring(self.orderHistory:getStatus()) .. " Attempt"
            local adminEmailTextBody = "Order attempt: " .. tostring(self.orderHistory:getId()) .. " Preprocessing by: " .. tostring(self.user:getUserName())
            local adminBasicEmailInfo = AdminEmailInfo.new(adminEmailSubject, adminEmailTextBody)
            local storeAdminBasicEmailInfo = StoreEmailInfo.new(self.storeFrontInterface, adminEmailSubject, adminEmailTextBody)
            local storeAdminEmailInfo = EmailInfo.new(storeAdminBasicEmailInfo)
            local adminEmailInfo = EmailInfo.new(adminBasicEmailInfo)
            local userEmailEventNameData = UserEmailEventNameData.getInstance(self.orderHistory:getStatus())
            local adminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, userEmailEventNameData)
            local storeAdminUserEmailEventHandler = StoreAdminUserEmailEventHandlerSingletons.getInstance():getInstance(userEmailEventNameData, self.abeClientInformation, self.storeFrontInterface)
            storeAdminUserEmailEventHandler:receiveEmailInfo(userEmailEventNameData, storeAdminEmailInfo)
            adminUserEmailEventHandler:receiveEmailInfo(userEmailEventNameData, adminEmailInfo)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "emailAdmin", e)
            end
        end
end


-- throws Exception
function OrderStatusEmail:notifyUser()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Email User", self, "notifyUser()")
            end
            local subject = "Order " .. tostring(self.orderHistory:getStatus()) .. " Attempt"
            local textBody = "Order attempt: " .. tostring(self.orderHistory:getId()) .. " Preprocessing by: " .. tostring(self.user:getUserName())
            local basicEmailInfo = StoreEmailInfo.new(self.storeFrontInterface, subject, textBody)
            local emailInfo = EmailInfo.new(basicEmailInfo)
            local userEmailEventNameData = UserEmailEventNameData.getInstance(self.orderHistory:getStatus())
            local userEmailEventHandler = UserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, userEmailEventNameData, self.user)
            userEmailEventHandler:receiveEmailInfo(userEmailEventNameData, emailInfo)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "notifyUser", e)
            end
            error(e, 0)
        end
end

return OrderStatusEmail


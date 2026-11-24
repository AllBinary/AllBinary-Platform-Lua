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

local OrderStatusEmail = {}
package.loaded["org.allbinary.business.user.commerce.inventory.order.status.OrderStatusEmail"] = OrderStatusEmail

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

local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local OrderHistory = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local UserEntityFactory = java_lazy("org.allbinary.data.tables.user.UserEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = java_lazy("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local StoreAdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons")
local UserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons")
local AdminEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StoreEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.StoreEmailInfo")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table OrderStatusEmail is declared before the requires
OrderStatusEmail.__index = OrderStatusEmail
OrderStatusEmail.className = "OrderStatusEmail"
OrderStatusEmail.javaClassName = "org.allbinary.business.user.commerce.inventory.order.status.OrderStatusEmail"

function OrderStatusEmail:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.orderHistory == nil then self.orderHistory = nil end
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
    if self.user == nil then self.user = nil end
end


function OrderStatusEmail._jinit(self, abeClientInformation, orderHistory)
    OrderStatusEmail._init_fields(self)
        self.abeClientInformation = abeClientInformation
        self.orderHistory = orderHistory
        local storeName = orderHistory:getStoreName()
        self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        self.user = UserEntityFactory.getInstance():getUser(orderHistory:getUserName())
    return self
end

function OrderStatusEmail.new(...)
    local self = setmetatable({}, OrderStatusEmail)
    OrderStatusEmail._jinit(self, ...)
    return self
end


-- throws Exception
function OrderStatusEmail:process()
        self:notifyStoreAdmin()
        self:notifyUser()
end


-- throws Exception
function OrderStatusEmail:notifyStoreAdmin()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "emailAdmin", e)
            end
        end
end


-- throws Exception
function OrderStatusEmail:notifyUser()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "notifyUser", e)
            end
            error(e, 0)
        end
end

return OrderStatusEmail


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
local Portion = require("org.allbinary.business.installer.Portion")
local PaymentFactory = require("org.allbinary.business.user.commerce.money.payment.PaymentFactory")
local PaymentInterface = require("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local PaymentEntity = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity")
local PaymentEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local Table = require("admin.taghelpers.Table")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentHelper = {}
PaymentHelper.__index = PaymentHelper
PaymentHelper.className = "PaymentHelper"
setmetatable(PaymentHelper, {__index = Table})

function PaymentHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.request = nil
    self.value = nil
    self.portion = nil
end


function PaymentHelper.new(hashMap, pageContext)
    local self = setmetatable(Table.new(), PaymentHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
        self:getFormData()
    return self
end


function PaymentHelper:getFormData()
        self.value = self.request:getParameter("VALUE")
end


function PaymentHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Added Payment"
            local paymentEntity = PaymentEntityFactory.getInstance():getPaymentEntityInstance()
            local paymentInterface = PaymentFactory.getInstance(self.request)
            paymentEntity:add(self.weblisketSession:getUserName(), paymentInterface)
            paymentEntity:setDefault(self.weblisketSession:getUserName(), paymentEntity:getLastId(self.weblisketSession:getUserName()))
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "addPayment()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add Payment"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "addPayment()", e)
            end
            return error
        end
end


function PaymentHelper:select()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Selected Payment"
            local paymentEntity = PaymentEntityFactory.getInstance():getPaymentEntityInstance()
            paymentEntity:setDefault(self.weblisketSession:getUserName(), self.value)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "selectPayment()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to select Payment"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "selectPayment()", e)
            end
            return error
        end
end


function PaymentHelper:delete()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Removed Payment"
            local paymentEntity = PaymentEntityFactory.getInstance():getPaymentEntityInstance()
            paymentEntity:remove(self.weblisketSession:getUserName(), self.value)
            local paymentInterface = paymentEntity:getDefault(self.weblisketSession:getUserName())
            if paymentInterface == nil then
                paymentEntity:setDefault(self.weblisketSession:getUserName(), paymentEntity:getLastId(self.weblisketSession:getUserName()))
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "removePayment()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to remove Payment"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "removePayment()", e)
            end
            return error
        end
end


function PaymentHelper:drop()
        local try_ok, try_error = pcall(function()
            local paymentEntity = PaymentEntityFactory.getInstance():getPaymentEntityInstance()
            local success = paymentEntity:dropTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop Admin table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function PaymentHelper:create()
        local try_ok, try_error = pcall(function()
            local paymentEntity = PaymentEntityFactory.getInstance():getPaymentEntityInstance()
            local success = paymentEntity:createTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create user table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function PaymentHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(PaymentEntityFactory.getInstance():getPaymentEntityInstance(), self.portion)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "restore()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to restore backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
end


function PaymentHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Backup Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(PaymentEntityFactory.getInstance():getPaymentEntityInstance())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "backup()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to make backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
end


-- throws LicensingException
function PaymentHelper:update()
        return self.commonStrings.NOT_IMPLEMENTED
end

return PaymentHelper


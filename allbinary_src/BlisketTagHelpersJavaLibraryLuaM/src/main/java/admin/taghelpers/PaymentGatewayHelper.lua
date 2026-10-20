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
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local PaymentGatewayInterfaceFactory = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory")
local BasicPaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local PaymentGatewayEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicTable = require("admin.taghelpers.BasicTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayHelper = {}
PaymentGatewayHelper.__index = PaymentGatewayHelper
PaymentGatewayHelper.className = "PaymentGatewayHelper"
setmetatable(PaymentGatewayHelper, {__index = BasicTable})

function PaymentGatewayHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.httpServletRequest = nil
    self.portion = nil
end


function PaymentGatewayHelper.new(hashMap, pageContext)
    local self = setmetatable(BasicTable.new(), PaymentGatewayHelper)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
            self.httpServletRequest = pageContext:getRequest()
            self.portion = Portion.new(hashMap)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENTERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end


function PaymentGatewayHelper:insert()
        local try_ok, try_error = pcall(function()
            local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(self.httpServletRequest)
            paymentGatewayInterface:setStoreName(self.weblisketSession:getStoreName())
            PaymentGatewayEntityFactory.getInstance():add(paymentGatewayInterface)
            local success = "Successfully Added New Payment Gateway"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success .. "<br/>"
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error .. "<br>" .. "Exception: " .. tostring(e) .. "<br>"
        end
end


function PaymentGatewayHelper:update()
        local try_ok, try_error = pcall(function()
            local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(self.httpServletRequest)
            paymentGatewayInterface:setStoreName(self.weblisketSession:getStoreName())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Gateway Name: ")
                stringBuffer:append(paymentGatewayInterface:getName())
                stringBuffer:append(" HashMap=")
                stringBuffer:append(tostring(paymentGatewayInterface:toHashMap(true)))
                self.logUtil:putF(tostring(stringBuffer), self, "update()")
            end
            PaymentGatewayEntityFactory.getInstance():update(paymentGatewayInterface)
            local success = "Successfully Updated Payment Gateway information"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success .. "<br/>"
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update payment gateway information"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error .. "<br/>" .. "Exception: " .. tostring(e) .. "<br/>"
        end
end


function PaymentGatewayHelper:delete()
        local try_ok, try_error = pcall(function()
            local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(self.httpServletRequest)
            paymentGatewayInterface:setStoreName(self.weblisketSession:getStoreName())
            local storeName = paymentGatewayInterface:getStoreName()
            local gatewayName = paymentGatewayInterface:getName()
            PaymentGatewayEntityFactory.getInstance():remove(storeName, BasicPaymentTypeUtil.getInstance():get(gatewayName))
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Successfully Removed payment gateway where store name=")
            stringBuffer:append(storeName)
            stringBuffer:append(" and gateway name=")
            stringBuffer:append(gatewayName)
            local success = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success .. "<br/>"
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to remove payment gateway from table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "remove()", e)
            end
            return error .. "<br/>" .. "Exception: " .. tostring(e) .. "<br>"
        end
end


function PaymentGatewayHelper:drop()
        local try_ok, try_error = pcall(function()
            local success = PaymentGatewayEntityFactory.getInstance():dropTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop payment transaction result table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function PaymentGatewayHelper:create()
        local try_ok, try_error = pcall(function()
            local success = PaymentGatewayEntityFactory.getInstance():createTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create payment transaction result table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function PaymentGatewayHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(PaymentGatewayEntityFactory.getInstance(), self.portion)
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


function PaymentGatewayHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(PaymentGatewayEntityFactory.getInstance())
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

return PaymentGatewayHelper


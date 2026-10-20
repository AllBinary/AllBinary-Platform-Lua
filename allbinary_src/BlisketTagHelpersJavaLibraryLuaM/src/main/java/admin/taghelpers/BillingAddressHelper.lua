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
local UserData = require("org.allbinary.business.user.UserData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local BillingAddressesEntity = require("org.allbinary.data.tables.user.address.billing.BillingAddressesEntity")
local BillingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory")
local ShippingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionData = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local BillingAddressHelper = {}
BillingAddressHelper.__index = BillingAddressHelper
BillingAddressHelper.className = "BillingAddressHelper"
setmetatable(BillingAddressHelper, {__index = Table})

function BillingAddressHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.weblisketSession = nil
    self.request = nil
    self.userName = nil
    self.streetAddress = nil
    self.portion = nil
end


function BillingAddressHelper.new(hashMap, pageContext)
    local self = setmetatable(Table.new(), BillingAddressHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
        self:getAddressForm()
    return self
end


function BillingAddressHelper:getAddressForm()
        self.userName = self.request:getParameter(UserData.USERNAME)
        if self.userName == nil then
            self.userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
        end
        self.streetAddress = StreetAddress.new(self.request)
end


function BillingAddressHelper:drop()
        local try_ok, try_error = pcall(function()
            local success = BillingAddressesEntity.new(self.stringUtil.EMPTY_STRING):drop()
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


function BillingAddressHelper:create()
        local try_ok, try_error = pcall(function()
            local success = BillingAddressesEntity.new(self.stringUtil.EMPTY_STRING):createTable()
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


function BillingAddressHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local billingAddressesEntity = BillingAddressesEntity.new(StringUtil.getInstance().EMPTY_STRING)
            local result = AbSqlTableUtil.getInstance():restoreTable(billingAddressesEntity, self.portion)
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


function BillingAddressHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Backup Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(BillingAddressesEntity.new(StringUtil.getInstance().EMPTY_STRING))
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


function BillingAddressHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Added Billing Address"
            BillingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):add(self.streetAddress)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "add()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add Billing Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error
        end
end


function BillingAddressHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Updated Billing Address"
            BillingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):update(self.streetAddress)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfull update of a user Billing Address table", self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed update of a User Billing Address Table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


function BillingAddressHelper:setToShippingAddress()
        local try_ok, try_error = pcall(function()
            local shippingAddressesEntityFactory = ShippingAddressesEntityFactory.getInstance()
            local streetAddress = shippingAddressesEntityFactory:getInstance(self.weblisketSession:getUserName()):getDefault()
            if streetAddress ~= nil then
                shippingAddressesEntityFactory:getInstance(self.weblisketSession:getUserName()):add(streetAddress)
            else
                return "No Shipping Address"
            end
            return StringUtil.getInstance().EMPTY_STRING
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to Set Billing address to Shipping Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setToShippingAddress()", e)
            end
            return error
        end
end


function BillingAddressHelper:delete()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Removed Billing Address"
            BillingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):remove(self.streetAddress:getId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to remove Billing Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
end


function BillingAddressHelper:set()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Set Billing Address"
            BillingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):setDefault(self.streetAddress:getId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "set()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set billing Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "set()", e)
            end
            return error
        end
end

return BillingAddressHelper


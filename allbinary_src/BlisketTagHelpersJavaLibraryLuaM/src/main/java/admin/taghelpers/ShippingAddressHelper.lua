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
local BillingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory")
local ShippingAddressesEntity = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local ShippingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionData = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local ShippingAddressHelper = {}
ShippingAddressHelper.__index = ShippingAddressHelper
ShippingAddressHelper.className = "ShippingAddressHelper"
setmetatable(ShippingAddressHelper, {__index = BasicTable})

function ShippingAddressHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.weblisketSession = nil
    self.request = nil
    self.userName = nil
    self.streetAddress = nil
    self.portion = nil
end


function ShippingAddressHelper.new(hashMap, pageContext)
    local self = setmetatable(BasicTable.new(), ShippingAddressHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self.weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.portion = Portion.new(hashMap)
        self:getAddressForm()
    return self
end


function ShippingAddressHelper:getAddressForm()
        self.userName = self.request:getParameter(UserData.USERNAME)
        if self.userName == nil then
            self.userName = self.request:getParameter(WeblisketSessionData.REMOVABLEUSERNAME)
        end
        self.streetAddress = StreetAddress.new(self.request)
end


function ShippingAddressHelper:drop()
        local try_ok, try_error = pcall(function()
            local success = ShippingAddressesEntity.new(self.stringUtil.EMPTY_STRING):drop()
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


function ShippingAddressHelper:create()
        local try_ok, try_error = pcall(function()
            local success = ShippingAddressesEntity.new(self.stringUtil.EMPTY_STRING):createTable()
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


function ShippingAddressHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(ShippingAddressesEntity.new(StringUtil.getInstance().EMPTY_STRING), self.portion)
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


function ShippingAddressHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Backup Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(ShippingAddressesEntity.new(StringUtil.getInstance().EMPTY_STRING))
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


function ShippingAddressHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Added Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):add(self.streetAddress)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add Shipping streetAddress"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert", e)
            end
            return error
        end
end


function ShippingAddressHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Updated Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):update(self.streetAddress)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfull update of a Users Shipping Address table", self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed update of a Users Shipping Address Table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update", e)
            end
            return error
        end
end


function ShippingAddressHelper:setToBillingAddress()
        local try_ok, try_error = pcall(function()
            local streetAddress = BillingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):getDefault()
            if streetAddress ~= nil then
                ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):add(streetAddress)
            else
                return "No Billing Address"
            end
            return StringUtil.getInstance().EMPTY_STRING
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed Setting Shipping address to Billing Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setToBillingAddress()", e)
            end
            return error
        end
end


function ShippingAddressHelper:delete()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Removed Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):remove(self.streetAddress:getId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "remove()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to remove Shipping Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "remove()", e)
            end
            return error
        end
end


function ShippingAddressHelper:set()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Set Shipping Address"
            ShippingAddressesEntityFactory.getInstance():getInstance(self.weblisketSession:getUserName()):setDefault(self.streetAddress:getId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "set()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set Shipping Address"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "set()", e)
            end
            return error
        end
end

return ShippingAddressHelper


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
-- package org.allbinary.business.installer

local InitInfoEntity = require("org.allbinary.business.init.InitInfoEntity")
local DatabaseConnectionInfoInterface = require("org.allbinary.business.init.db.DatabaseConnectionInfoInterface")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")
local HistoryDbInitInfo = require("org.allbinary.business.init.db.HistoryDbInitInfo")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local LogDbInitInfo = require("org.allbinary.business.init.db.LogDbInitInfo")
local StaticPagesDbInitInfo = require("org.allbinary.business.init.db.StaticPagesDbInitInfo")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StoreFrontsEntityFactory = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local LogTableEntityFactory = require("org.allbinary.data.tables.log.LogTableEntityFactory")
local StaticPagesEntityFactory = require("org.allbinary.data.tables.staticpages.StaticPagesEntityFactory")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local BillingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory")
local ShippingAddressesEntityFactory = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory")
local PaymentEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory")
local PaymentGatewayEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local TransactionEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityFactory")
local TransactionResultEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntityFactory")
local QuoteRequestEntityFactory = require("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbDatabaseManagement = require("org.allbinary.logic.communication.sql.AbDatabaseManagement")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileFactory = require("org.allbinary.logic.io.file.FileFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Warning you must have sql root access
local InitDbCrypted = {}
InitDbCrypted.__index = InitDbCrypted
InitDbCrypted.className = "InitDbCrypted"
setmetatable(InitDbCrypted, {__index = AbDatabaseManagement})

function InitDbCrypted:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userDbInitInfo = nil
    self.inventoryDbInitInfo = nil
    self.historyDbInitInfo = nil
    self.staticpagesDbInitInfo = nil
    self.logDbInitInfo = nil
    self.SQL_FILE = "initWeblisket.sql"
end


function InitDbCrypted.new(databaseConnectionInfoInterface)
    local self = setmetatable(AbDatabaseManagement.new(databaseConnectionInfoInterface), InitDbCrypted)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function InitDbCrypted:addUsers()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.METHOD_ADD_USERS)
            self.userDbInitInfo = UserDbInitInfo.new()
            self.inventoryDbInitInfo = InventoryDbInitInfo.new()
            self.historyDbInitInfo = HistoryDbInitInfo.new()
            self.staticpagesDbInitInfo = StaticPagesDbInitInfo.new()
            self.logDbInitInfo = LogDbInitInfo.new()
            local CUSTOMERDB = self.userDbInitInfo:getName()
            local CUSTOMERDBUSER = self.userDbInitInfo:getUserName()
            local CUSTOMERDBPASSWORD = self.userDbInitInfo:getPassword()
            if not self:addDbUser(CUSTOMERDB, CUSTOMERDBUSER, CUSTOMERDBPASSWORD) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_USER) .. CUSTOMERDBUSER, self, self.METHOD_ADD_USERS)
                return false
            end
            local INVENTORYDB = self.inventoryDbInitInfo:getName()
            local INVENTORYDBUSER = self.inventoryDbInitInfo:getUserName()
            local INVENTORYDBPASSWORD = self.inventoryDbInitInfo:getPassword()
            if not self:addDbUser(INVENTORYDB, INVENTORYDBUSER, INVENTORYDBPASSWORD) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_USER) .. INVENTORYDBUSER, self, self.METHOD_ADD_USERS)
                return false
            end
            local HISTORYDB = self.historyDbInitInfo:getName()
            local HISTORYDBUSER = self.historyDbInitInfo:getUserName()
            local HISTORYDBPASSWORD = self.historyDbInitInfo:getPassword()
            if not self:addDbUser(HISTORYDB, HISTORYDBUSER, HISTORYDBPASSWORD) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_USER) .. HISTORYDBUSER, self, self.METHOD_ADD_USERS)
                return false
            end
            local STATICPAGESDB = self.staticpagesDbInitInfo:getName()
            local STATICPAGESDBUSER = self.staticpagesDbInitInfo:getUserName()
            local STATICPAGESDBPASSWORD = self.staticpagesDbInitInfo:getPassword()
            if not self:addDbUser(STATICPAGESDB, STATICPAGESDBUSER, STATICPAGESDBPASSWORD) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_USER) .. STATICPAGESDBUSER, self, self.METHOD_ADD_USERS)
                return false
            end
            local LOGDB = self.logDbInitInfo:getName()
            local LOGDBUSER = self.logDbInitInfo:getUserName()
            local LOGDBPASSWORD = self.logDbInitInfo:getPassword()
            if not self:addDbUser(LOGDB, LOGDBUSER, LOGDBPASSWORD) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_USER) .. LOGDBUSER, self, self.METHOD_ADD_USERS)
                return false
            end
            self.logUtil:putF(self.commonStrings.END, self, self.METHOD_ADD_USERS)
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_ADD_USERS, e)
            return true
        end
end


function InitDbCrypted:addDatabases()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.METHOD_ADD_DATABASES)
            self.userDbInitInfo = UserDbInitInfo.new()
            self.inventoryDbInitInfo = InventoryDbInitInfo.new()
            self.historyDbInitInfo = HistoryDbInitInfo.new()
            self.staticpagesDbInitInfo = StaticPagesDbInitInfo.new()
            self.logDbInitInfo = LogDbInitInfo.new()
            local CUSTOMERDB = self.userDbInitInfo:getName()
            if not self:addDb(CUSTOMERDB) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_DATABASE) .. CUSTOMERDB, self, self.METHOD_ADD_DATABASES)
                return false
            end
            local INVENTORYDB = self.inventoryDbInitInfo:getName()
            if not self:addDb(INVENTORYDB) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_DATABASE) .. INVENTORYDB, self, self.METHOD_ADD_DATABASES)
                return false
            end
            local HISTORYDB = self.historyDbInitInfo:getName()
            if not self:addDb(HISTORYDB) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_DATABASE) .. HISTORYDB, self, self.METHOD_ADD_DATABASES)
                return false
            end
            local STATICPAGESDB = self.staticpagesDbInitInfo:getName()
            if not self:addDb(STATICPAGESDB) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_DATABASE) .. STATICPAGESDB, self, self.METHOD_ADD_DATABASES)
                return false
            end
            local LOGDB = self.logDbInitInfo:getName()
            if not self:addDb(LOGDB) then
                self.logUtil:putF(tostring(self.UNABLE_TO_CREATE_DATABASE) .. LOGDB, self, self.METHOD_ADD_DATABASES)
                return false
            end
            local file = FileFactory.getInstance():getInstance(self.SQL_FILE)
            file:createNewFile()
            local idOutData = DataOutputStreamFactory.getInstance():getInstanceForAbFile(file)
            idOutData:writeBytes(tostring(self.sqlCommandLog))
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_ADD_DATABASES, e)
            return true
        end
end


function InitDbCrypted:addTables()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            self.logUtil:putF(self.commonStrings.START, self, self.METHOD_ADD_TABLES)
            stringBuffer:append(UserEntityFactory.getInstance():createTable())
            stringBuffer:append(StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():createTable())
            stringBuffer:append(BillingAddressesEntityFactory.getInstance():getInstance(self.stringUtil.EMPTY_STRING):createTable())
            stringBuffer:append(ShippingAddressesEntityFactory.getInstance():getInstance(self.stringUtil.EMPTY_STRING):createTable())
            stringBuffer:append(PaymentEntityFactory.getInstance():getPaymentEntityInstance():createTable())
            stringBuffer:append(QuoteRequestEntityFactory.getInstance():getQuoteRequestEntityInstance():createTable())
            stringBuffer:append(OrderHistoryEntityFactory.getInstance():createTable())
            stringBuffer:append(OrderItemsEntityFactory.getInstance():createTable())
            stringBuffer:append(TransactionEntityFactory.getInstance():getTransactionEntityInstance():createTable())
            stringBuffer:append(TransactionResultEntityFactory.getInstance():getTransactionResultEntityInstance():createTable())
            stringBuffer:append(PaymentGatewayEntityFactory.getInstance():createTable())
            stringBuffer:append(InventoryEntityFactory.getInstance():getInventoryEntityInstance():createTable())
            stringBuffer:append(InitInfoEntity.new():createTable())
            stringBuffer:append(LogTableEntityFactory.getInstance():getLogTableEntityInstance():createTable())
            stringBuffer:append(StaticPagesEntityFactory.getInstance():getStaticPagesEntityInstance():createTable())
            stringBuffer:append(TransformInfoEntityBuilder.getInstance():createTable())
            self.logUtil:putF(tostring(self.ADD_TABLES_RESULTS_LABEL) .. tostring(stringBuffer), self, self.METHOD_ADD_TABLES)
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.METHOD_ADD_TABLES, e)
            return false
        end
end

return InitDbCrypted


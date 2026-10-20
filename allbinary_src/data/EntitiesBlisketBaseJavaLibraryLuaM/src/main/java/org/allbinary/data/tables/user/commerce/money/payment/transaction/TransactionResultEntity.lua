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
-- package org.allbinary.data.tables.user.commerce.money.payment.transaction

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = require("org.allbinary.business.user.UserData")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local PaymentTransactionKeysFactory = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory")
local TransactionResult = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResult")
local TransactionResultInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransactionResultEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransactionResultEntity = {}
TransactionResultEntity.__index = TransactionResultEntity
TransactionResultEntity.className = "TransactionResultEntity"
setmetatable(TransactionResultEntity, {__index = AbSqlBean})

function TransactionResultEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "vresults"
end


function TransactionResultEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), TransactionResultEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function TransactionResultEntity:remove(userName, orderNumber)
        local try_ok, try_error = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(OrderData.ID, orderNumber)
            whereHashMap:put(UserData.USERNAME, userName)
            AbSqlBean.deleteWhere(self, whereHashMap)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "remove")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "remove", e)
            end
        end
end


function TransactionResultEntity:add(userName, orderNumber, transactionResultInterface)
        local try_ok, try_error = pcall(function()
            local values = BasicArrayListD.new()
            values:add(orderNumber)
            values:add(userName)
            values:addAllList(transactionResultInterface:getValues())
            local calendar = Calendar.getInstance()
            local time = tostring(calendar:getTimeInMillis())
            values:add(time)
            values:add(time)
            AbSqlBean.insert(self, values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "add")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "add", e)
            end
        end
end


function TransactionResultEntity:getTransactionResultInterface(orderNumber)
        local try_ok, try_error = pcall(function()
            local resultHashMap = StdUtil.getInstance():createHashMap()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            updateKeyAndValue:put(OrderData.ID, orderNumber)
            resultHashMap = AbSqlBean.getRow(self, updateKeyAndValue)
            if resultHashMap ~= nil then
                local transactionResult = TransactionResult.new(resultHashMap)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getTransactionResultInterface")
                end
                return transactionResult
            else
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getTransactionResultInterface", e)
            end
            return nil
        end
end


function TransactionResultEntity:createTableStatement()
        local paymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(OrderData.ID):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.RESULT)):append(self.sqlTypeStrings.MAX_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PNREF)):append(self.sqlTypeStrings.TWELVE_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.RESPMSG)):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AUTHCODE)):append(self.sqlTypeStrings.SIX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AVSADDR)):append(self.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.AVSZIP)):append(self.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ORIGRESULT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.STATUS)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.FRAUDCODE)):append(self.sqlTypeStrings.TWO_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.FRAUDMSG)):append(self.sqlTypeStrings.MAX_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.ERRCODE)):append(self.sqlTypeStrings.MAX_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.SCORE)):append(self.sqlTypeStrings.THREE_INT_NOT_NULL)
        stringBuffer:append(tostring(paymentTransactionKeysFactory.REASON1)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.REASON2)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.REASON3))
        stringBuffer:append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION1)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION2)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION3)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION4)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION5)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION6)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXCEPTION7)):append(self.sqlTypeStrings.FOUR_INT_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(OrderData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function TransactionResultEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function TransactionResultEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return TransactionResultEntity


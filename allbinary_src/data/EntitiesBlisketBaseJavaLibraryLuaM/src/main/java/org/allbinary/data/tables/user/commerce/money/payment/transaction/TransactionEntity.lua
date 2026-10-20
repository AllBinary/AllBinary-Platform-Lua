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
local PaymentTransactionInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface")
local PaymentTransactionKeysFactory = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransactionEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransactionEntity = {}
TransactionEntity.__index = TransactionEntity
TransactionEntity.className = "TransactionEntity"
setmetatable(TransactionEntity, {__index = AbSqlBean})

function TransactionEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "vtrans"
end


function TransactionEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), TransactionEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function TransactionEntity:remove(userName, orderNumber)
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


function TransactionEntity:add(userName, orderNumber, paymentTransactionInterface)
        local try_ok, try_error = pcall(function()
            local values = BasicArrayListD.new()
            values:add(orderNumber)
            values:add(userName)
            values:addAllList(paymentTransactionInterface:toVector())
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
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


function TransactionEntity:createTableStatement()
        local paymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(OrderData.ID):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TRXTYPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TENDER)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ACCT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EXPDATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.AUTHCODE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.MICR)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CHECKNUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.NAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.STREET)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CITY)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.STATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ZIP)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DL)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.EMAIL)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COMMENT1)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COMMENT2)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ORIGID)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PONUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DESC)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DESC1TO4)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.INVNUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOZIP)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SWIPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TAXAMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COMMCARD)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DUTYAMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.FREIGHTAMT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ORDERDATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.TAXEXEMPT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COUNTRYCODE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CUSTCODE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CVV2)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ABA)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.ACCTTYPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DISCOUNT)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.FIRSTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.LASTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPFROMZIP)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PRENOTE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.CHKTYPE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.DOB)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.PHONENUM)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SS)):append(" VARCHAR(30) NOT NULL,"):append(tostring(paymentTransactionKeysFactory.COMPANYNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.COUNTRY)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOCITY)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOFIRSTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOLASTNAME)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOSTATE)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SHIPTOSTREET)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SPECIAL1)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SPECIAL2)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(tostring(paymentTransactionKeysFactory.SPECIAL3)):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(OrderData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function TransactionEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function TransactionEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return TransactionEntity


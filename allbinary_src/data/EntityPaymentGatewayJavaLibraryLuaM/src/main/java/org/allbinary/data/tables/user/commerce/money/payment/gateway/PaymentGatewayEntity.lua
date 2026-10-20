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
-- package org.allbinary.data.tables.user.commerce.money.payment.gateway

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = require("org.allbinary.business.user.UserData")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewayEncryptedMapping = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayEncryptedMapping")
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local PaymentGatewayInterfaceFactory = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory")
local BasicPaymentType = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local BasicPaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local PaymentGatewayIdGenerator = require("org.allbinary.data.generator.PaymentGatewayIdGenerator")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PaymentGatewayEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayEntity = {}
PaymentGatewayEntity.__index = PaymentGatewayEntity
PaymentGatewayEntity.className = "PaymentGatewayEntity"
setmetatable(PaymentGatewayEntity, {__index = AbSqlBean})

function PaymentGatewayEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "paymentgateways"
end


function PaymentGatewayEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), PaymentGatewayEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function PaymentGatewayEntity:add(paymentGatewayInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.START, self, "add")
            end
            local vector = BasicArrayListD.new()
            vector:add(PaymentGatewayIdGenerator.new():getNext())
            vector:addAllList(PaymentGatewayEncryptedMapping.new(paymentGatewayInterface):toVector())
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            vector:add(time)
            vector:add(time)
            AbSqlBean.insert(self, vector)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.END, self, "add")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "add", e)
            end
        end
end


function PaymentGatewayEntity:update(paymentGatewayInterface)
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            paymentGatewayInterface:setLastModified(time)
            local whereKeyValuePairs = StdUtil.getInstance():createHashMap()
            whereKeyValuePairs:put(tostring(StoreFrontData.getInstance().NAME), paymentGatewayInterface:getStoreName())
            whereKeyValuePairs:put(tostring(PaymentGatewayData.NAME), paymentGatewayInterface:getName())
            if whereKeyValuePairs:get(EntryData.getInstance().TIMECREATED) ~= nil then
                error(java_exception("Exception", "Don't update TimeCreated for update"), 0)
            end
            local updateHashMap = PaymentGatewayEncryptedMapping.new(paymentGatewayInterface):toHashMap()
            AbSqlBean.updateWhere(self, whereKeyValuePairs, updateHashMap)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "update")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "update", e)
            end
        end
end


function PaymentGatewayEntity:getPaymentGatewayInterface(storeName, paymentType)
        local try_ok, try_error = pcall(function()
            local paymentGatewayHashMap = StdUtil.getInstance():createHashMap()
            local whereKeyAndValue = StdUtil.getInstance():createHashMap()
            whereKeyAndValue:put(tostring(StoreFrontData.getInstance().NAME), storeName)
            whereKeyAndValue:put(tostring(PaymentGatewayData.NAME), paymentType:getName())
            paymentGatewayHashMap = AbSqlBean.getRow(self, whereKeyAndValue)
            if paymentGatewayHashMap ~= nil then
                local userName = paymentGatewayHashMap:get(tostring(UserData.USERNAME))
                local password = paymentGatewayHashMap:get(tostring(UserData.PASSWORD))
                local special1 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL1))
                local special2 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL2))
                local special3 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL3))
                local special4 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL4))
                local special5 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL5))
                local special6 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL6))
                local special7 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL7))
                local special8 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL8))
                local special9 = paymentGatewayHashMap:get(tostring(PaymentGatewayData.SPECIAL9))
                local superCrypt = SuperCrypt.new(PaymentGatewayData.CRYPTNUM)
                paymentGatewayHashMap:put(tostring(UserData.USERNAME), superCrypt:decrypt(userName))
                paymentGatewayHashMap:put(tostring(UserData.PASSWORD), superCrypt:decrypt(password))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL1), superCrypt:decrypt(special1))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL2), superCrypt:decrypt(special2))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL3), superCrypt:decrypt(special3))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL4), superCrypt:decrypt(special4))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL5), superCrypt:decrypt(special5))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL6), superCrypt:decrypt(special6))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL7), superCrypt:decrypt(special7))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL8), superCrypt:decrypt(special8))
                paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL9), superCrypt:decrypt(special9))
                local paymentGatewayInterface = PaymentGatewayInterfaceFactory.new():getInstance(paymentGatewayHashMap)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getPaymentGatewayInterface()")
                end
                return paymentGatewayInterface
            else
                return PaymentGatewayInterfaceFactory.new():getInstance(paymentType)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put("Command Failed for paymentType: " .. paymentType:getName(), self, "getPaymentGatewayInterface", e)
            end
            return nil
        end
end


function PaymentGatewayEntity:findPaymentTypeVectorByStore(storeName)
        local try_ok, try_error = pcall(function()
            local paymentGatewayNameVector = BasicArrayListD.new()
            paymentGatewayNameVector = AbSqlBean.getColumnWhere(self, tostring(PaymentGatewayData.NAME), tostring(StoreFrontData.getInstance().NAME), storeName)
            if paymentGatewayNameVector ~= nil then
                local paymentGatewayVector = BasicArrayListD.new()
                local size = paymentGatewayNameVector:size()
                for i = 0, size - 1 do
                    local paymentTypeString = paymentGatewayNameVector:get(i)
                    local paymentType = BasicPaymentTypeUtil.getInstance():get(paymentTypeString)
                    paymentGatewayVector:add(paymentType)
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "findPaymentTypeVectorByStore()")
                end
                return paymentGatewayVector
            else
                return BasicArrayListD.new()
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "findPaymentTypeVectorByStore", e)
            end
            return nil
        end
end


function PaymentGatewayEntity:remove(storeName, paymentType)
        local try_ok, try_error = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(tostring(StoreFrontData.getInstance().NAME), storeName)
            whereHashMap:put(tostring(PaymentGatewayData.NAME), paymentType:getName())
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


function PaymentGatewayEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(tostring(PaymentGatewayData.ID))
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().ENABLE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(StoreFrontData.getInstance().NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.NAME))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(PaymentData.METHOD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.MODE))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTPROTOCOL))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTSERVER))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTPORT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TESTPATH))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVERPROTOCOL))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVER))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVERPORT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SERVERPATH))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(UserData.USERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(UserData.PASSWORD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.TIMEOUT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPROTOCOL))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYSERVER))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPORT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPATH))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYUSERNAME))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYPASSWORD))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.PROXYTIMEOUT))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL1))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL2))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL3))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL4))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL5))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL6))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL7))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL8))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(tostring(PaymentGatewayData.SPECIAL9))
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(tostring(PaymentGatewayData.ID))
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function PaymentGatewayEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function PaymentGatewayEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return PaymentGatewayEntity


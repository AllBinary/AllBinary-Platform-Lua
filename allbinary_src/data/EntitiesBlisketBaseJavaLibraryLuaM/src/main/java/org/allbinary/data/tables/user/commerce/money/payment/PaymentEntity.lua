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
-- package org.allbinary.data.tables.user.commerce.money.payment

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
-- local Random = require("java.util.Random")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local UserData = require("org.allbinary.business.user.UserData")
local Payment = require("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentInterface = require("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local PaymentIdGenerator = require("org.allbinary.data.generator.PaymentIdGenerator")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PaymentEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentEntity = {}
PaymentEntity.__index = PaymentEntity
PaymentEntity.className = "PaymentEntity"
setmetatable(PaymentEntity, {__index = AbSqlBean})

function PaymentEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "payment"
end


function PaymentEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), PaymentEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function PaymentEntity:getLastId(userName)
        return AbSqlBean.getLargestIntegerInColumnWhere(self, PaymentData.ID, UserData.USERNAME, userName)
end


function PaymentEntity:setDefault(userName, index)
        local try_ok, try_error = pcall(function()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            local whereKeyAndValue = StdUtil.getInstance():createHashMap()
            whereKeyAndValue:put(UserData.USERNAME, userName)
            local paymentInterface = self:getDefault(userName)
            if paymentInterface ~= nil then
                updateKeyAndValue:put(EntryData.getInstance().DEFAULT, StringUtil.getInstance().EMPTY_STRING)
                whereKeyAndValue:put(PaymentData.ID, paymentInterface:getId())
                AbSqlBean.updateWhere(self, whereKeyAndValue, updateKeyAndValue)
            end
            updateKeyAndValue:put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT)
            whereKeyAndValue:put(PaymentData.ID, tostring(index))
            AbSqlBean.updateWhere(self, whereKeyAndValue, updateKeyAndValue)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "setDefault")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setDefault", e)
            end
        end
end


function PaymentEntity:get(userName)
        local try_ok, try_error = pcall(function()
            local paymentVector = BasicArrayListD.new()
            local keyAndValue = StdUtil.getInstance():createHashMap()
            keyAndValue:put(UserData.USERNAME, userName)
            local paymentList = AbSqlBean.getRows(self, keyAndValue)
            local size = paymentList:size()
            for index = 0, size - 1 do
                local paymentHashMap = paymentList:get(index)
                local payment = Payment.new(paymentHashMap)
                if payment ~= nil then
                    paymentVector:add(payment)
                end
            end
            return paymentVector
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


function PaymentEntity:getDefault(userName)
        local try_ok, try_error = pcall(function()
            local paymentHashMap = StdUtil.getInstance():createHashMap()
            local updateKeyAndValue = StdUtil.getInstance():createHashMap()
            updateKeyAndValue:put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT)
            updateKeyAndValue:put(UserData.USERNAME, userName)
            paymentHashMap = AbSqlBean.getRow(self, updateKeyAndValue)
            if paymentHashMap ~= nil then
                local payment = Payment.new(paymentHashMap)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF(self.commonStrings.SUCCESS, self, "getDefault")
                end
                return payment
            else
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getDefault", e)
            end
            return nil
        end
end


function PaymentEntity:remove(userName, index)
        local try_ok, try_error = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(UserData.USERNAME, userName)
            whereHashMap:put(PaymentData.ID, tostring(index))
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


function PaymentEntity:add(userName, paymentInterface)
        local try_ok, try_error = pcall(function()
            local vector = BasicArrayListD.new()
            vector:add(PaymentIdGenerator.new():getNext())
            vector:add(userName)
            vector:add(StringUtil.getInstance().EMPTY_STRING)
            vector:add(paymentInterface:getName())
            vector:add(paymentInterface:getType())
            vector:add(paymentInterface:getExpiration())
            local random = Random.new():nextInt(SuperCrypt.KEYMAX)
            vector:add(SuperCrypt.new(random):encrypt(paymentInterface:getNumber()))
            vector:add(tostring(random))
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            vector:add(time)
            AbSqlBean.insert(self, vector)
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


function PaymentEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(PaymentData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL):append(UserData.USERNAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.DEFAULT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.TYPE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.EXPIRATION):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PaymentData.NUMBER):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.ENCRYPTION):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(PaymentData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function PaymentEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function PaymentEntity:drop()
        return AbSqlBean.dropTable(self)
end

return PaymentEntity


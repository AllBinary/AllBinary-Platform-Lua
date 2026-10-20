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
-- package org.allbinary.data.tables.user.quoterequest

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local QuoteRequestData = require("org.allbinary.business.quoterequest.QuoteRequestData")
local UserData = require("org.allbinary.business.user.UserData")
local QuoteRequest = require("org.allbinary.business.user.quoterequest.QuoteRequest")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local QuoteRequestEntityInterface = require("org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local QuoteRequestEntity = {}
QuoteRequestEntity.__index = QuoteRequestEntity
QuoteRequestEntity.className = "QuoteRequestEntity"
setmetatable(QuoteRequestEntity, {__index = AbSqlBean})

function QuoteRequestEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "quoterequest"
end


function QuoteRequestEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), QuoteRequestEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function QuoteRequestEntity:insert(values)
        local try_ok, try_error = pcall(function()
            AbSqlBean.insert(self, values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end


-- throws Exception
function QuoteRequestEntity:get(userName, id)
        local row = StdUtil.getInstance():createHashMap()
        row:put(UserData.USERNAME, userName)
        row:put(QuoteRequestData.getInstance().ID, tostring(id))
        local quoteRequestHashMap = AbSqlBean.getRow(self, row)
        if quoteRequestHashMap ~= nil then
            return QuoteRequest.new(quoteRequestHashMap)
        else
            return nil
        end
end


function QuoteRequestEntity:getIds(userName)
        return AbSqlBean.getColumnWhere(self, QuoteRequestData.getInstance().ID, UserData.USERNAME, userName)
end


function QuoteRequestEntity:deleteWhere(key, value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, key, value)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, "deleteWhere")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "deleteWhere", e)
            end
        end
end


function QuoteRequestEntity:createTableStatement()
        local quoteRequestData = QuoteRequestData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START)
        stringBuffer:append(quoteRequestData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(UserData.USERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(quoteRequestData.PROJECT_INFO)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.CUSTOMER_COMMENTS)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.BUDGET)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.TIMEFRAME)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(quoteRequestData.COMMENTS)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(quoteRequestData.ID)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function QuoteRequestEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function QuoteRequestEntity:dropTable()
        local result = tostring(AbSqlBean.dropTable(self))
        return result
end


function QuoteRequestEntity:update(userName, updatedValues)
        AbSqlBean.updateWhere(self, UserData.USERNAME, userName, updatedValues)
end

return QuoteRequestEntity


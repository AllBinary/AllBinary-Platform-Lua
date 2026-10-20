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
-- package org.allbinary.data.tables.advertisement.sales

-- local HashMap = require("java.util.HashMap")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local GroupData = require("org.allbinary.business.user.group.GroupData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AffiliateSalesEntityInterface = require("org.allbinary.data.tables.advertisement.sales.AffiliateSalesEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AffiliateSalesEntity = {}
AffiliateSalesEntity.__index = AffiliateSalesEntity
AffiliateSalesEntity.className = "AffiliateSalesEntity"
setmetatable(AffiliateSalesEntity, {__index = AbSqlBean})

function AffiliateSalesEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "affiliate"
end


function AffiliateSalesEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), AffiliateSalesEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function AffiliateSalesEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, StoreFrontData.getInstance().NAME, value)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.commonStrings.delete)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
            end
        end
end


function AffiliateSalesEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(entryData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(GroupData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DynamicObjectData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(entryData.TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(entryData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function AffiliateSalesEntity:createTable()
        local returnStr = AbSqlBean.createTable(self, self:createTableStatement())
        return returnStr
end


function AffiliateSalesEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, EntryData.getInstance().ID, updatedValues:get(EntryData.getInstance().ID), updatedValues)
end


function AffiliateSalesEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return AffiliateSalesEntity


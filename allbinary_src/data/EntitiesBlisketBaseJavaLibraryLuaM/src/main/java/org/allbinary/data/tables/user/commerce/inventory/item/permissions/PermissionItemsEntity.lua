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
-- package org.allbinary.data.tables.user.commerce.inventory.item.permissions

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local PermissionItemData = require("org.allbinary.business.user.commerce.inventory.item.permission.PermissionItemData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PermissionItemsEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.item.permissions.PermissionItemsEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PermissionItemsEntity = {}
PermissionItemsEntity.__index = PermissionItemsEntity
PermissionItemsEntity.className = "PermissionItemsEntity"
setmetatable(PermissionItemsEntity, {__index = AbSqlBean})

function PermissionItemsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "permissionitems"
end


function PermissionItemsEntity.new()
    local self = setmetatable(AbSqlBean.new(InventoryDbInitInfo.new()), PermissionItemsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function PermissionItemsEntity:insert(values)
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


function PermissionItemsEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, self.basicItemData.ID, value)
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


function PermissionItemsEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(self.basicItemData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.basicItemData.NUMBER):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().ENABLE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(PermissionItemData.WHO):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PermissionItemData.WHAT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PermissionItemData.TYPE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PermissionItemData.REMOTE_ADDR):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(PermissionItemData.START_TIME):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(PermissionItemData.END_TIME):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.basicItemData.PRICE):append(" DECIMAL (11,2) NOT NULL,"):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(self.basicItemData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function PermissionItemsEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function PermissionItemsEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, self.basicItemData.ID, updatedValues:get(self.basicItemData.ID), updatedValues)
end


function PermissionItemsEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return PermissionItemsEntity


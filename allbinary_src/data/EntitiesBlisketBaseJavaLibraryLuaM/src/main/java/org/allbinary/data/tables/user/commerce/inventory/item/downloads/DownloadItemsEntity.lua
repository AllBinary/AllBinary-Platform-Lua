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
-- package org.allbinary.data.tables.user.commerce.inventory.item.downloads

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local DownloadItemData = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local DownloadItemsEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DownloadItemsEntity = {}
DownloadItemsEntity.__index = DownloadItemsEntity
DownloadItemsEntity.className = "DownloadItemsEntity"
setmetatable(DownloadItemsEntity, {__index = AbSqlBean})

function DownloadItemsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "downloaditems"
end


function DownloadItemsEntity.new()
    local self = setmetatable(AbSqlBean.new(InventoryDbInitInfo.new()), DownloadItemsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function DownloadItemsEntity:insert(values)
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


function DownloadItemsEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, DownloadItemData.ID, value)
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


function DownloadItemsEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, DownloadItemData.ID, updatedValues:get(DownloadItemData.ID), updatedValues)
end


function DownloadItemsEntity:getForItem(id)
        local returnVector = BasicArrayListD.new()
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(self.basicItemData.ID, id)
        local vector = AbSqlBean.getRows(self, keysAndValues)
        local size = vector:size()
        for index = 0, size - 1 do
            local hashMap = vector:get(index)
            returnVector:add(DownloadableItem.new(hashMap))
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF("Found: " .. tostring(size), self, "getForItem")
        end
        return returnVector
end


-- Java overloaded method: Lua keeps the last definition
function DownloadItemsEntity:getForItem(id, downloadItemId)
        local returnVector = BasicArrayListD.new()
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(self.basicItemData.ID, id)
        keysAndValues:put(DownloadItemData.ID, downloadItemId)
        local vector = AbSqlBean.getRows(self, keysAndValues)
        local size = vector:size()
        for index = 0, size - 1 do
            local hashMap = vector:get(index)
            returnVector:add(DownloadableItem.new(hashMap))
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF("Found: " .. tostring(size), self, "getForItem")
        end
        return returnVector
end


function DownloadItemsEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(DownloadItemData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.basicItemData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().ENABLE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DownloadItemData.SPECIAL_NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DownloadItemData.VERSION):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DownloadItemData.CHANGES):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(DownloadItemData.SYSTEM):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DownloadItemData.PLATFORM):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DownloadItemData.LICENSE_FILE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(DownloadItemData.FILE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DownloadItemData.SIZE):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(DownloadItemData.VALID_TIME):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(DownloadItemData.RETRIES):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(DownloadItemData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function DownloadItemsEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function DownloadItemsEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return DownloadItemsEntity


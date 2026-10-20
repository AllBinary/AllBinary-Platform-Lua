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
-- package org.allbinary.data.tables.user.commerce.inventory.item

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = require("org.allbinary.business.entry.EntryData")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local BasicItem = require("org.allbinary.business.user.commerce.inventory.item.BasicItem")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local InventoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventoryEntity = {}
InventoryEntity.__index = InventoryEntity
InventoryEntity.className = "InventoryEntity"
setmetatable(InventoryEntity, {__index = AbSqlBean})

function InventoryEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "basicinventory"
end


function InventoryEntity.new()
    local self = setmetatable(AbSqlBean.new(InventoryDbInitInfo.new()), InventoryEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function InventoryEntity:insert(values)
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


function InventoryEntity:delete(value)
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


-- throws Exception
function InventoryEntity:getItems(storeFrontInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF("Getting Items For: " .. storeFrontInterface:getName(), self, "getItems")
        end
        local itemVector = BasicArrayListD.new()
        local keysAndValues = StdUtil.getInstance():createHashMap()
        local itemHashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local size = itemHashMapVector:size()
        for i = 0, size - 1 do
            local itemHashMap = itemHashMapVector:get(i)
            if itemHashMap ~= nil then
                local category = itemHashMap:get(self.basicItemData.CATEGORY)
                if not StringValidationUtil.getInstance():isEmpty(category) and (string.sub(category, 1, #storeFrontInterface:getCategoryPath()) == storeFrontInterface:getCategoryPath()) then
                    itemVector:add(BasicItem.new(itemHashMap))
                end
            end
        end
        return itemVector
end


-- throws MoneyException
function InventoryEntity:getItem(id)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(self.basicItemData.ID, id)
        local itemHashMap = AbSqlBean.getRow(self, keysAndValues)
        if itemHashMap ~= nil then
            return BasicItem.new(itemHashMap)
        else
            return nil
        end
end


function InventoryEntity:getWeight(id)
        return AbSqlBean.getField(self, self.basicItemData.ID, id, self.basicItemData.WEIGHT)
end


function InventoryEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(self.basicItemData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.NUMBER)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.INBASKETS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.WEIGHT)
        stringBuffer:append(" VARCHAR(20) NOT NULL,")
        stringBuffer:append(EntryData.getInstance().ENABLE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.NEWORUSED)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.SUMMARY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.DISTRIBUTOR)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.IDUSEDBYDISTRIBUTOR)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRODUCEDBY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRODUCTIONDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.STARTPRODUCTIONDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.DESCRIPTION)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(self.basicItemData.KEYWORDS)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.CATEGORY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.TYPE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.SMALLIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.MEDIUMIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.LARGEIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRICE)
        stringBuffer:append(" VARCHAR(20) NOT NULL,")
        stringBuffer:append(self.basicItemData.COMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(self.basicItemData.CUSTOMS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.DOWNLOADS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.GROUPS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.OPTIONS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.PERMISSIONS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.SPECIALS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(self.basicItemData.ID)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function InventoryEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function InventoryEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, self.basicItemData.ID, updatedValues:get(self.basicItemData.ID), updatedValues)
end


function InventoryEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return InventoryEntity


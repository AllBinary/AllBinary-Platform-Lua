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
-- package org.allbinary.data.tables.user.commerce.inventory.item.options

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local InventoryDbInitInfo = require("org.allbinary.business.init.db.InventoryDbInitInfo")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicOptionItemData = require("org.allbinary.business.user.commerce.inventory.item.option.BasicOptionItemData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicOptionItemsEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.item.options.BasicOptionItemsEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicOptionItemsEntity = {}
BasicOptionItemsEntity.__index = BasicOptionItemsEntity
BasicOptionItemsEntity.className = "BasicOptionItemsEntity"
setmetatable(BasicOptionItemsEntity, {__index = AbSqlBean})

function BasicOptionItemsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "basicoptionitems"
end


function BasicOptionItemsEntity.new()
    local self = setmetatable(AbSqlBean.new(InventoryDbInitInfo.new()), BasicOptionItemsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function BasicOptionItemsEntity:insert(values)
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


function BasicOptionItemsEntity:delete(value)
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


function BasicOptionItemsEntity:createTableStatement()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(self.basicItemData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(BasicOptionItemData.OPTION_ONE_TITLE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.DEFAULT_OPTION_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.DEFAULT_OPTION_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(BasicOptionItemData.OPTION_ONE_ONE_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_ONE_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_TWO_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_TWO_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_THREE_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_THREE_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_FOUR_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_FOUR_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_FIVE_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_FIVE_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_SIX_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_SIX_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_NINE_ITEM):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(BasicOptionItemData.OPTION_ONE_NINE_VALUE):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(self.basicItemData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function BasicOptionItemsEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function BasicOptionItemsEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, self.basicItemData.ID, updatedValues:get(self.basicItemData.ID), updatedValues)
end


function BasicOptionItemsEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return BasicOptionItemsEntity


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
-- package org.allbinary.data.tables.advertisement

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local AdvertisementData = require("org.allbinary.business.advertisement.AdvertisementData")
local AdvertisementInterface = require("org.allbinary.business.advertisement.AdvertisementInterface")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AdvertisementsEntityInterface = require("org.allbinary.data.tables.advertisement.AdvertisementsEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementsEntity = {}
AdvertisementsEntity.__index = AdvertisementsEntity
AdvertisementsEntity.className = "AdvertisementsEntity"
setmetatable(AdvertisementsEntity, {__index = AbSqlBean})

function AdvertisementsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "advertisements"
    self._INDEX = "_index"
end


function AdvertisementsEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), AdvertisementsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function AdvertisementsEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, EntryData.getInstance().ID, value)
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


function AdvertisementsEntity:get(storeName)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
        local hashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local vector = BasicArrayListD.new()
        local size = hashMapVector:size()
        for index = 0, size - 1 do
            local hashMap = hashMapVector:get(index)
        end
        return vector
end


-- Java overloaded method: Lua keeps the last definition
function AdvertisementsEntity:get(storeName, advertismentName)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
        keysAndValues:put(AdvertisementData.getInstance().NAME, advertismentName)
        local hashMap = AbSqlBean.getRow(self, keysAndValues)
        return nil
end


function AdvertisementsEntity:createTableStatement()
        local advertisementData = AdvertisementData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self:getTableName()):append(self.sqlStrings.START):append(advertisementData.NAME):append(self._INDEX):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(advertisementData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(advertisementData.DESCRIPTION):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(DynamicObjectData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(advertisementData.NAME):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function AdvertisementsEntity:createTable()
        local returnStr = AbSqlBean.createTable(self, self:createTableStatement())
        return returnStr
end


function AdvertisementsEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, EntryData.getInstance().ID, updatedValues:get(EntryData.getInstance().ID), updatedValues)
end


function AdvertisementsEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return AdvertisementsEntity


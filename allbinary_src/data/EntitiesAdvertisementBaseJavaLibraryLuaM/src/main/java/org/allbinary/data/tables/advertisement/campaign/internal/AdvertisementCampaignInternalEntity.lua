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
-- package org.allbinary.data.tables.advertisement.campaign.internal

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AdvertisementCampaign = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaign")
local AdvertisementCampaignData = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignData")
local AdvertisementCampaignInterface = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignInterface")
local AdvertisementCampaigns = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaigns")
local AdvertisementCampaignsInterface = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignsInterface")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local TimeData = require("org.allbinary.business.time.TimeData")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AdvertisementCampaignInternalEntityInterface = require("org.allbinary.data.tables.advertisement.campaign.internal.AdvertisementCampaignInternalEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementCampaignInternalEntity = {}
AdvertisementCampaignInternalEntity.__index = AdvertisementCampaignInternalEntity
AdvertisementCampaignInternalEntity.className = "AdvertisementCampaignInternalEntity"
setmetatable(AdvertisementCampaignInternalEntity, {__index = AbSqlBean})

function AdvertisementCampaignInternalEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "adCampaignInternal"
end


function AdvertisementCampaignInternalEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), AdvertisementCampaignInternalEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function AdvertisementCampaignInternalEntity:delete(value)
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


function AdvertisementCampaignInternalEntity:getCampaignsInStore(storeName)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
        local hashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local vector = BasicArrayListD.new()
        local size = hashMapVector:size()
        for index = 0, size - 1 do
            local hashMap = hashMapVector:get(index)
            if hashMap ~= nil then
                vector:add(AdvertisementCampaign.new(hashMap))
            end
        end
        return AdvertisementCampaigns.new(vector)
end


function AdvertisementCampaignInternalEntity:get(storeName, name)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
        keysAndValues:put(AdvertisementCampaignData.getInstance().NAME, name)
        local hashMap = AbSqlBean.getRow(self, keysAndValues)
        if hashMap ~= nil then
            return AdvertisementCampaign.new(hashMap)
        else
            return nil
        end
end


function AdvertisementCampaignInternalEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, EntryData.getInstance():getInstance().ID, updatedValues:get(EntryData.getInstance():getInstance().ID), updatedValues)
end


function AdvertisementCampaignInternalEntity:createTableStatement()
        local entryData = EntryData.getInstance():getInstance()
        local advertisementCampaignData = AdvertisementCampaignData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(entryData.ID):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(advertisementCampaignData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(advertisementCampaignData.DESCRIPTION):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(advertisementCampaignData.CONFIG):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(TimeData.getInstance().START):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(TimeData.getInstance().END):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(entryData.LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(entryData.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function AdvertisementCampaignInternalEntity:createTable()
        local returnStr = AbSqlBean.createTable(self, self:createTableStatement())
        return returnStr
end


function AdvertisementCampaignInternalEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return AdvertisementCampaignInternalEntity


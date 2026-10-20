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
-- package org.allbinary.data.tables.advertisement.areas

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AdvertisementArea = require("org.allbinary.business.advertisement.area.AdvertisementArea")
local AdvertisementAreaData = require("org.allbinary.business.advertisement.area.AdvertisementAreaData")
local AdvertisementAreaInterface = require("org.allbinary.business.advertisement.area.AdvertisementAreaInterface")
local AdvertisementCampaignData = require("org.allbinary.business.advertisement.campaign.AdvertisementCampaignData")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AdvertisementAreasEntityInterface = require("org.allbinary.data.tables.advertisement.areas.AdvertisementAreasEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdvertisementAreasEntity = {}
AdvertisementAreasEntity.__index = AdvertisementAreasEntity
AdvertisementAreasEntity.className = "AdvertisementAreasEntity"
setmetatable(AdvertisementAreasEntity, {__index = AbSqlBean})

function AdvertisementAreasEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "advertisements"
end


function AdvertisementAreasEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), AdvertisementAreasEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function AdvertisementAreasEntity:delete(value)
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


-- throws Exception
function AdvertisementAreasEntity:get(storeName)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
        local hashMapVector = AbSqlBean.getRows(self, keysAndValues)
        local vector = BasicArrayListD.new()
        local size = hashMapVector:size()
        for index = 0, size - 1 do
            local hashMap = hashMapVector:get(index)
            if hashMap ~= nil then
                vector:add(AdvertisementArea.new(hashMap))
            end
        end
        return vector
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AdvertisementAreasEntity:get(storeName, advertisementAreaName)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
        keysAndValues:put(AdvertisementAreaData.getInstance().NAME, advertisementAreaName)
        local hashMap = AbSqlBean.getRow(self, keysAndValues)
        if hashMap ~= nil then
            return AdvertisementArea.new(hashMap)
        else
            return nil
        end
end


function AdvertisementAreasEntity:createTableStatement()
        local advertisementAreaData = AdvertisementAreaData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self:getTableName())
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(advertisementAreaData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(advertisementAreaData.DESCRIPTION):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(advertisementAreaData.CONSTRAINTS):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(AdvertisementCampaignData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(advertisementAreaData.NAME):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function AdvertisementAreasEntity:createTable()
        local returnStr = AbSqlBean.createTable(self, self:createTableStatement())
        return returnStr
end


function AdvertisementAreasEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, AdvertisementAreaData.getInstance().NAME, updatedValues:get(AdvertisementAreaData.getInstance().NAME), updatedValues)
end


function AdvertisementAreasEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return AdvertisementAreasEntity


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
-- package org.allbinary.data.tables.context.module.storefronts

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StoreFrontsEntityInterface = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontsEntity = {}
StoreFrontsEntity.__index = StoreFrontsEntity
StoreFrontsEntity.className = "StoreFrontsEntity"
setmetatable(StoreFrontsEntity, {__index = AbSqlBean})

function StoreFrontsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "storefronts"
end


function StoreFrontsEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), StoreFrontsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function StoreFrontsEntity:insert(values)
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


function StoreFrontsEntity:delete(value)
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


-- throws Exception
function StoreFrontsEntity:getStoreFrontInterface(name)
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(StoreFrontData.getInstance().NAME, name)
        local storeHashMap = AbSqlBean.getRow(self, keysAndValues)
        if storeHashMap ~= nil then
            return StoreFront.new(storeHashMap)
        else
            return StoreFront.new()
        end
end


function StoreFrontsEntity:getStoreFrontNames()
        local storeFrontNames = AbSqlBean.getColumn(self, StoreFrontData.getInstance().NAME)
        return storeFrontNames
end


function StoreFrontsEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, StoreFrontData.getInstance().NAME, updatedValues:get(StoreFrontData.getInstance().NAME), updatedValues)
end


function StoreFrontsEntity:createTableStatement()
        local storeFrontData = StoreFrontData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(storeFrontData.NAME)
        stringBuffer:append(self.sqlTypeStrings.SIXTY_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.HOMEHOSTNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.HOMEHOSTNAMEPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.HOSTNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.HOSTNAMEPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTHOMEHOSTNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTHOMEHOSTNAMEPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTHOSTNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTHOSTNAMEPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.IMAGEPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.STATICPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.CATEGORYPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.INVENTORYCONTROL)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.CONFIGURATION)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(storeFrontData.SUBSTORES)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TAGLOCATION)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.PACKAGELOCATION)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.FTP)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.FTPPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.FTPUSERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.FTPPASSWORD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTFTP)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTFTPPATH)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTFTPUSERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(storeFrontData.TESTFTPPASSWORD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(EntryData.getInstance():getInstance().LASTMODIFIED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(storeFrontData.NAME)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function StoreFrontsEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function StoreFrontsEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return StoreFrontsEntity


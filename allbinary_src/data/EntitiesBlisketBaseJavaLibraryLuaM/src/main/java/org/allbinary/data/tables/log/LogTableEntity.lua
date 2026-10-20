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
-- package org.allbinary.data.tables.log

local EntryData = require("org.allbinary.business.entry.EntryData")
local LogDbInitInfo = require("org.allbinary.business.init.db.LogDbInitInfo")
local AbeHttpRequestInfoData = require("org.allbinary.logic.communication.http.request.AbeHttpRequestInfoData")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogTableEntityInterface = require("org.allbinary.data.tables.log.LogTableEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogTableEntity = {}
LogTableEntity.__index = LogTableEntity
LogTableEntity.className = "LogTableEntity"
setmetatable(LogTableEntity, {__index = AbSqlBean})

function LogTableEntity:_init_fields()
    self.tableName = "log"
end


function LogTableEntity.new()
    local self = setmetatable(AbSqlBean.new(LogDbInitInfo.new()), LogTableEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function LogTableEntity:createTableStatement()
        local abeHttpRequestInfoData = AbeHttpRequestInfoData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(self.sqlStrings.ID):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.HTTP_USER_AGENT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.REMOTE_HOST):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(abeHttpRequestInfoData.REMOTE_ADDRESS):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.REQUEST_FILE_PATH):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.REMOTE_PORT):append(self.sqlTypeStrings.MAX_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(self.sqlStrings.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function LogTableEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end

return LogTableEntity


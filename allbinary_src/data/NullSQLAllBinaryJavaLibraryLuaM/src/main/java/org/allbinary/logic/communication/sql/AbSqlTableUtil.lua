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
-- package org.allbinary.logic.communication.sql

local Portion = require("org.allbinary.business.installer.Portion")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbSqlTableUtil = {}
AbSqlTableUtil.__index = AbSqlTableUtil
AbSqlTableUtil.className = "AbSqlTableUtil"

function AbSqlTableUtil:_init_fields()
    self.TABLE_LABEL = "Table: "
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.sqlStrings = SqlStrings.getInstance()
end

function AbSqlTableUtil.new()
    local self = setmetatable({}, AbSqlTableUtil)
    self:_init_fields()
    return self
end


function AbSqlTableUtil.getInstance()
        return AbSqlTableUtil.instance
end


function AbSqlTableUtil:backupTable(abSqlTable)
        local tableName = abSqlTable:getTableName()
        return self.TABLE_LABEL .. tableName .. " Backup Failed"
end


function AbSqlTableUtil:restoreTable(abSqlTable, portion)
        local tableName = abSqlTable:getTableName()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.TABLE_LABEL)
        stringBuffer:append(tableName)
        stringBuffer:append(" Restoration Failed")
        return tostring(stringBuffer)
end

AbSqlTableUtil.instance = AbSqlTableUtil.new()

return AbSqlTableUtil


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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local Portion = require("org.allbinary.business.installer.Portion")
local LogTableEntity = require("org.allbinary.data.tables.log.LogTableEntity")
local LogTableEntityFactory = require("org.allbinary.data.tables.log.LogTableEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local BasicTable = require("admin.taghelpers.BasicTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogHelper = {}
LogHelper.__index = LogHelper
LogHelper.className = "LogHelper"
setmetatable(LogHelper, {__index = BasicTable})

function LogHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.portion = nil
end


function LogHelper.new(hashMap, pageContext)
    local self = setmetatable(BasicTable.new(), LogHelper)
    self:_init_fields()
        self.portion = Portion.new(hashMap)
    return self
end


function LogHelper:drop()
        local try_ok, try_error = pcall(function()
            return LogTableEntityFactory.getInstance():getLogTableEntityInstance():dropTable()
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop log table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function LogHelper:create()
        local try_ok, try_error = pcall(function()
            return LogTableEntityFactory.getInstance():getLogTableEntityInstance():createTable()
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create new log table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function LogHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local logTableEntity = LogTableEntityFactory.getInstance():getLogTableEntityInstance()
            local result = AbSqlTableUtil.getInstance():restoreTable(logTableEntity, self.portion)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "restore()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to restore backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
end


function LogHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Backup Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(LogTableEntityFactory.getInstance():getLogTableEntityInstance())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "backup()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to make backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
end

return LogHelper


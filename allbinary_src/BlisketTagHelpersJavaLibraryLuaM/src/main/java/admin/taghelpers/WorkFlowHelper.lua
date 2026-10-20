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
local WorkFlowEntityFactory = require("org.allbinary.data.tables.workflow.WorkFlowEntityFactory")
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

local WorkFlowHelper = {}
WorkFlowHelper.__index = WorkFlowHelper
WorkFlowHelper.className = "WorkFlowHelper"
setmetatable(WorkFlowHelper, {__index = BasicTable})

function WorkFlowHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = nil
    self.pageContext = nil
    self.portion = nil
end


function WorkFlowHelper.new(hashMap, pageContext)
    local self = setmetatable(BasicTable.new(), WorkFlowHelper)
    self:_init_fields()
        self.hashMap = hashMap
        self.pageContext = pageContext
        self.portion = Portion.new(hashMap)
    return self
end


function WorkFlowHelper:drop()
        local try_ok, try_error = pcall(function()
            return WorkFlowEntityFactory.getInstance():create2():dropTable()
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop view info table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function WorkFlowHelper:create()
        local try_ok, try_error = pcall(function()
            return WorkFlowEntityFactory.getInstance():create2():createTable()
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create workflow table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function WorkFlowHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(WorkFlowEntityFactory.getInstance():create2(), self.portion)
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


function WorkFlowHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(WorkFlowEntityFactory.getInstance():create2())
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

return WorkFlowHelper


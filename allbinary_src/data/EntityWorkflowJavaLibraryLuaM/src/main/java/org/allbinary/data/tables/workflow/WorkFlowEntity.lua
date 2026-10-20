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
-- package org.allbinary.data.tables.workflow

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local DbWorkFlowFactory = require("org.allbinary.logic.control.workflow.DbWorkFlowFactory")
local WorkFlowData = require("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local WorkFlowEntityInterface = require("org.allbinary.data.tables.workflow.WorkFlowEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WorkFlowEntity = {}
WorkFlowEntity.__index = WorkFlowEntity
WorkFlowEntity.className = "WorkFlowEntity"
setmetatable(WorkFlowEntity, {__index = AbSqlBean})

function WorkFlowEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.tableName = "workflows"
    self.METHOD_GET = "get()"
    self.METHOD_UPDATE = "update"
end


function WorkFlowEntity.new()
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), WorkFlowEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function WorkFlowEntity:insert(values)
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


function WorkFlowEntity:delete(name, storeName)
        local try_ok, try_error = pcall(function()
            local keysAndValues = StdUtil.getInstance():createHashMap()
            keysAndValues:put(WorkFlowData.getInstance().NAME, name)
            keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
            AbSqlBean.deleteWhere(self, keysAndValues)
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


-- throws Exception, LicensingException
function WorkFlowEntity:get(name, storeName)
        local try_ok, try_error = pcall(function()
            local keysAndValues = StdUtil.getInstance():createHashMap()
            keysAndValues:put(WorkFlowData.getInstance().NAME, name)
            keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
            local hashMap = AbSqlBean.getRow(self, keysAndValues)
            return DbWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, hashMap)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.METHOD_GET, e)
            end
            error(e, 0)
        end
end


-- Java overloaded method: Lua keeps the last definition
function WorkFlowEntity:get(storeName)
        local try_ok, try_error = pcall(function()
            local workFlowsVector = BasicArrayListD.new()
            local keysAndValues = StdUtil.getInstance():createHashMap()
            keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
            local hashMapVector = AbSqlBean.getRows(self, keysAndValues)
            local size = hashMapVector:size()
            for i = 0, size - 1 do
                local workFlowHashMap = hashMapVector:get(i)
                if workFlowHashMap ~= nil then
                    workFlowsVector:add(DbWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, workFlowHashMap))
                end
            end
            return workFlowsVector
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.METHOD_GET, e)
            end
            return nil
        end
end


function WorkFlowEntity:update(updatedValues)
        local try_ok, try_error = pcall(function()
            local wherekeysAndValues = StdUtil.getInstance():createHashMap()
            wherekeysAndValues:put(WorkFlowData.getInstance().NAME, updatedValues:get(WorkFlowData.getInstance().NAME))
            wherekeysAndValues:put(StoreFrontData.getInstance().NAME, updatedValues:get(StoreFrontData.getInstance().NAME))
            AbSqlBean.updateWhere(self, wherekeysAndValues, updatedValues)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.METHOD_UPDATE, e)
            end
        end
end


function WorkFlowEntity:createTableStatement()
        local workFlowData = WorkFlowData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(workFlowData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DynamicObjectData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(workFlowData.DATA):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(workFlowData.NAME):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function WorkFlowEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function WorkFlowEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return WorkFlowEntity


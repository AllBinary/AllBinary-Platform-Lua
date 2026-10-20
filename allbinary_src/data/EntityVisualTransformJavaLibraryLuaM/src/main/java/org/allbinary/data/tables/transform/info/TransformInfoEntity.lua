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
-- package org.allbinary.data.tables.transform.info

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = require("org.allbinary.business.init.db.UserDbInitInfo")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local Encoder = require("org.allbinary.logic.control.crypt.Encoder")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoFactoryInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoFactoryInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigAndManipulatorFactoryBase = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase")
local TransformInfoObjectConfigGeneratorFactoryInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactoryInterface")
local TransformInfoEntityInterface = require("org.allbinary.data.tables.transform.info.TransformInfoEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoEntity = {}
TransformInfoEntity.__index = TransformInfoEntity
TransformInfoEntity.className = "TransformInfoEntity"
setmetatable(TransformInfoEntity, {__index = AbSqlBean})

function TransformInfoEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "transforminfo"
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.transformInfoFactoryInterface = nil
    self.transformInfoObjectConfigAndManipulatorFactoryInterface = nil
    self.transformInfoObjectConfigGeneratorFactoryInterface = nil
end


function TransformInfoEntity.new(transformInfoObjectConfigGeneratorFactoryInterface, transformInfoObjectConfigAndManipulatorFactoryInterface, transformInfoFactoryInterface)
    local self = setmetatable(AbSqlBean.new(UserDbInitInfo.new()), TransformInfoEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
        self.transformInfoObjectConfigGeneratorFactoryInterface = transformInfoObjectConfigGeneratorFactoryInterface
        self.transformInfoObjectConfigAndManipulatorFactoryInterface = transformInfoObjectConfigAndManipulatorFactoryInterface
        self.transformInfoFactoryInterface = transformInfoFactoryInterface
    return self
end


function TransformInfoEntity:insert(values)
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


function TransformInfoEntity:delete(value)
        local try_ok, try_error = pcall(function()
            AbSqlBean.deleteWhere(self, TransformInfoData.getInstance().NAME, value)
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
function TransformInfoEntity:get(name, propertiesHashMap, pageContext)
        local transformInfoData = TransformInfoData.getInstance()
        local keysAndValues = StdUtil.getInstance():createHashMap()
        keysAndValues:put(transformInfoData.NAME, name)
        local hashMap = AbSqlBean.getRow(self, keysAndValues)
        if hashMap ~= nil then
            local anyType = hashMap:get(transformInfoData.OBJECTCONFIG)
            if anyType ~= nil then
                local string = anyType
                hashMap:put(transformInfoData.OBJECTCONFIG, tostring(Encoder.decode(string)))
            end
            local objectData = hashMap:get(transformInfoData.DATA)
            if objectData ~= nil then
                local string = objectData
                hashMap:put(transformInfoData.DATA, tostring(Encoder.decode(string)))
            end
            return self.transformInfoFactoryInterface:getInstance(hashMap, propertiesHashMap, pageContext)
        else
            return nil
        end
end


-- throws Exception
function TransformInfoEntity:getObjectConfigs(storeName)
        local objectConfigVector = BasicArrayListD.new()
        local objectConfigColumnVector = self:getColumnWhere(TransformInfoData.getInstance().OBJECTCONFIG, StoreFrontData.getInstance().NAME, storeName)
        local size = objectConfigColumnVector:size()
        for i = 0, size - 1 do
            local objectConfigString = objectConfigColumnVector:get(i)
            objectConfigString = tostring(Encoder.decode(objectConfigString))
            objectConfigVector:add(self.transformInfoObjectConfigAndManipulatorFactoryInterface:getInstance(self.abeClientInformation, self, DomDocumentHelper.create(objectConfigString)))
        end
        return objectConfigVector
end


-- throws Exception
function TransformInfoEntity:getNames(storeName)
        local viewNameVector = BasicArrayListD.new()
        local columnVector = self:getColumnWhere(TransformInfoData.getInstance().NAME, StoreFrontData.getInstance().NAME, storeName)
        local size = columnVector:size()
        for i = 0, size - 1 do
            local viewNameString = columnVector:get(i)
            viewNameVector:add(viewNameString)
        end
        return viewNameVector
end


function TransformInfoEntity:createTableStatement()
        local transformInfoData = TransformInfoData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE)
        stringBuffer:append(self.tableName)
        stringBuffer:append(self.sqlStrings.START)
        stringBuffer:append(transformInfoData.NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(StoreFrontData.getInstance().NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(transformInfoData.OBJECTFILENAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(transformInfoData.OBJECT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(transformInfoData.OBJECTCONFIGFILENAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(transformInfoData.OBJECTCONFIG)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(transformInfoData.TEMPLATEFILENAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(transformInfoData.TEMPLATE)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(transformInfoData.DATAFILENAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(transformInfoData.DATA)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(EntryData.getInstance().LASTMODIFIED)
        stringBuffer:append(EntryData.getInstance().TIMECREATED)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.sqlStrings.PRIMARY_KEY)
        stringBuffer:append(transformInfoData.NAME)
        stringBuffer:append(self.sqlStrings.END)
        return tostring(stringBuffer)
end


function TransformInfoEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function TransformInfoEntity:update(updatedValues)
        AbSqlBean.updateWhere(self, TransformInfoData.getInstance().NAME, updatedValues:get(TransformInfoData.getInstance().NAME), updatedValues)
end


function TransformInfoEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return TransformInfoEntity


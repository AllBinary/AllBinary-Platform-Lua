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
-- package org.allbinary.logic.visual.transform.info

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Encoder = require("org.allbinary.logic.control.crypt.Encoder")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local OutputTypeData = require("org.allbinary.logic.io.OutputTypeData")
local AbFilePath = require("org.allbinary.logic.io.path.AbFilePath")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoDataData = require("org.allbinary.logic.visual.transform.info.data.TransformInfoDataData")
local TransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local TransformInfoObjectConfigAndManipulatorFactory = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local TransformInfoTemplateData = require("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")
local TransformInfoObjectData = require("org.allbinary.logic.visual.transform.info.viewObject.TransformInfoObjectData")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfo = {}
TransformInfo.__index = TransformInfo
TransformInfo.className = "TransformInfo"

function TransformInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.isChild = false
    self.name = nil
    self.storeName = nil
    self.objectFileName = nil
    self.anyType = nil
    self.objectConfigFileName = nil
    self.objectConfigInterface = nil
    self.template = nil
    self.templateFileName = nil
    self.dataFileName = nil
    self.data = StringUtil.getInstance().EMPTY_STRING
end

function TransformInfo.new(...)
    local count = select("#", ...)
    if count == 0 then return TransformInfo._new0(...)
    elseif count == 1 then return TransformInfo._new1(...)
    elseif count == 5 then return TransformInfo._new5(...)
    end
end


function TransformInfo._new0()
    local self = setmetatable({}, TransformInfo)
    self:_init_fields()
    return self
end


function TransformInfo._new1(name)
    local self = setmetatable({}, TransformInfo)
    self:_init_fields()
        self:setName(name)
    return self
end


function TransformInfo._new5(name, objectFileName, objectConfigFileName, templateFileName, dataFileName)
    local self = setmetatable({}, TransformInfo)
    self:_init_fields()
        self:setName(name)
        self:setObjectFile(objectFileName)
        self:setObjectConfigFile(objectConfigFileName)
        self:setTemplateFile(templateFileName)
        self:setDataFile(dataFileName)
    return self
end


-- throws Exception
function TransformInfo:override(hashMap)
        local transformInfoData = TransformInfoData.getInstance()
        local stringValidationUtil = StringValidationUtil.getInstance()
        local aName = hashMap:get(transformInfoData.NAME)
        if not stringValidationUtil:isEmpty(aName) then
            self.name = aName
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo properties overridden for: ")
            stringBuffer:append(self:getName())
            stringBuffer:append("\n properties: ")
            stringBuffer:append(tostring(hashMap))
            self.logUtil:putF(tostring(stringBuffer), self, "override(HashMap hashMap)")
        end
        local aStoreName = hashMap:get(StoreFrontData.getInstance().NAME)
        if not stringValidationUtil:isEmpty(aStoreName) then
            self.storeName = aStoreName
        end
        local aObjectFileName = hashMap:get(transformInfoData.OBJECTFILENAME)
        if not stringValidationUtil:isEmpty(aObjectFileName) then
            self.objectFileName = aObjectFileName
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(self.storeName)
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        local fileAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        local aObject = hashMap:get(transformInfoData.OBJECT)
        if not stringValidationUtil:isEmpty(aObject) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TransformInfo override view Object for: " .. self:getName(), self, "override(HashMap hashMap)")
            end
            local fileDataString = CryptFileReader.new(TransformInfoObjectData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectData.getInstance().ENCRYPTED_EXTENSION):get(AbPath.new(tostring(fileAbPath), aObject))
            if fileDataString ~= nil then
                self.anyType = fileDataString
            end
        end
        if not stringValidationUtil:isEmpty(hashMap:get(transformInfoData.OBJECTCONFIG)) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TransformInfo override ObjectConfig for: " .. self:getName(), self, "override(HashMap hashMap)")
            end
            self:setObjectConfig(hashMap:get(transformInfoData.OBJECTCONFIG))
        end
        local objectConfigFileName = hashMap:get(transformInfoData.OBJECTCONFIGFILENAME)
        if not stringValidationUtil:isEmpty(objectConfigFileName) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TransformInfo override ObjectConfig File for: " .. self:getName(), self, "override(HashMap hashMap)")
            end
            self:setObjectConfigFile(objectConfigFileName)
        end
        local type = hashMap:get(OutputTypeData.getInstance().NAME)
        if not stringValidationUtil:isEmpty(type) then
            if self:getObjectConfigInterface() == nil then
                self:setObjectConfigInterface(TransformInfoObjectConfig.new(self))
            end
            self:getObjectConfigInterface():setOutputTypeName(type)
        end
        local aTemplateFileName = hashMap:get(transformInfoData.TEMPLATEFILENAME)
        if not stringValidationUtil:isEmpty(aTemplateFileName) then
            self.templateFileName = aTemplateFileName
        end
        local aTemplate = hashMap:get(transformInfoData.TEMPLATE)
        if not stringValidationUtil:isEmpty(aTemplate) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TransformInfo override Template for: " .. self:getName(), self, "override(HashMap hashMap)")
            end
            local fileDataString = CryptFileReader.new(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION):get(AbPath.new(tostring(fileAbPath), aTemplate))
            if not stringValidationUtil:isEmpty(fileDataString) then
                self.template = fileDataString
            end
        end
        local aDataFileName = hashMap:get(transformInfoData.DATAFILENAME)
        if not stringValidationUtil:isEmpty(aDataFileName) then
            self.dataFileName = aDataFileName
        end
        local aData = hashMap:get(transformInfoData.DATA)
        if not stringValidationUtil:isEmpty(aData) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TransformInfo override Data for: " .. self:getName(), self, "override(HashMap hashMap)")
            end
            local fileDataString = CryptFileReader.new(TransformInfoDataData.getInstance().UNCRYPTED_EXTENSION, TransformInfoDataData.getInstance().ENCRYPTED_EXTENSION):get(AbPath.new(tostring(fileAbPath), aData))
            if not stringValidationUtil:isEmpty(fileDataString) then
                self.data = fileDataString
            end
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            stringBuffer = StringMaker.new()
            stringBuffer:append("Name: ")
            stringBuffer:append(aName)
            stringBuffer:append("\nTemp Object File: ")
            stringBuffer:append(aObject)
            stringBuffer:append("\nTemp Object Config File: ")
            stringBuffer:append(tostring(self:getObjectConfigFilePath()))
            stringBuffer:append("\nTemp Template File: ")
            stringBuffer:append(aTemplate)
            stringBuffer:append("\nTemp Data File: ")
            stringBuffer:append(aData)
            stringBuffer:append("\nStore Name: ")
            stringBuffer:append(aStoreName)
            stringBuffer:append("\nObjectFile: ")
            stringBuffer:append(self:getObjectFile())
            stringBuffer:append("->TransformInfo")
            self.logUtil:putF(tostring(stringBuffer), self, "TransformInfoInterface(HashMap)")
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
            self.logUtil:putF(self:log(), self, "override")
        end
end


function TransformInfo:log()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Name: ")
        stringBuffer:append(self.name)
        stringBuffer:append("\nObject File: ")
        stringBuffer:append(self.objectFileName)
        stringBuffer:append("\nObject Config File Path: ")
        stringBuffer:append(self:getObjectConfigFile())
        stringBuffer:append("\nTemplate File: ")
        stringBuffer:append(self.templateFileName)
        stringBuffer:append("\nData File: ")
        stringBuffer:append(self.dataFileName)
        stringBuffer:append("\nStore Name: ")
        stringBuffer:append(self.storeName)
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append(self:getObjectFile())
        stringBuffer:append("->TransformInfo")
        stringBuffer:append("TransformInfoInterface(HashMap)")
        return tostring(stringBuffer)
end


function TransformInfo:setName(value)
        self.name = value
end


function TransformInfo:setStoreName(value)
        self.storeName = value
end


function TransformInfo:getStoreName()
        return self.storeName
end


function TransformInfo:setObject(anyType)
        self.anyType = anyType
end


function TransformInfo:setObjectFile(value)
        self.objectFileName = value
end


function TransformInfo:setTemplate(value)
        self.template = value
end


function TransformInfo:setTemplateFile(value)
        self.templateFileName = value
end


-- throws Exception
function TransformInfo:setObjectConfigFileName(value)
        self.objectConfigFileName = value
end


-- throws Exception
function TransformInfo:setObjectConfigFile(value)
        self.objectConfigFileName = value
        self:setObjectConfigInterface(TransformInfoObjectConfigAndManipulatorFactory.getInstance():getInstance(self.abeClientInformation, self, self:getObjectConfigFilePath()))
end


-- throws Exception
function TransformInfo:setObjectConfig(value)
        local document = DomDocumentHelper.create(value)
        self:setObjectConfigInterface(TransformInfoObjectConfigAndManipulatorFactory.getInstance():getInstance(self.abeClientInformation, self, document))
end


function TransformInfo:setDataFile(value)
        self.dataFileName = value
end


function TransformInfo:setData(value)
        self.data = value
end


function TransformInfo:getName()
        return self.name
end


function TransformInfo:getObject()
        return self.anyType
end


function TransformInfo:getObjectFile()
        return self.objectFileName
end


function TransformInfo:getTemplate()
        return self.template
end


function TransformInfo:getTemplateFile()
        return self.templateFileName
end


-- throws Exception
function TransformInfo:getTemplateFilePath()
        return AbFilePath.new(self:getTemplateFile())
end


-- throws Exception
function TransformInfo:getObjectConfigFilePath()
        return AbFilePath.new(self:getObjectConfigFile())
end


-- throws Exception
function TransformInfo:getDataFilePath()
        return AbFilePath.new(self:getDataFile())
end


function TransformInfo:getObjectConfigFile()
        return self.objectConfigFileName
end


function TransformInfo:getData()
        local stringValidationUtil = StringValidationUtil.getInstance()
        local dataFileString = self:getDataFile()
        if not stringValidationUtil:isEmpty(dataFileString) then
            local try_ok, try_error = pcall(function()
                local fileData = CryptFileReader.new(TransformInfoDataData.getInstance().UNCRYPTED_EXTENSION, TransformInfoDataData.getInstance().ENCRYPTED_EXTENSION):get(self:getDataFilePath())
                if not stringValidationUtil:isEmpty(self.data) then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        self.logUtil:putF("Data File overriding existing data: " .. tostring(self:getDataFilePath()), self, "getData()")
                    end
                end
                self.data = fileData
            end)
            if not try_ok then
                local e = try_error
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                    self.logUtil:put("Could Not Load Data from: " .. tostring(self:getDataFile()), self, "getData()", e)
                end
            end
        end
        local try_ok, try_error = pcall(function()
            if not stringValidationUtil:isEmpty(self.data) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                    self.logUtil:putF("Data: " .. XmlDocumentHelper.toString(DomDocumentHelper.create(self.data)), self, "getData()")
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Name: ")
                    stringBuffer:append(self.name)
                    stringBuffer:append("\nEmpty Data For: ")
                    stringBuffer:append(dataFileString)
                    stringBuffer:append("\nPath: ")
                    stringBuffer:append(self:getDataFilePath():toFileSystemString())
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                        self.logUtil:putF(tostring(stringBuffer), self, "getData()")
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Could Not Preview Data: " .. self.data, self, "getData()", e)
            end
        end
        return self.data
end


-- throws Exception
function TransformInfo:getDataDocument()
        local localData = self:getData()
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(localData) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:putF("No Data So Creating New Document", self, "getDataDocument()")
            end
            return DomDocumentHelper.create()
        else
            local document = DomDocumentHelper.create(localData)
            return document
        end
end


function TransformInfo:getDataFile()
        return self.dataFileName
end


function TransformInfo:toHashMap()
        local transformInfoData = TransformInfoData.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(transformInfoData.NAME, self.name)
        hashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
        hashMap:put(transformInfoData.OBJECTFILENAME, self.objectFileName)
        hashMap:put(transformInfoData.OBJECT, self.anyType)
        hashMap:put(transformInfoData.OBJECTCONFIGFILENAME, self:getObjectConfigFile())
        hashMap:put(transformInfoData.OBJECTCONFIG, Encoder.encode({string.byte(tostring(self:getObjectConfigInterface()), 1, -1)}))
        hashMap:put(transformInfoData.TEMPLATEFILENAME, self.templateFileName)
        hashMap:put(transformInfoData.TEMPLATE, self.template)
        hashMap:put(transformInfoData.DATAFILENAME, self.dataFileName)
        hashMap:put(transformInfoData.DATA, Encoder.encode({string.byte(self.data, 1, -1)}))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        hashMap:put(EntryData.getInstance().LASTMODIFIED, time)
        return hashMap
end


function TransformInfo:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.name)
        vector:add(self.storeName)
        vector:add(self.objectFileName)
        vector:add(self.anyType)
        vector:add(self:getObjectConfigFile())
        vector:add(Encoder.encode({string.byte(tostring(self:getObjectConfigInterface()), 1, -1)}))
        vector:add(self.templateFileName)
        vector:add(self.template)
        vector:add(self.dataFileName)
        vector:add(Encoder.encode({string.byte(self.data, 1, -1)}))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        vector:add(time)
        vector:add(time)
        return vector
end


function TransformInfo:getKey()
        return self:getName()
end


function TransformInfo:setChild()
        self.isChild = true
end


function TransformInfo:isChild()
        return self.isChild
end


function TransformInfo:getObjectConfigInterface()
        return self.objectConfigInterface
end


function TransformInfo:setObjectConfigInterface(objectConfigInterface)
        self.objectConfigInterface = objectConfigInterface
end

return TransformInfo


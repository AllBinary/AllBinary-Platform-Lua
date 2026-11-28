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

local TransformInfo = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfo"] = TransformInfo

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Calendar = java_lazy("java.util.Calendar")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Encoder = java_lazy("org.allbinary.logic.control.crypt.Encoder")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local OutputTypeData = java_lazy("org.allbinary.logic.io.OutputTypeData")
local AbFilePath = java_lazy("org.allbinary.logic.io.path.AbFilePath")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TransformInfoDataData = java_lazy("org.allbinary.logic.visual.transform.info.data.TransformInfoDataData")
local TransformInfoObjectConfig = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local TransformInfoObjectConfigAndManipulatorFactory = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local TransformInfoTemplateData = java_lazy("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")
local TransformInfoObjectData = java_lazy("org.allbinary.logic.visual.transform.info.viewObject.TransformInfoObjectData")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TransformInfo is declared before the requires
TransformInfo.__index = TransformInfo
TransformInfo.className = "TransformInfo"
TransformInfo.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfo"
TransformInfo.java_implements = " TransformInfoInterface "
TransformInfo.java_interfaces = function() return {TransformInfoInterface} end

function TransformInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.isChild_f = false
    if self.name_f == nil then self.name_f = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.objectFileName == nil then self.objectFileName = nil end
    if self.anyType == nil then self.anyType = nil end
    if self.objectConfigFileName == nil then self.objectConfigFileName = nil end
    if self.objectConfigInterface == nil then self.objectConfigInterface = nil end
    if self.template == nil then self.template = nil end
    if self.templateFileName == nil then self.templateFileName = nil end
    if self.dataFileName == nil then self.dataFileName = nil end
    self.data = StringUtil.getInstance().EMPTY_STRING
end

function TransformInfo._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return TransformInfo._new0(self, ...)
    elseif count == 1 then return TransformInfo._new1(self, ...)
    elseif count == 5 then return TransformInfo._new5(self, ...)
    end
    error("No constructor of TransformInfo takes " .. count .. " arguments")
end

function TransformInfo.new(...)
    local self = setmetatable({}, TransformInfo)
    TransformInfo._jinit(self, ...)
    return self
end


function TransformInfo._new0(self)
    TransformInfo._init_fields(self)
    return self
end


function TransformInfo._new1(self, name)
    TransformInfo._init_fields(self)
        self:setName(name)
    return self
end


function TransformInfo._new5(self, name, objectFileName, objectConfigFileName, templateFileName, dataFileName)
    TransformInfo._init_fields(self)
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
        if not (stringValidationUtil:isEmpty(aName)) then
            self.name_f = aName
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo properties overridden for: ")
            stringBuffer:append(self:getName())
            stringBuffer:append("\n properties: ")
            stringBuffer:append(tostring(hashMap))
            self.logUtil:putF(tostring(stringBuffer), self, "override(HashMap hashMap)")
        end
        local aStoreName = hashMap:get(StoreFrontData.getInstance().NAME)
        if not (stringValidationUtil:isEmpty(aStoreName)) then
            self.storeName = aStoreName
        end
        local aObjectFileName = hashMap:get(transformInfoData.OBJECTFILENAME)
        if not (stringValidationUtil:isEmpty(aObjectFileName)) then
            self.objectFileName = aObjectFileName
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getMainPath())
        stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
        stringBuffer:append(self.storeName)
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        local fileAbPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        local aObject = hashMap:get(transformInfoData.OBJECT)
        if not (stringValidationUtil:isEmpty(aObject)) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("TransformInfo override view Object for: ") .. require("allbinary_java").to_string(self:getName()), self, "override(HashMap hashMap)")
            end
            local fileDataString = CryptFileReader.new(TransformInfoObjectData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectData.getInstance().ENCRYPTED_EXTENSION):get(AbPath.new(tostring(fileAbPath), aObject))
            if not rawequal(fileDataString, nil) then
                self.anyType = fileDataString
            end
        end
        if not (stringValidationUtil:isEmpty(hashMap:get(transformInfoData.OBJECTCONFIG))) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("TransformInfo override ObjectConfig for: ") .. require("allbinary_java").to_string(self:getName()), self, "override(HashMap hashMap)")
            end
            self:setObjectConfig(hashMap:get(transformInfoData.OBJECTCONFIG))
        end
        local objectConfigFileName = hashMap:get(transformInfoData.OBJECTCONFIGFILENAME)
        if not (stringValidationUtil:isEmpty(objectConfigFileName)) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("TransformInfo override ObjectConfig File for: ") .. require("allbinary_java").to_string(self:getName()), self, "override(HashMap hashMap)")
            end
            self:setObjectConfigFile(objectConfigFileName)
        end
        local type = hashMap:get(OutputTypeData.getInstance().NAME)
        if not (stringValidationUtil:isEmpty(type)) then
            if rawequal(self:getObjectConfigInterface(), nil) then
                self:setObjectConfigInterface(TransformInfoObjectConfig.new(self))
            end
            self:getObjectConfigInterface():setOutputTypeName(type)
        end
        local aTemplateFileName = hashMap:get(transformInfoData.TEMPLATEFILENAME)
        if not (stringValidationUtil:isEmpty(aTemplateFileName)) then
            self.templateFileName = aTemplateFileName
        end
        local aTemplate = hashMap:get(transformInfoData.TEMPLATE)
        if not (stringValidationUtil:isEmpty(aTemplate)) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("TransformInfo override Template for: ") .. require("allbinary_java").to_string(self:getName()), self, "override(HashMap hashMap)")
            end
            local fileDataString = CryptFileReader.new(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION):get(AbPath.new(tostring(fileAbPath), aTemplate))
            if not (stringValidationUtil:isEmpty(fileDataString)) then
                self.template = fileDataString
            end
        end
        local aDataFileName = hashMap:get(transformInfoData.DATAFILENAME)
        if not (stringValidationUtil:isEmpty(aDataFileName)) then
            self.dataFileName = aDataFileName
        end
        local aData = hashMap:get(transformInfoData.DATA)
        if not (stringValidationUtil:isEmpty(aData)) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("TransformInfo override Data for: ") .. require("allbinary_java").to_string(self:getName()), self, "override(HashMap hashMap)")
            end
            local fileDataString = CryptFileReader.new(TransformInfoDataData.getInstance().UNCRYPTED_EXTENSION, TransformInfoDataData.getInstance().ENCRYPTED_EXTENSION):get(AbPath.new(tostring(fileAbPath), aData))
            if not (stringValidationUtil:isEmpty(fileDataString)) then
                self.data = fileDataString
            end
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
            self.logUtil:putF(self:log(), self, "override")
        end
end


function TransformInfo:log()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Name: ")
        stringBuffer:append(self.name_f)
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
        self.name_f = value
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
        return self.name_f
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
        if not (stringValidationUtil:isEmpty(dataFileString)) then
            local try_ok, try_error, try_value = pcall(function()
                local fileData = CryptFileReader.new(TransformInfoDataData.getInstance().UNCRYPTED_EXTENSION, TransformInfoDataData.getInstance().ENCRYPTED_EXTENSION):get(self:getDataFilePath())
                if not (stringValidationUtil:isEmpty(self.data)) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                        self.logUtil:putF(require("allbinary_java").to_string("Data File overriding existing data: ") .. require("allbinary_java").to_string(self:getDataFilePath()), self, "getData()")
                    end
                end
                self.data = fileData
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                    self.logUtil:put(require("allbinary_java").to_string("Could Not Load Data from: ") .. require("allbinary_java").to_string(self:getDataFile()), self, "getData()", e)
                end
            end
        end
        local try_ok, try_error, try_value = pcall(function()
            if not (stringValidationUtil:isEmpty(self.data)) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                    self.logUtil:putF(require("allbinary_java").to_string("Data: ") .. require("allbinary_java").to_string(XmlDocumentHelper.toString(DomDocumentHelper.create(self.data))), self, "getData()")
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Name: ")
                    stringBuffer:append(self.name_f)
                    stringBuffer:append("\nEmpty Data For: ")
                    stringBuffer:append(dataFileString)
                    stringBuffer:append("\nPath: ")
                    stringBuffer:append(self:getDataFilePath():toFileSystemString())
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                        self.logUtil:putF(tostring(stringBuffer), self, "getData()")
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(require("allbinary_java").to_string("Could Not Preview Data: ") .. require("allbinary_java").to_string(self.data), self, "getData()", e)
            end
        end
        return self.data
end


-- throws Exception
function TransformInfo:getDataDocument()
        local localData = self:getData()
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(localData) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
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
        hashMap:put(transformInfoData.NAME, self.name_f)
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
        vector:add(self.name_f)
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
        self.isChild_f = true
end


function TransformInfo:isChild()
        return self.isChild_f
end


function TransformInfo:getObjectConfigInterface()
        return self.objectConfigInterface
end


function TransformInfo:setObjectConfigInterface(objectConfigInterface)
        self.objectConfigInterface = objectConfigInterface
end

return TransformInfo


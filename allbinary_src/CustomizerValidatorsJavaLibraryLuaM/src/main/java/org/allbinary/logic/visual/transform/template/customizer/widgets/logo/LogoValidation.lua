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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.logo

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local HttpRequestUtil = require("org.allbinary.logic.communication.http.request.HttpRequestUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local FileData = require("org.allbinary.logic.io.file.FileData")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogoValidation = {}
LogoValidation.__index = LogoValidation
LogoValidation.className = "LogoValidation"
setmetatable(LogoValidation, {__index = Validation})

function LogoValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.logoFileItem = nil
    self.logoAbPath = nil
    self.logoFile = nil
    self.isFile = nil
end

function LogoValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return LogoValidation._new0(...)
    elseif count == 1 then return LogoValidation._new1(...)
    elseif count == 1 then return LogoValidation._new1(...)
    end
end


function LogoValidation._new0()
    local self = setmetatable(Validation.new(), LogoValidation)
    self:_init_fields()
        self.isFile = false
        self.logoAbPath = nil
        self.logoFile = nil
    return self
end


function LogoValidation._new1(node)
    local self = setmetatable(Validation.new(), LogoValidation)
    self:_init_fields()
        self.isFile = false
        self.logoAbPath = AbPath.new(DomSearchHelper.getNode(LogoData.getInstance().IMAGEPATH, node:getChildNodes()):getNodeValue(), StringUtil.getInstance().EMPTY_STRING)
        self.logoFile = DomSearchHelper.getNode(LogoData.getInstance().IMAGEFILENAME, node:getChildNodes()):getNodeValue()
    return self
end


function LogoValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), LogoValidation)
    self:_init_fields()
        self.isFile = true
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function LogoValidation:getFormData(hashMap)
        self.logoFileItem = hashMap:get(LogoData.getInstance().IMAGE)
        self.logoAbPath = AbPath.new(hashMap:get(LogoData.getInstance().IMAGEPATH), StringUtil.getInstance().EMPTY_STRING)
        if self.logoFileItem ~= nil then
            self.logoFile = HttpRequestUtil.getInstance():generateFileName(self.logoFileItem:getName())
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("HashMap: ")
            stringBuffer:append(tostring(hashMap))
            stringBuffer:append("\nLogoFileName: ")
            stringBuffer:append(self.logoFile)
            self.logUtil:putF(tostring(stringBuffer), self, "getFormData()")
        end
end


function LogoValidation:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            local fileData = FileData.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("LogoValidation", self, self.commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidRequired(tostring(self.logoAbPath), 0, 512) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("logoPath is invalid: " .. tostring(self.logoAbPath), self, self.commonStrings.IS_VALID)
                end
                return false
            end
            if not StringValidationUtil.getInstance():isValidRequired(self.logoFile, fileData.MINLEN, fileData.MAXLEN) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("logoFile is invalid: " .. self.logoFile, self, self.commonStrings.IS_VALID)
                end
                return false
            end
            if self.isFile then
                if self.logoFileItem == nil then
                    return false
                end
                if self.logoFileItem:getSize() > fileData.MAXIMAGEFILESIZE or self.logoFileItem:getSize() < fileData.MINIMAGEFILESIZE then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        self.logUtil:putF("Image File Is Not The Right Size. " .. tostring(fileData.MINIMAGEFILESIZE) .. "< > " .. tostring(fileData.MAXIMAGEFILESIZE), self, self.commonStrings.IS_VALID)
                    end
                    return false
                end
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Logo Validation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function LogoValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Logo is not valid.")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function LogoValidation:toValidationInfoDoc()
        return nil
end


function LogoValidation:toValidationInfoNode(document)
        return nil
end


function LogoValidation:toHashMap()
        local stringUtil = StringUtil.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(LogoData.getInstance().IMAGE, stringUtil.EMPTY_STRING)
        if self.logoFile ~= nil then
            hashMap:put(LogoData.getInstance().IMAGEPATH, tostring(self.logoAbPath))
            hashMap:put(LogoData.getInstance().IMAGEFILENAME, self.logoFile)
        else
            hashMap:put(LogoData.getInstance().IMAGEPATH, nil)
            hashMap:put(LogoData.getInstance().IMAGEFILENAME, self.logoFile)
        end
        return hashMap
end


-- throws Exception
function LogoValidation:toXmlNode(document)
        local hashMap = self:toHashMap()
        return ModDomHelper.createNameValueNodes(document, LogoData.getInstance().NAME, hashMap)
end


-- throws Exception
function LogoValidation:processLogoFile()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Processing logoFile: ")
            stringBuffer:append(tostring(self.logoAbPath))
            stringBuffer:append(self.logoFile)
            self.logUtil:putF(tostring(stringBuffer), self, "processLogoFile()")
        end
        LogoImageFileUtil.new(self.logoAbPath, self.logoFile):saveFiles(self.logoFileItem)
end

return LogoValidation


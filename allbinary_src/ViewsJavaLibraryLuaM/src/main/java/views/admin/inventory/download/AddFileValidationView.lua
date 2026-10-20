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
-- package views.admin.inventory.download

-- local HashMap = require("java.util.HashMap")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemValidation = require("org.allbinary.business.user.commerce.inventory.item.BasicItemValidation")
local DownloadItemData = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local DownloadableItemValidation = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemValidation")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local HttpFileUploadUtil = require("org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileData = require("org.allbinary.logic.io.file.FileData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local DownloadableInventoryItemView = require("views.admin.inventory.download.DownloadableInventoryItemView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AddFileValidationView = {}
AddFileValidationView.__index = AddFileValidationView
AddFileValidationView.className = "AddFileValidationView"
setmetatable(AddFileValidationView, {__index = DownloadableInventoryItemView})

function AddFileValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
end


function AddFileValidationView.new(transformInfoInterface)
    local self = setmetatable(DownloadableInventoryItemView.new(transformInfoInterface), AddFileValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AddFileValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local command = self:getRequestHashMap():get(self.GLOBALS2.ADMINCOMMAND)
            if StringValidationUtil.getInstance():isEmpty(command) or (((command < AddFileValidationView.ADDPRODUCT and -1) or (command > AddFileValidationView.ADDPRODUCT and 1) or 0) ~= 0 and ((command < AddFileValidationView.ADDANOTHERDOWNLOADABLE and -1) or (command > AddFileValidationView.ADDANOTHERDOWNLOADABLE and 1) or 0) ~= 0) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Invalid AdminCommand=" .. command, self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local try_ok, try_error = pcall(function()
                local inventoryEntity = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
                self.itemInterface = inventoryEntity:getItem(self.id)
            end)
            if not try_ok then
                local e = try_error
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:put("Existing Item With MoneyException", self, self.commonStrings.IS_VALID, e)
                end
            end
            if self.itemInterface == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Item Does Not Exist", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            if BasicItemValidation.new(self.itemInterface):isValid() == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("BasicItem is not valid", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
            local fullCategory = tostring(StringMaker.new():append(self.URLGLOBALS:getWebappPath()):append(storeFrontInterface:getCurrentHostNamePath()):append(self.itemInterface:getCategory()))
            local categoryFile = AbFile.createAbFile(fullCategory)
            if not categoryFile:isDirectory() then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Category Does Not Exist: " .. fullCategory, self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local downloadableFileObject = self:getRequestHashMap():get(DownloadItemData.FILE)
            if HttpFileUploadUtil.getInstance():isValid(downloadableFileObject) then
                local fileItem = downloadableFileObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                HttpFileUploadUtil.log(fileItem)
                if self:isValid(fileName, size) == false then
                    return false
                else
                    self:processFile(fileItem)
                    self:getRequestHashMap():put(DownloadItemData.SIZE, tostring(size))
                end
            else
                self:getRequestHashMap():remove(DownloadItemData.FILE)
            end
            local licenseFileObject = self:getRequestHashMap():get(DownloadItemData.LICENSE_FILE)
            if HttpFileUploadUtil.getInstance():isValid(licenseFileObject) then
                local fileItem = licenseFileObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                HttpFileUploadUtil.log(fileItem)
                if self:isValid(fileName, size) == false then
                else
                    self:processFile(fileItem)
                end
            else
                self:getRequestHashMap():remove(DownloadItemData.LICENSE_FILE)
            end
            local extraFilesObject = self:getRequestHashMap():get(DownloadItemData.EXTRA_FILES)
            if HttpFileUploadUtil.getInstance():isValid(extraFilesObject) then
                local fileItem = extraFilesObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                HttpFileUploadUtil.log(fileItem)
                if self:isValid(fileName, size) == false then
                else
                    self:processFile(fileItem)
                    self:unzip(fileItem)
                end
            else
                self:getRequestHashMap():remove(DownloadItemData.EXTRA_FILES)
            end
            local hashMap = self:getRequestHashMap()
            hashMap:put(self.basicItemData.ID, self.itemInterface:getId())
            local licenseObject = hashMap:get(DownloadItemData.LICENSE_FILE)
            if licenseObject ~= nil then
                hashMap:put(DownloadItemData.LICENSE_FILE, (licenseObject):getName())
            else
                hashMap:put(DownloadItemData.LICENSE_FILE, StringUtil.getInstance().EMPTY_STRING)
            end
            local fileObject = hashMap:get(DownloadItemData.FILE)
            if fileObject ~= nil then
                hashMap:put(DownloadItemData.FILE, (fileObject):getName())
            else
                hashMap:put(DownloadItemData.FILE, StringUtil.getInstance().EMPTY_STRING)
            end
            self.downloadableItem = DownloadableItem.new(hashMap)
            local downloadableItemValidation = DownloadableItemValidation.new(self.downloadableItem)
            if downloadableItemValidation:isValid() == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("DownloadableItem is not valid", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Exception in validation", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function AddFileValidationView:toValidationInfoDoc()
        return nil
end


function AddFileValidationView:toValidationInfoNode(document)
        return nil
end


function AddFileValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            local command = self:getRequestHashMap():get(self.GLOBALS2.ADMINCOMMAND)
            if StringValidationUtil.getInstance():isEmpty(command) or (((command < AddFileValidationView.ADDPRODUCT and -1) or (command > AddFileValidationView.ADDPRODUCT and 1) or 0) ~= 0 and ((command < AddFileValidationView.ADDANOTHERDOWNLOADABLE and -1) or (command > AddFileValidationView.ADDANOTHERDOWNLOADABLE and 1) or 0) ~= 0) then
                return StringUtil.getInstance().EMPTY_STRING
            end
            if self.itemInterface == nil then
                local ITEM_NOT_FOUND = "Item Does Not Exist"
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF(ITEM_NOT_FOUND, self, "validationInfo()")
                end
                return ITEM_NOT_FOUND
            end
            local basicItemValidation = BasicItemValidation.new(self.itemInterface)
            if basicItemValidation:isValid() == false then
                stringBuffer:append(basicItemValidation:validationInfo())
                stringBuffer:append("<br/>")
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
            local fullCategory = tostring(StringMaker.new():append(self.URLGLOBALS:getWebappPath()):append(storeFrontInterface:getCurrentHostNamePath()):append(self.itemInterface:getCategory()))
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Category: " .. fullCategory, self, "validationInfo()")
            end
            local categoryFile = AbFile.createAbFile(fullCategory)
            if not categoryFile:isDirectory() then
                stringBuffer:append("Category ")
                stringBuffer:append(self.itemInterface:getCategory())
                stringBuffer:append(" does not exist.")
                stringBuffer:append("<br />")
            end
            local downloadableFileObject = self:getRequestHashMap():get(DownloadItemData.FILE)
            if HttpFileUploadUtil.getInstance():isValid(downloadableFileObject) then
                local fileItem = downloadableFileObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                self:validationInfo(stringBuffer, fileName, size)
            else
                stringBuffer:append("Download File Missing")
                stringBuffer:append("<br/>")
            end
            local licenseFileObject = self:getRequestHashMap():get(DownloadItemData.LICENSE_FILE)
            if HttpFileUploadUtil.getInstance():isValid(licenseFileObject) then
                local fileItem = licenseFileObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                self:validationInfo(stringBuffer, fileName, size)
            else
            end
            local extraFilesObject = self:getRequestHashMap():get(DownloadItemData.EXTRA_FILES)
            if HttpFileUploadUtil.getInstance():isValid(extraFilesObject) then
                local fileItem = extraFilesObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                self:validationInfo(stringBuffer, fileName, size)
            else
            end
            if self.downloadableItem ~= nil then
                local downloadableItemValidation = DownloadableItemValidation.new(self.downloadableItem)
                if downloadableItemValidation:isValid() == false then
                    local log = downloadableItemValidation:validationInfo()
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        self.logUtil:putF(log, self, self.commonStrings.IS_VALID)
                    end
                    stringBuffer:append(log)
                    stringBuffer:append("<br/>")
                end
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AddFileValidationView:isValid(fileName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINDOWNLOADABLEFILESIZE then
            if size < fileData.MAXDOWNLOADABLEFILESIZE then
                if not StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN) then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("File name is not valid: ")
                        stringBuffer:append(fileName)
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    return false
                else
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("File Size To Large: ")
                    stringBuffer:appendlong(size)
                    stringBuffer:append(">")
                    stringBuffer:appendint(java_int(fileData.MAXDOWNLOADABLEFILESIZE))
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                return false
            end
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("File Size To Small: ")
                stringBuffer:appendlong(size)
                stringBuffer:append(">")
                stringBuffer:appendint(java_int(fileData.MINDOWNLOADABLEFILESIZE))
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            end
            return false
        end
        return true
end


-- Java overloaded method: Lua keeps the last definition
function AddFileValidationView:validationInfo(stringBuffer, fileName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINDOWNLOADABLEFILESIZE then
            if size < fileData.MAXDOWNLOADABLEFILESIZE then
                if not StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN) then
                    stringBuffer:append("File Name must be more than ")
                    stringBuffer:appendint(java_int(fileData.MINLEN))
                    stringBuffer:append(" and less than ")
                    stringBuffer:appendint(java_int(fileData.MAXLEN))
                    stringBuffer:append(" characters in length: ")
                    stringBuffer:append(fileName)
                    stringBuffer:append("<br/>")
                else
                end
            else
                stringBuffer:append("File Is Not The Right Size. ")
                stringBuffer:appendint(java_int(fileData.MINDOWNLOADABLEFILESIZE))
                stringBuffer:append("< >")
                stringBuffer:appendint(java_int(fileData.MAXDOWNLOADABLEFILESIZE))
                stringBuffer:append("<br/>")
            end
        end
end

AddFileValidationView.ADDPRODUCT = "Finish"
AddFileValidationView.ADDANOTHERDOWNLOADABLE = "Add Another"

return AddFileValidationView


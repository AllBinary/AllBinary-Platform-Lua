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
-- package views.admin.inventory

local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemValidation = require("org.allbinary.business.user.commerce.inventory.item.BasicItemValidation")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local HttpFileUploadUtil = require("org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil")
local UploadMediaSingleton = require("org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileData = require("org.allbinary.logic.io.file.FileData")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local InventoryItemView = require("views.admin.inventory.InventoryItemView")

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
setmetatable(AddFileValidationView, {__index = InventoryItemView})

function AddFileValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
end


function AddFileValidationView.new(transformInfoInterface)
    local self = setmetatable(InventoryItemView.new(transformInfoInterface), AddFileValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AddFileValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local command = self:getRequestHashMap():get(self.GLOBALS2.ADMINCOMMAND)
            if StringValidationUtil.getInstance():isEmpty(command) or (((command < AddFileValidationView.ADDPRODUCT and -1) or (command > AddFileValidationView.ADDPRODUCT and 1) or 0) ~= 0 and ((command < AddFileValidationView.NEXTSTEP and -1) or (command > AddFileValidationView.NEXTSTEP and 1) or 0) ~= 0) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Invalid AdminCommand: ")
                    stringBuffer:append(command)
                    stringBuffer:append(" must be: ")
                    stringBuffer:append(AddFileValidationView.ADDPRODUCT)
                    stringBuffer:append(" or ")
                    stringBuffer:append(AddFileValidationView.NEXTSTEP)
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local basicItemValidation = BasicItemValidation.new(self.itemInterface)
            if basicItemValidation:isValid() == false then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF(basicItemValidation:validationInfo(), self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
            self.itemInterface:setCategory(storeFrontInterface:getCategoryPath() + self.itemInterface:getCategory())
            local fullCategory = tostring(StringMaker.new():append(self.URLGLOBALS:getWebappPath()):append(storeFrontInterface:getCurrentHostNamePath()):append(self.itemInterface:getCategory()))
            local categoryFile = AbFile.createAbFile(fullCategory)
            if not categoryFile:isDirectory() then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Category Does Not Exist: " .. fullCategory, self, self.commonStrings.IS_VALID)
                end
                return false
            end
            if InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.itemInterface:getId()) ~= nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Item Already Exists", self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local imageFileItemObject = self:getRequestHashMap():get(self.basicItemData.IMAGE)
            if HttpFileUploadUtil.getInstance():isValid(imageFileItemObject) then
                local fileItem = imageFileItemObject
                local fileName = fileItem:getName()
                local size = fileItem:getSize()
                HttpFileUploadUtil.log(fileItem)
                if self:isValid(fileName, size) == false then
                    return false
                end
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
            if StringValidationUtil.getInstance():isEmpty(command) or (((command < AddFileValidationView.ADDPRODUCT and -1) or (command > AddFileValidationView.ADDPRODUCT and 1) or 0) ~= 0 and ((command < AddFileValidationView.NEXTSTEP and -1) or (command > AddFileValidationView.NEXTSTEP and 1) or 0) ~= 0) then
                return StringUtil.getInstance().EMPTY_STRING
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
                stringBuffer:append(" does not exist.<br />")
            end
            local try_ok, try_error = pcall(function()
                if InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.itemInterface:getId()) ~= nil then
                    stringBuffer:append("Id is already in use. Refresh the page for a valid id.<br/>")
                end
            end)
            if not try_ok then
                local e = try_error
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Existing Item With MoneyException", self, "validationInfo()")
                end
            end
            local anyType = self:getRequestHashMap():get(self.basicItemData.IMAGE)
            if HttpFileUploadUtil.getInstance():isValid(anyType) then
                local fileItem = anyType
                local fileName = fileItem:getName()
                local fileItemFieldName = fileItem:getFieldName()
                local size = fileItem:getSize()
                self:validationInfo(stringBuffer, fileName, fileItemFieldName, size)
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
        if size > fileData.MINIMAGEFILESIZE then
            if size < fileData.MAXIMAGEFILESIZE then
                if not StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN) then
                    return false
                else
                    local pathData = AbPathData.getInstance()
                    local extension = pathData:getExtension(fileName)
                    local uploadMedia = UploadMediaSingleton.getInstance()
                    if not uploadMedia:isWriterSupported(extension) and not uploadMedia:isReaderSupported(extension) then
                        return false
                    end
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("File Size To Large: ")
                    stringBuffer:appendlong(size)
                    stringBuffer:append(">")
                    stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                return false
            end
            self:processImageFiles()
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("File Size To Small: ")
                stringBuffer:appendlong(size)
                stringBuffer:append(">")
                stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            end
            return false
        end
        return true
end


-- Java overloaded method: Lua keeps the last definition
function AddFileValidationView:validationInfo(stringBuffer, fileName, fileItemFieldName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINIMAGEFILESIZE then
            if ((fileItemFieldName < self.basicItemData.IMAGE and -1) or (fileItemFieldName > self.basicItemData.IMAGE and 1) or 0) == 0 then
                if size < fileData.MAXIMAGEFILESIZE then
                    if not StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN) then
                        stringBuffer:append("FileName must be >")
                        stringBuffer:appendint(java_int(fileData.MINLEN))
                        stringBuffer:append(" and <")
                        stringBuffer:appendint(java_int(fileData.MAXLEN))
                        stringBuffer:append("<br/>")
                    else
                        local pathData = AbPathData.getInstance()
                        local extension = pathData:getExtension(fileName)
                        local uploadMedia = UploadMediaSingleton.getInstance()
                        if not uploadMedia:isWriterSupported(extension) and not uploadMedia:isReaderSupported(extension) then
                            stringBuffer:append("Image type: ")
                            stringBuffer:append(extension)
                            stringBuffer:append(" not supported.<br />")
                        end
                    end
                else
                    stringBuffer:append("Image File Is To Large. ")
                    stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
                    stringBuffer:append(" < > ")
                    stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
                    stringBuffer:append("<br/>")
                end
            end
        else
            stringBuffer:append("Image File Is To Small. ")
            stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
            stringBuffer:append(" < > ")
            stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
            stringBuffer:append("<br/>")
        end
end

AddFileValidationView.ADDPRODUCT = "Add Product"
AddFileValidationView.NEXTSTEP = tostring(CommonLabels.getInstance().NEXT) .. " Step"

return AddFileValidationView


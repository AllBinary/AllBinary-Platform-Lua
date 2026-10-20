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
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local UpdateFileValidationView = {}
UpdateFileValidationView.__index = UpdateFileValidationView
UpdateFileValidationView.className = "UpdateFileValidationView"
setmetatable(UpdateFileValidationView, {__index = InventoryItemView})

function UpdateFileValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function UpdateFileValidationView.new(transformInfoInterface)
    local self = setmetatable(InventoryItemView.new(transformInfoInterface), UpdateFileValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function UpdateFileValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local command = self:getRequestHashMap():get(self.GLOBALS2.ADMINCOMMAND)
            if command == nil or ((command < UpdateFileValidationView.UPDATEPRODUCT and -1) or (command > UpdateFileValidationView.UPDATEPRODUCT and 1) or 0) ~= 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Invalid AdminCommand=" .. command, self, self.commonStrings.IS_VALID)
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
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            stringBuffer:append(storeFrontInterface:getCurrentHostNamePath())
            stringBuffer:append(self.itemInterface:getCategory())
            local fullCategory = tostring(stringBuffer)
            local categoryFile = AbFile.createAbFile(fullCategory)
            if not categoryFile:isDirectory() then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Category Does Not Exist: " .. fullCategory, self, self.commonStrings.IS_VALID)
                end
                return false
            end
            local inventoryEntity = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            if inventoryEntity:getItem(self.itemInterface:getId()) == nil then
                return false
            end
            local anyType = self:getRequestHashMap():get(self.basicItemData.IMAGE)
            if HttpFileUploadUtil.getInstance():isValid(anyType) then
                local fileItem = anyType
                local size = fileItem:getSize()
                local fileName = fileItem:getName()
                HttpFileUploadUtil.log(fileItem)
                if self:isValid(fileName, size) == false then
                    return false
                end
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:put("Exception in validation", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function UpdateFileValidationView:toValidationInfoDoc()
        return nil
end


function UpdateFileValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function UpdateFileValidationView:validationInfo()
        local stringBuffer = StringMaker.new()
        local command = self:getRequestHashMap():get(self.GLOBALS2.ADMINCOMMAND)
        if command == nil or ((command < UpdateFileValidationView.UPDATEPRODUCT and -1) or (command > UpdateFileValidationView.UPDATEPRODUCT and 1) or 0) ~= 0 then
            return CommonSeps.getInstance().SPACE
        end
        stringBuffer:append(BasicItemValidation.new(self.itemInterface):validationInfo())
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
        local fullCategory = self.URLGLOBALS:getWebappPath() + storeFrontInterface:getCurrentHostNamePath() + self.itemInterface:getCategory()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Category: " .. fullCategory, self, "validationInfo()")
        end
        local try_ok, try_error = pcall(function()
            if InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.itemInterface:getId()) == nil then
                stringBuffer:append("Item does not exist.<br>")
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
            local size = fileItem:getSize()
            local fileName = fileItem:getName()
            local fileItemFieldName = fileItem:getFieldName()
            self:validationInfo(stringBuffer, fileName, fileItemFieldName, size)
        end
        return tostring(stringBuffer)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function UpdateFileValidationView:isValid(fileName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINIMAGEFILESIZE then
            if size < fileData.MAXIMAGEFILESIZE then
                if not StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN) then
                    return false
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
        end
        return true
end


-- Java overloaded method: Lua keeps the last definition
function UpdateFileValidationView:validationInfo(stringBuffer, fileName, fileItemFieldName, size)
        local fileData = FileData.getInstance()
        if size > fileData.MINIMAGEFILESIZE then
            if ((fileItemFieldName < self.basicItemData.IMAGE and -1) or (fileItemFieldName > self.basicItemData.IMAGE and 1) or 0) == 0 then
                if size < fileData.MAXIMAGEFILESIZE then
                    if not StringValidationUtil.getInstance():isValidRequired(fileName, fileData.MINLEN, fileData.MAXLEN) then
                        stringBuffer:append("FileName must be >")
                        stringBuffer:appendint(java_int(fileData.MINLEN))
                        stringBuffer:append("and <")
                        stringBuffer:appendint(java_int(fileData.MAXLEN))
                        stringBuffer:append("<br />")
                    end
                else
                    stringBuffer:append("Image File Is Not The Right Size. ")
                    stringBuffer:appendint(java_int(fileData.MINIMAGEFILESIZE))
                    stringBuffer:append("< > ")
                    stringBuffer:appendint(java_int(fileData.MAXIMAGEFILESIZE))
                    stringBuffer:append("<br />")
                end
            end
        end
end

UpdateFileValidationView.UPDATEPRODUCT = CommonStrings.getInstance().UPDATE

return UpdateFileValidationView


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
-- package org.allbinary.business.user.commerce.inventory.item.download

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = require("org.allbinary.logic.communication.sql.AbSqlData")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
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

local DownloadableItemValidation = {}
DownloadableItemValidation.__index = DownloadableItemValidation
DownloadableItemValidation.className = "DownloadableItemValidation"
setmetatable(DownloadableItemValidation, {__index = Validation})

function DownloadableItemValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.downloadableItem = nil
end


function DownloadableItemValidation.new(downloadableItem)
    local self = setmetatable(Validation.new(), DownloadableItemValidation)
    self:_init_fields()
        self.downloadableItem = downloadableItem
    return self
end


function DownloadableItemValidation:isValid()
        local try_ok, try_error = pcall(function()
            if self.downloadableItem:getId() == nil or self.downloadableItem:getId():length() < 1 or self.downloadableItem:getId():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.downloadableItem:getId() ~= nil and not StringValidationUtil.getInstance():isNumber(self.downloadableItem:getId()) then
                return false
            end
            if self.downloadableItem:getSystem() == nil or self.downloadableItem:getSystem():length() < 1 or self.downloadableItem:getSystem():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.downloadableItem:getPlatform() == nil or self.downloadableItem:getPlatform():length() < 1 or self.downloadableItem:getPlatform():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.downloadableItem:getSpecialName() == nil or self.downloadableItem:getSpecialName():length() < 0 or self.downloadableItem:getSpecialName():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.downloadableItem:getVersion() == nil or self.downloadableItem:getVersion():length() < 1 or self.downloadableItem:getVersion():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.downloadableItem:getChanges() == nil or self.downloadableItem:getChanges():length() < 1 or self.downloadableItem:getChanges():length() > AbSqlData.MAXBLOB then
                return false
            end
            if self.downloadableItem:getSize() == nil then
                return false
            else
                local size = tostring(self.downloadableItem:getSize())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    return false
                end
            end
            if self.downloadableItem:getValidTime() == nil then
                return false
            else
                local size = tostring(self.downloadableItem:getValidTime())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    return false
                end
            end
            if self.downloadableItem:getRetries() == nil then
                return false
            else
                local size = tostring(self.downloadableItem:getRetries())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    return false
                end
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function DownloadableItemValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.downloadableItem:getId() == nil or self.downloadableItem:getId():length() < 1 or self.downloadableItem:getId():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Id is invalid. Must be number < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                stringBuffer:append(" and > 0 digits.<br/>")
            end
            if self.downloadableItem:getId() ~= nil and not StringValidationUtil.getInstance():isNumber(self.downloadableItem:getId()) then
                stringBuffer:append("Id is invalid. Must be > 0.<br/>")
            end
            if self.downloadableItem:getSystem() == nil or self.downloadableItem:getSystem():length() < 1 or self.downloadableItem:getSystem():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("System value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if self.downloadableItem:getPlatform() == nil or self.downloadableItem:getPlatform():length() < 1 or self.downloadableItem:getPlatform():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Platform value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if self.downloadableItem:getSpecialName() == nil or self.downloadableItem:getSpecialName():length() < 0 or self.downloadableItem:getSpecialName():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Special Name value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if self.downloadableItem:getVersion() == nil or self.downloadableItem:getVersion():length() < 1 or self.downloadableItem:getVersion():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Version value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if self.downloadableItem:getChanges() == nil or self.downloadableItem:getChanges():length() < 0 or self.downloadableItem:getChanges():length() > AbSqlData.MAXBLOB then
                stringBuffer:append("Changes value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXBLOB))
                stringBuffer:append(" and >= 0 characters long.<br/>")
            end
            if self.downloadableItem:getSize() == nil then
                stringBuffer:append("File Size is null")
            else
                local size = tostring(self.downloadableItem:getSize())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    stringBuffer:append("File Size is invalid. Must be number < ")
                    stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                    stringBuffer:append(" and > 0 digits.<br/>")
                end
            end
            if self.downloadableItem:getValidTime() == nil then
                stringBuffer:append("Valid Time is null")
            else
                local size = tostring(self.downloadableItem:getValidTime())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    stringBuffer:append("Valid Time is invalid. Must be number < ")
                    stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                    stringBuffer:append(" and > 0 digits.<br/>")
                end
            end
            if self.downloadableItem:getRetries() == nil then
                stringBuffer:append("Retries is null")
            else
                local size = tostring(self.downloadableItem:getRetries())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    stringBuffer:append("Retries is invalid. Must be number < ")
                    stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                    stringBuffer:append(" and > 0 digits.<br/>")
                end
            end
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


function DownloadableItemValidation:toValidationInfoDoc()
        return nil
end


function DownloadableItemValidation:toValidationInfoNode(document)
        return nil
end

return DownloadableItemValidation


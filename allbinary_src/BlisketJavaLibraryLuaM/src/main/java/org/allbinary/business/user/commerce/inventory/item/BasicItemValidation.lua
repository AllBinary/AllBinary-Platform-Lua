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
-- package org.allbinary.business.user.commerce.inventory.item

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

local BasicItemValidation = {}
BasicItemValidation.__index = BasicItemValidation
BasicItemValidation.className = "BasicItemValidation"
setmetatable(BasicItemValidation, {__index = Validation})

function BasicItemValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.MAXWEIGHT = 14
    self.MAXPRICE = 14
    self.itemInterface = nil
end


function BasicItemValidation.new(itemInterface)
    local self = setmetatable(Validation.new(), BasicItemValidation)
    self:_init_fields()
        self.itemInterface = itemInterface
    return self
end


function BasicItemValidation:isValid()
        local try_ok, try_error = pcall(function()
            if self.itemInterface:getId() == nil or self.itemInterface:getId():length() < 1 or self.itemInterface:getId():length() > AbSqlData.MAXNUM then
                return false
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            if self.itemInterface:getId() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getId()) then
                return false
            end
            if self.itemInterface:getNumber() == nil or self.itemInterface:getNumber():length() < 1 or self.itemInterface:getNumber():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getNumber() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getNumber()) then
                return false
            end
            if self.itemInterface:getInBaskets() == nil or self.itemInterface:getInBaskets():length() < 1 or self.itemInterface:getInBaskets():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getInBaskets() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getInBaskets()) then
                return false
            end
            if self.itemInterface:getWeight() == nil or self.itemInterface:getWeight():length() < 1 or self.itemInterface:getWeight():length() > self.MAXWEIGHT then
                return false
            end
            if self.itemInterface:getWeight() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getWeight()) then
                return false
            end
            if self.itemInterface:getEnabled() == nil or self.itemInterface:getEnabled():length() < 1 or self.itemInterface:getEnabled():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.itemInterface:getNewOrUsed() == nil or self.itemInterface:getNewOrUsed():length() < 1 or self.itemInterface:getNewOrUsed():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.itemInterface:getSummary() == nil or self.itemInterface:getSummary():length() < 1 or self.itemInterface:getSummary():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.itemInterface:getDescription() == nil or self.itemInterface:getDescription():length() < 1 or self.itemInterface:getDescription():length() > AbSqlData.MAXBLOB then
                return false
            end
            if self.itemInterface:getKeywords() == nil or self.itemInterface:getKeywords():length() < 1 or self.itemInterface:getKeywords():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.itemInterface:getCategory() == nil or self.itemInterface:getCategory():length() < 1 or self.itemInterface:getCategory():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.itemInterface:getType() == nil or self.itemInterface:getType():length() < 1 or self.itemInterface:getType():length() > AbSqlData.MAXSTRING then
                return false
            end
            if self.itemInterface:getPrice() == nil or not self.itemInterface:getPrice():isValid() then
                return false
            end
            if self.itemInterface:getCustoms() == nil or self.itemInterface:getCustoms():length() < 1 or self.itemInterface:getCustoms():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getDownloads() == nil or self.itemInterface:getDownloads():length() < 1 or self.itemInterface:getDownloads():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getGroups() == nil or self.itemInterface:getGroups():length() < 1 or self.itemInterface:getGroups():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getOptions() == nil or self.itemInterface:getOptions():length() < 1 or self.itemInterface:getOptions():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getPermissions() == nil or self.itemInterface:getPermissions():length() < 1 or self.itemInterface:getPermissions():length() > AbSqlData.MAXNUM then
                return false
            end
            if self.itemInterface:getSpecials() == nil or self.itemInterface:getSpecials():length() < 1 or self.itemInterface:getSpecials():length() > AbSqlData.MAXNUM then
                return false
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


function BasicItemValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.itemInterface:getId() == nil or self.itemInterface:getId():length() < 1 or self.itemInterface:getId():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Id is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            if self.itemInterface:getId() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getId()) then
                stringBuffer:append("Id is invalid. Must be > 0.<br />")
            end
            if self.itemInterface:getNumber() == nil or self.itemInterface:getNumber():length() < 1 or self.itemInterface:getNumber():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Number of items is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getNumber() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getNumber()) then
                stringBuffer:append("Number of items value is not a valid number.<br />")
            end
            if self.itemInterface:getInBaskets() == nil or self.itemInterface:getInBaskets():length() < 1 or self.itemInterface:getInBaskets():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Number in baskets is invalid. Must be < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getInBaskets() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getInBaskets()) then
                stringBuffer:append("In Baskets value is not a valid number.<br />")
            end
            if self.itemInterface:getWeight() == nil or self.itemInterface:getWeight():length() < 1 or self.itemInterface:getWeight():length() > self.MAXWEIGHT then
                stringBuffer:append("Weight value is invalid. Must be < " .. tostring(self.MAXWEIGHT) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getWeight() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getWeight()) then
                stringBuffer:append("Weight value is not a valid number.<br />")
            end
            if self.itemInterface:getEnabled() == nil or self.itemInterface:getEnabled():length() < 1 or self.itemInterface:getEnabled():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("For Sale value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getNewOrUsed() == nil or self.itemInterface:getNewOrUsed():length() < 1 or self.itemInterface:getNewOrUsed():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("New Or Used value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getSummary() == nil or self.itemInterface:getSummary():length() < 1 or self.itemInterface:getSummary():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Summary value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getDescription() == nil or self.itemInterface:getDescription():length() < 1 or self.itemInterface:getDescription():length() > AbSqlData.MAXBLOB then
                stringBuffer:append("Description value is invalid. Must be < " .. tostring(AbSqlData.MAXBLOB) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getKeywords() == nil or self.itemInterface:getKeywords():length() < 1 or self.itemInterface:getKeywords():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Keywords value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getCategory() == nil or self.itemInterface:getCategory():length() < 1 or self.itemInterface:getCategory():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Category value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getType() == nil or self.itemInterface:getType():length() < 1 or self.itemInterface:getType():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Type value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getPrice() == nil or not self.itemInterface:getPrice():isValid() then
                stringBuffer:append("Price value is invalid. Must be < " .. tostring(self.MAXPRICE) .. " and > 0 in length.<br />")
            end
            if self.itemInterface:getCustoms() == nil or self.itemInterface:getCustoms():length() < 1 or self.itemInterface:getCustoms():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Custom items value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getDownloads() == nil or self.itemInterface:getDownloads():length() < 1 or self.itemInterface:getDownloads():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Downloadable item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getGroups() == nil or self.itemInterface:getGroups():length() < 1 or self.itemInterface:getGroups():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Group item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getOptions() == nil or self.itemInterface:getOptions():length() < 1 or self.itemInterface:getOptions():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Option item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getPermissions() == nil or self.itemInterface:getPermissions():length() < 1 or self.itemInterface:getPermissions():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Permission item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getSpecials() == nil or self.itemInterface:getSpecials():length() < 1 or self.itemInterface:getSpecials():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Special item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
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


function BasicItemValidation:toValidationInfoDoc()
        return nil
end


function BasicItemValidation:toValidationInfoNode(document)
        return nil
end

return BasicItemValidation


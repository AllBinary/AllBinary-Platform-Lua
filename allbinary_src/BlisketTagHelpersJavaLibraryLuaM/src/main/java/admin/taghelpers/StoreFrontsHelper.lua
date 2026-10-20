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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local Portion = require("org.allbinary.business.installer.Portion")
local StoreFrontsEntityFactory = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlTableUtil = require("org.allbinary.logic.communication.sql.AbSqlTableUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local HtmlSelect = require("org.allbinary.logic.visual.dhtml.html.select.HtmlSelect")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicTable = require("admin.taghelpers.BasicTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontsHelper = {}
StoreFrontsHelper.__index = StoreFrontsHelper
StoreFrontsHelper.className = "StoreFrontsHelper"
setmetatable(StoreFrontsHelper, {__index = BasicTable})

function StoreFrontsHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.portion = nil
    self.commonPhoneStrings = CommonPhoneStrings.getInstance()
end


function StoreFrontsHelper.new(hashMap, pageContext)
    local self = setmetatable(BasicTable.new(), StoreFrontsHelper)
    self:_init_fields()
        self.portion = Portion.new(hashMap)
    return self
end


function StoreFrontsHelper:drop()
        local try_ok, try_error = pcall(function()
            local success = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():dropTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.commonStrings.DROP)
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


function StoreFrontsHelper:create()
        local try_ok, try_error = pcall(function()
            local success = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():createTable()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "create()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create new storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


function StoreFrontsHelper:restore()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():restoreTable(StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance(), self.portion)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "restore()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to restore backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
end


function StoreFrontsHelper:backup()
        local try_ok, try_error = pcall(function()
            local success = "Restore Successful"
            local result = AbSqlTableUtil.getInstance():backupTable(StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "backup()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to make backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
end


function StoreFrontsHelper:generateSelect()
        local try_ok, try_error = pcall(function()
            local success = CommonSeps.getInstance().SPACE
            local storeNamesVector = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance():getStoreFrontNames()
            local storeSelect = HtmlSelect.new(StringUtil.getInstance().EMPTY_STRING, self.commonPhoneStrings.ONE, StoreFrontData.getInstance().SELECTSTORENAME, StringUtil.getInstance().EMPTY_STRING)
            storeSelect:addAttribute(StoreFrontsHelper.CLASS, StoreFrontsHelper.TEXT)
            local size = storeNamesVector:size()
            for index = 0, size - 1 do
                local storeName = storeNamesVector:get(index)
                storeSelect:addOption(storeName)
            end
            success = success .. tostring(storeSelect)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "generateSelect()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to generate storefronts select"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "generateSelect()", e)
            end
            return error
        end
end

StoreFrontsHelper.CLASS = "class"
StoreFrontsHelper.TEXT = "text"

return StoreFrontsHelper


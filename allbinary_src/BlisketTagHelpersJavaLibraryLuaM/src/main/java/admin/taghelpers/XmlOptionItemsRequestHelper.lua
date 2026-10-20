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

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local EntryData = require("org.allbinary.business.entry.EntryData")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local XmlOptionItemData = require("org.allbinary.business.user.commerce.inventory.item.option.XmlOptionItemData")
local XmlOptionItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.options.XmlOptionItemsEntityFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local ModifyTable = require("admin.taghelpers.ModifyTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XmlOptionItemsRequestHelper = {}
XmlOptionItemsRequestHelper.__index = XmlOptionItemsRequestHelper
XmlOptionItemsRequestHelper.className = "XmlOptionItemsRequestHelper"
setmetatable(XmlOptionItemsRequestHelper, {__index = ModifyTable})

function XmlOptionItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.request = nil
    self.id = nil
    self.xmlFileStatus = nil
    self.optionXmlFile = nil
    self.timeEntered = nil
    self.lastModified = nil
end


function XmlOptionItemsRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), XmlOptionItemsRequestHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end


function XmlOptionItemsRequestHelper:getFormData()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.xmlFileStatus = self.request:getParameter(XmlOptionItemData.XML_FILE_STATUS)
        self.optionXmlFile = self.request:getParameter(XmlOptionItemData.OPTION_XML_FILE)
        self.timeEntered = self.request:getParameter(EntryData.getInstance().TIMECREATED)
        self.lastModified = self.request:getParameter(EntryData.getInstance().LASTMODIFIED)
end


function XmlOptionItemsRequestHelper:getHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(self.basicItemData.ID, self.id)
        values:put(XmlOptionItemData.XML_FILE_STATUS, self.xmlFileStatus)
        values:put(XmlOptionItemData.OPTION_XML_FILE, self.optionXmlFile)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function XmlOptionItemsRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local values = BasicArrayListD.new()
            values:add(self.id)
            values:add(self.xmlFileStatus)
            values:add(self.optionXmlFile)
            values:add(time)
            values:add(time)
            XmlOptionItemsEntityFactory.getInstance():getXmlOptionItemsEntityInstance():insert(values)
            local success = "Successfully inserted " .. self.id .. " into items table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to insert " .. self.id .. " into items table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "inserts()", e)
            end
            return error
        end
end


function XmlOptionItemsRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            XmlOptionItemsEntityFactory.getInstance():getXmlOptionItemsEntityInstance():delete(self.id)
            local success = "Successfully deleted"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to delete"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
end


function XmlOptionItemsRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Update Successful"
            local values = self:getHashMap()
            XmlOptionItemsEntityFactory.getInstance():getXmlOptionItemsEntityInstance():update(values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(tostring(StringMaker.new():append(self.id):append(CommonSeps.getInstance().SPACE):append(success)), self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update: " .. self.id
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end

return XmlOptionItemsRequestHelper


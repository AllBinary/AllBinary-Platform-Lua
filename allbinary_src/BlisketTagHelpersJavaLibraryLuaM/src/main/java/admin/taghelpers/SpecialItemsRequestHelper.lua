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
local SpecialItemData = require("org.allbinary.business.user.commerce.inventory.item.special.SpecialItemData")
local SpecialItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.special.SpecialItemsEntityFactory")
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

local SpecialItemsRequestHelper = {}
SpecialItemsRequestHelper.__index = SpecialItemsRequestHelper
SpecialItemsRequestHelper.className = "SpecialItemsRequestHelper"
setmetatable(SpecialItemsRequestHelper, {__index = ModifyTable})

function SpecialItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.request = nil
    self.id = nil
    self.enabled = nil
    self.number = nil
    self.startTime = nil
    self.endTime = nil
    self.price = nil
    self.timeEntered = nil
    self.lastModified = nil
end


function SpecialItemsRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), SpecialItemsRequestHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end


function SpecialItemsRequestHelper:getFormData()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.number = self.request:getParameter(self.basicItemData.NUMBER)
        self.enabled = self.request:getParameter(EntryData.getInstance().ENABLE)
        self.startTime = self.request:getParameter(SpecialItemData.START_TIME)
        self.endTime = self.request:getParameter(SpecialItemData.END_TIME)
        self.price = self.request:getParameter(self.basicItemData.PRICE)
        self.timeEntered = self.request:getParameter(EntryData.getInstance().TIMECREATED)
        self.lastModified = self.request:getParameter(EntryData.getInstance().LASTMODIFIED)
end


function SpecialItemsRequestHelper:getHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(self.basicItemData.ID, self.id)
        values:put(self.basicItemData.NUMBER, self.number)
        values:put(EntryData.getInstance().ENABLE, self.enabled)
        values:put(SpecialItemData.START_TIME, self.startTime)
        values:put(SpecialItemData.END_TIME, self.endTime)
        values:put(self.basicItemData.PRICE, self.price)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function SpecialItemsRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local values = BasicArrayListD.new()
            values:add(self.id)
            values:add(self.number)
            values:add(self.enabled)
            values:add(self.startTime)
            values:add(self.endTime)
            values:add(self.price)
            values:add(time)
            values:add(time)
            SpecialItemsEntityFactory.getInstance():getSpecialItemsEntityInstance():insert(values)
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


function SpecialItemsRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            SpecialItemsEntityFactory.getInstance():getSpecialItemsEntityInstance():delete(self.id)
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


function SpecialItemsRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Update Successful"
            local values = self:getHashMap()
            SpecialItemsEntityFactory.getInstance():getSpecialItemsEntityInstance():update(values)
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

return SpecialItemsRequestHelper


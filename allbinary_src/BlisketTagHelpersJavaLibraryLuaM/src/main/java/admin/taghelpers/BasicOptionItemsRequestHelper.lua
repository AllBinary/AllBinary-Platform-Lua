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
local BasicOptionItemData = require("org.allbinary.business.user.commerce.inventory.item.option.BasicOptionItemData")
local BasicOptionItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.options.BasicOptionItemsEntityFactory")
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

local BasicOptionItemsRequestHelper = {}
BasicOptionItemsRequestHelper.__index = BasicOptionItemsRequestHelper
BasicOptionItemsRequestHelper.className = "BasicOptionItemsRequestHelper"
setmetatable(BasicOptionItemsRequestHelper, {__index = ModifyTable})

function BasicOptionItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.request = nil
    self.id = nil
    self.optionOneTitle = nil
    self.defaultOptionItem = nil
    self.defaultOptionValue = nil
    self.optionItem = nil
    self.optionValue = nil
    self.timeEntered = nil
    self.lastModified = nil
end


function BasicOptionItemsRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), BasicOptionItemsRequestHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end


function BasicOptionItemsRequestHelper:getFormData()
        self.optionItem = BasicArrayListD.new()
        self.optionValue = BasicArrayListD.new()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.optionOneTitle = self.request:getParameter(BasicOptionItemData.OPTION_ONE_TITLE)
        self.defaultOptionItem = self.request:getParameter(BasicOptionItemData.DEFAULT_OPTION_ITEM)
        self.defaultOptionValue = self.request:getParameter(BasicOptionItemData.DEFAULT_OPTION_VALUE)
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_ONE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_ONE_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_TWO_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_TWO_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_THREE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_THREE_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FOUR_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FOUR_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FIVE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_FIVE_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SIX_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SIX_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE))
        self.optionItem:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_NINE_ITEM))
        self.optionValue:add(self.request:getParameter(BasicOptionItemData.OPTION_ONE_NINE_VALUE))
        self.timeEntered = self.request:getParameter(EntryData.getInstance().TIMECREATED)
        self.lastModified = self.request:getParameter(EntryData.getInstance().LASTMODIFIED)
end


function BasicOptionItemsRequestHelper:getHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(self.basicItemData.ID, self.id)
        values:put(BasicOptionItemData.OPTION_ONE_ONE_ITEM, self.optionItem:get(0))
        values:put(BasicOptionItemData.OPTION_ONE_ONE_VALUE, self.optionValue:get(0))
        values:put(BasicOptionItemData.OPTION_ONE_TWO_ITEM, self.optionItem:get(1))
        values:put(BasicOptionItemData.OPTION_ONE_TWO_VALUE, self.optionValue:get(1))
        values:put(BasicOptionItemData.OPTION_ONE_THREE_ITEM, self.optionItem:get(2))
        values:put(BasicOptionItemData.OPTION_ONE_THREE_VALUE, self.optionValue:get(2))
        values:put(BasicOptionItemData.OPTION_ONE_FOUR_ITEM, self.optionItem:get(3))
        values:put(BasicOptionItemData.OPTION_ONE_FOUR_VALUE, self.optionValue:get(3))
        values:put(BasicOptionItemData.OPTION_ONE_FIVE_ITEM, self.optionItem:get(4))
        values:put(BasicOptionItemData.OPTION_ONE_FIVE_VALUE, self.optionValue:get(4))
        values:put(BasicOptionItemData.OPTION_ONE_SIX_ITEM, self.optionItem:get(5))
        values:put(BasicOptionItemData.OPTION_ONE_SIX_VALUE, self.optionValue:get(5))
        values:put(BasicOptionItemData.OPTION_ONE_SEVEN_ITEM, self.optionItem:get(6))
        values:put(BasicOptionItemData.OPTION_ONE_SEVEN_VALUE, self.optionValue:get(6))
        values:put(BasicOptionItemData.OPTION_ONE_EIGHT_ITEM, self.optionItem:get(7))
        values:put(BasicOptionItemData.OPTION_ONE_EIGHT_VALUE, self.optionValue:get(7))
        values:put(BasicOptionItemData.OPTION_ONE_NINE_ITEM, self.optionItem:get(8))
        values:put(BasicOptionItemData.OPTION_ONE_NINE_VALUE, self.optionValue:get(8))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function BasicOptionItemsRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local values = BasicArrayListD.new()
            values:add(self.id)
            local size = self.optionValue:size()
            for index = 0, size - 1 do
                values:add(self.optionValue:get(index))
                values:add(self.optionItem:get(index))
            end
            values:add(time)
            values:add(time)
            BasicOptionItemsEntityFactory.getInstance():getBasicOptionItemsEntityInstance():insert(values)
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


function BasicOptionItemsRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            BasicOptionItemsEntityFactory.getInstance():getBasicOptionItemsEntityInstance():delete(self.id)
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


function BasicOptionItemsRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Update Pricing Successful"
            local values = self:getHashMap()
            BasicOptionItemsEntityFactory.getInstance():getBasicOptionItemsEntityInstance():update(values)
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

return BasicOptionItemsRequestHelper


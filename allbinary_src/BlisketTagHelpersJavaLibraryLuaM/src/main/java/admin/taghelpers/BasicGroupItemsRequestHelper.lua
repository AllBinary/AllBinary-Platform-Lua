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
local BasicGroupItemData = require("org.allbinary.business.user.commerce.inventory.item.group.BasicGroupItemData")
local BasicGroupItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.groups.BasicGroupItemsEntityFactory")
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

local BasicGroupItemsRequestHelper = {}
BasicGroupItemsRequestHelper.__index = BasicGroupItemsRequestHelper
BasicGroupItemsRequestHelper.className = "BasicGroupItemsRequestHelper"
setmetatable(BasicGroupItemsRequestHelper, {__index = ModifyTable})

function BasicGroupItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.request = nil
    self.id = nil
    self.itemOne = nil
    self.itemTwo = nil
    self.itemThree = nil
    self.itemFour = nil
    self.itemFive = nil
    self.itemSix = nil
    self.itemSeven = nil
    self.itemEight = nil
    self.itemNine = nil
    self.itemTen = nil
    self.timeEntered = nil
    self.lastModified = nil
end


function BasicGroupItemsRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), BasicGroupItemsRequestHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end


function BasicGroupItemsRequestHelper:getFormData()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.itemOne = self.request:getParameter(BasicGroupItemData.ITEM_ONE)
        self.itemTwo = self.request:getParameter(BasicGroupItemData.ITEM_TWO)
        self.itemThree = self.request:getParameter(BasicGroupItemData.ITEM_THREE)
        self.itemFour = self.request:getParameter(BasicGroupItemData.ITEM_FOUR)
        self.itemFive = self.request:getParameter(BasicGroupItemData.ITEM_FIVE)
        self.itemSix = self.request:getParameter(BasicGroupItemData.ITEM_SIX)
        self.itemSeven = self.request:getParameter(BasicGroupItemData.ITEM_SEVEN)
        self.itemEight = self.request:getParameter(BasicGroupItemData.ITEM_EIGHT)
        self.itemNine = self.request:getParameter(BasicGroupItemData.ITEM_NINE)
        self.itemTen = self.request:getParameter(BasicGroupItemData.ITEM_TEN)
        self.timeEntered = self.request:getParameter(EntryData.getInstance().TIMECREATED)
        self.lastModified = self.request:getParameter(EntryData.getInstance().LASTMODIFIED)
end


function BasicGroupItemsRequestHelper:getHashMap()
        local values = StdUtil.getInstance():createHashMap()
        values:put(self.basicItemData.ID, self.id)
        values:put(BasicGroupItemData.ITEM_ONE, self.itemOne)
        values:put(BasicGroupItemData.ITEM_TWO, self.itemTwo)
        values:put(BasicGroupItemData.ITEM_THREE, self.itemThree)
        values:put(BasicGroupItemData.ITEM_FOUR, self.itemFour)
        values:put(BasicGroupItemData.ITEM_FIVE, self.itemFive)
        values:put(BasicGroupItemData.ITEM_SIX, self.itemSix)
        values:put(BasicGroupItemData.ITEM_SEVEN, self.itemSeven)
        values:put(BasicGroupItemData.ITEM_EIGHT, self.itemEight)
        values:put(BasicGroupItemData.ITEM_NINE, self.itemNine)
        values:put(BasicGroupItemData.ITEM_TEN, self.itemTen)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function BasicGroupItemsRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local values = BasicArrayListD.new()
            values:add(self.id)
            values:add(self.itemOne)
            values:add(self.itemTwo)
            values:add(self.itemThree)
            values:add(self.itemFour)
            values:add(self.itemFive)
            values:add(self.itemSix)
            values:add(self.itemSeven)
            values:add(self.itemEight)
            values:add(self.itemNine)
            values:add(self.itemTen)
            values:add(time)
            values:add(time)
            BasicGroupItemsEntityFactory.getInstance():getBasicGroupItemsEntityInstance():insert(values)
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


function BasicGroupItemsRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            BasicGroupItemsEntityFactory.getInstance():getBasicGroupItemsEntityInstance():delete(self.id)
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


function BasicGroupItemsRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Update Pricing Successful"
            local values = self:getHashMap()
            BasicGroupItemsEntityFactory.getInstance():getBasicGroupItemsEntityInstance():update(values)
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

return BasicGroupItemsRequestHelper


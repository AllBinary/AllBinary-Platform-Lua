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
local AbTagData = require("admin.tags.AbTagData")
local DownloadableItem = require("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local DownloadItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local HelperTag = require("tags.HelperTag")
local DownloadableInventoryItemView = require("views.admin.inventory.download.DownloadableInventoryItemView")
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

local DownloadItemsRequestHelper = {}
DownloadItemsRequestHelper.__index = DownloadItemsRequestHelper
DownloadItemsRequestHelper.className = "DownloadItemsRequestHelper"
setmetatable(DownloadItemsRequestHelper, {__index = ModifyTable})

function DownloadItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.downloadableItem = nil
end


function DownloadItemsRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), DownloadItemsRequestHelper)
    self:_init_fields()
        local inventoryTag = hashMap:get(AbTagData.PARENT)
        local inventoryItemViewParentTagHelper = InventoryItemViewParentTagHelper.getInstance()
        local downloadableInventoryItemView = inventoryItemViewParentTagHelper:getDownloadableInventoryItemView(inventoryTag)
        self.downloadableItem = downloadableInventoryItemView:getDownloadableItem()
    return self
end


function DownloadItemsRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local vector = self.downloadableItem:toVector()
            DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance():insert(vector)
            local success = "Successfully inserted " .. tostring(self.downloadableItem:getId()) .. " into downloaditems table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to insert " .. tostring(self.downloadableItem:getId()) .. " into downloaditems table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "inserts()", e)
            end
            return error
        end
end


function DownloadItemsRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance():delete(self.downloadableItem:getId())
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


function DownloadItemsRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Update Successful"
            local values = self.downloadableItem:toHashMap()
            DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance():update(values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(tostring(self.downloadableItem:getId() + CommonSeps.getInstance().SPACE) .. success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update: " .. tostring(self.downloadableItem:getId())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end

return DownloadItemsRequestHelper


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
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local HelperTag = require("tags.HelperTag")
local InventoryItemView = require("views.admin.inventory.InventoryItemView")
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

local InventoryRequestHelper = {}
InventoryRequestHelper.__index = InventoryRequestHelper
InventoryRequestHelper.className = "InventoryRequestHelper"
setmetatable(InventoryRequestHelper, {__index = ModifyTable})

function InventoryRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.itemInterface = nil
end


function InventoryRequestHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), InventoryRequestHelper)
    self:_init_fields()
        local inventoryTag = propertiesHashMap:get(AbTagData.PARENT)
        local itemView = InventoryItemViewParentTagHelper.getInstance():getInventoryItemView(inventoryTag)
        self.itemInterface = itemView:getItemInterface()
    return self
end


-- throws Exception
function InventoryRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local dataMappingInterface = self:getItemInterface()
            local values = dataMappingInterface:toVector()
            InventoryEntityFactory.getInstance():getInventoryEntityInstance():insert(values)
            local success = "Successfully Added Product"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add item to Inventory"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
end


function InventoryRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            local dataMappingInterface = self:getItemInterface()
            local id = dataMappingInterface:getKey()
            InventoryEntityFactory.getInstance():getInventoryEntityInstance():deleteWhere(self.basicItemData.ID, id)
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Successfully Removed the item with ")
            stringBuffer:append(self.basicItemData.ID)
            stringBuffer:append("=")
            stringBuffer:append(id)
            stringBuffer:append(" from to the Inventory table")
            local success = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.tagStrings.DO_START_TAG)
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to remove item with from Inventory"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.tagStrings.DO_START_TAG, e)
            end
            return error
        end
end


function InventoryRequestHelper:update()
        local try_ok, try_error = pcall(function()
            self:delete()
            self:insert()
            local success = "Item Successfully Updated"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed To Update Item"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


function InventoryRequestHelper:getItemInterface()
        return self.itemInterface
end

return InventoryRequestHelper


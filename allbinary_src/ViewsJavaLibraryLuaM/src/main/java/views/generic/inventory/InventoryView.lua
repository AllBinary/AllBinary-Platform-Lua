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
-- package views.generic.inventory

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local InventoryData = require("org.allbinary.business.user.commerce.inventory.InventoryData")
local BasicItemView = require("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchData = require("org.allbinary.logic.control.search.SearchData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventoryView = {}
InventoryView.__index = InventoryView
InventoryView.className = "InventoryView"
setmetatable(InventoryView, {__index = HttpStoreComponentView})

function InventoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InventoryView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), InventoryView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function InventoryView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Starting", self, "toXmlNode")
            end
            local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local inventoryNode = document:createElement(InventoryData.INVENTORY)
            local itemVector = inventoryEntityInterface:getItems(StoreFrontFactory.getInstance(self:getTransformInfoInterface():getStoreName()))
            inventoryNode:appendChild(ModDomHelper.createNameValueNodes(document, SearchData.TOTAL_NUMBER_ITEMS_ON_THIS_PAGE, tostring(itemVector:size())))
            local size = itemVector:size()
            for index = 0, size - 1 do
                local itemInterface = itemVector:get(index)
                if itemInterface ~= nil then
                    local node = BasicItemView.new(itemInterface, BasicArrayListD.new()):toXmlNode(document)
                    inventoryNode:appendChild(node)
                else
                    self.logUtil:putF("Inventory", self, "toXmlNode")
                end
            end
            return inventoryNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function InventoryView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


function InventoryView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view Inventory"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
end

return InventoryView


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

local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicItemView = require("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local StoreTransformer = require("org.allbinary.logic.visual.transform.StoreTransformer")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformStoreDocumentFactory = require("org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory")
local TransformInfoHttpSearch = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventorySearchProductUtil = {}
InventorySearchProductUtil.__index = InventorySearchProductUtil
InventorySearchProductUtil.className = "InventorySearchProductUtil"

function InventorySearchProductUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.ITEM_NOT_FOUND = "Item Not Found."
end

function InventorySearchProductUtil.new()
    local self = setmetatable({}, InventorySearchProductUtil)
    self:_init_fields()
    return self
end


function InventorySearchProductUtil.getInstance()
        return InventorySearchProductUtil.instance
end


-- throws Exception
function InventorySearchProductUtil:getProduct(abeClientInformation, searchRequest, product)
        local try_ok, try_error = pcall(function()
            local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local itemInterface = inventoryEntityInterface:getItem(product)
            if itemInterface ~= nil then
                local viewDocumentInterface = TransformStoreDocumentFactory.getInstance(searchRequest)
                viewDocumentInterface:getBaseNode():appendChild(BasicItemView.new(itemInterface, BasicArrayListD.new()):toXmlNode(viewDocumentInterface:getDoc()))
                local success = XmlDocumentHelper.toString(viewDocumentInterface:getDoc())
                local outputStr = StoreTransformer.new(abeClientInformation, TransformInfoHttpSearch.new(searchRequest)):translate(success)
                return outputStr
            else
                return self.ITEM_NOT_FOUND
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getProduct", e)
            end
            error(java_exception("Exception", "Failed to getProduct"), 0)
        end
end

InventorySearchProductUtil.instance = InventorySearchProductUtil.new()

return InventorySearchProductUtil


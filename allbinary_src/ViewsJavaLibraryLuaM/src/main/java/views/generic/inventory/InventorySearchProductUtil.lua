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

local InventorySearchProductUtil = {}
package.loaded["views.generic.inventory.InventorySearchProductUtil"] = InventorySearchProductUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicItemView = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local InventoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local StoreTransformer = java_lazy("org.allbinary.logic.visual.transform.StoreTransformer")
local TransformDocumentInterface = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformStoreDocumentFactory = java_lazy("org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory")
local TransformInfoHttpSearch = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InventorySearchProductUtil is declared before the requires
InventorySearchProductUtil.__index = InventorySearchProductUtil
InventorySearchProductUtil.className = "InventorySearchProductUtil"
InventorySearchProductUtil.javaClassName = "views.generic.inventory.InventorySearchProductUtil"

function InventorySearchProductUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.ITEM_NOT_FOUND = "Item Not Found."
end

function InventorySearchProductUtil._jinit(self)
    InventorySearchProductUtil._init_fields(self)
    return self
end

function InventorySearchProductUtil.new()
    return InventorySearchProductUtil._jinit(setmetatable({}, InventorySearchProductUtil))
end


function InventorySearchProductUtil.getInstance()
        return InventorySearchProductUtil.instance_f
end


-- throws Exception
function InventorySearchProductUtil:getProduct(abeClientInformation, searchRequest, product)
        local try_ok, try_error, try_value = pcall(function()
            local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local itemInterface = inventoryEntityInterface:getItem(product)
            if itemInterface ~= nil then
                local viewDocumentInterface = TransformStoreDocumentFactory.getInstance(searchRequest)
                viewDocumentInterface:getBaseNode():appendChild(BasicItemView.new(itemInterface, BasicArrayListD.new()):toXmlNode(viewDocumentInterface:getDoc()))
                local success = XmlDocumentHelper.toString(viewDocumentInterface:getDoc())
                local outputStr = StoreTransformer.new(abeClientInformation, TransformInfoHttpSearch.new(searchRequest)):translate(success)
                do return "__jreturn", outputStr end
            else
                do return "__jreturn", self.ITEM_NOT_FOUND end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getProduct", e)
            end
            error(require("java.lang.Exception").new("Failed to getProduct"), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

InventorySearchProductUtil.instance_f = InventorySearchProductUtil.new()

return InventorySearchProductUtil


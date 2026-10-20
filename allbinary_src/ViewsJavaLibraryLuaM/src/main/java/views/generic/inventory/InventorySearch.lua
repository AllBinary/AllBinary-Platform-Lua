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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local StaticPagesEntity = require("org.allbinary.data.tables.staticpages.StaticPagesEntity")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchParams = require("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local InventoryViewSearchInterface = require("views.admin.inventory.listings.InventoryViewSearchInterface")

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

local InventorySearch = {}
InventorySearch.__index = InventorySearch
InventorySearch.className = "InventorySearch"

function InventorySearch:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.searchRequest = nil
end


function InventorySearch.new(searchRequest)
    local self = setmetatable({}, InventorySearch)
    self:_init_fields()
        -- super(...) made self above
        self.searchRequest = searchRequest
    return self
end


-- throws Exception
function InventorySearch:searchSingleStaticPage()
        local try_ok, try_error = pcall(function()
            local storeFront = self.searchRequest:getStoreFront()
            local searchParams = self.searchRequest:getParams()
            local columnValueHashMap = searchParams:get()
            local file = StaticPagesEntity.new():getFile(storeFront:getName(), Replace.new("-", CommonSeps.getInstance().SPACE):all(columnValueHashMap:get(self.basicItemData.KEYWORDS)))
            if StringValidationUtil.getInstance():isEmpty(file) then
                return nil
            else
                local stringBuffer = StringMaker.new()
                stringBuffer:append(storeFront:getCurrentHostName())
                stringBuffer:append(storeFront:getCurrentHostNamePath())
                stringBuffer:append(storeFront:getStaticPath())
                stringBuffer:append(file)
                stringBuffer:append(self.searchRequest:getParams():getEndPage())
                stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
                stringBuffer:append(InputOutputTypeData.getInstance().DEFAULT)
                local filePath = Replace.new(CommonSeps.getInstance().SPACE, "%20"):all(tostring(stringBuffer))
                return filePath
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "searchSingleStaticPage", e)
            end
            error(java_exception("Exception", "Failed retrieve Single Product Page Static"), 0)
        end
end


-- throws Exception
function InventorySearch:searchSingleDynamicPage()
        local try_ok, try_error = pcall(function()
            local str = self:search()
            return str[math.tointeger(self.searchRequest:getParams():getStartPageInt() // 1) + 1]
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "searchSingleDynamicPage", e)
            end
            error(java_exception("Exception", "Failed retrieve Single Product Page Dynamically"), 0)
        end
end


-- throws Exception
function InventorySearch:search()
        local abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
        local inventorySearchUtil = InventorySearchUtil.getInstance()
        local vector = inventorySearchUtil:getBasicItemIdColumn(self.searchRequest)
        return inventorySearchUtil:search(abeClientInformation, self.searchRequest, vector)
end


-- throws Exception
function InventorySearch:getProduct(product)
        local abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
        return InventorySearchProductUtil.getInstance():getProduct(abeClientInformation, self.searchRequest, product)
end

return InventorySearch


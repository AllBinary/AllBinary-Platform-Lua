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

local InventorySearch = {}
package.loaded["views.generic.inventory.InventorySearch"] = InventorySearch

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local StaticPagesEntity = java_lazy("org.allbinary.data.tables.staticpages.StaticPagesEntity")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SearchParams = java_lazy("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local InputOutputTypeData = java_lazy("org.allbinary.logic.io.InputOutputTypeData")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local InventoryViewSearchInterface = java_lazy("views.admin.inventory.listings.InventoryViewSearchInterface")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local InventorySearchProductUtil = java_lazy("views.generic.inventory.InventorySearchProductUtil")
local InventorySearchUtil = java_lazy("views.generic.inventory.InventorySearchUtil")

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

-- class table InventorySearch is declared before the requires
InventorySearch.__index = InventorySearch
InventorySearch.className = "InventorySearch"
InventorySearch.javaClassName = "views.generic.inventory.InventorySearch"
InventorySearch.java_implements = " InventoryViewSearchInterface "
InventorySearch.java_interfaces = function() return {InventoryViewSearchInterface} end

function InventorySearch:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.searchRequest == nil then self.searchRequest = nil end
end


function InventorySearch._jinit(self, searchRequest)
    InventorySearch._init_fields(self)
        -- super(...) made self above
        self.searchRequest = searchRequest
    return self
end

function InventorySearch.new(...)
    local self = setmetatable({}, InventorySearch)
    InventorySearch._jinit(self, ...)
    return self
end


-- throws Exception
function InventorySearch:searchSingleStaticPage()
        local try_ok, try_error, try_value = pcall(function()
            local storeFront = self.searchRequest:getStoreFront()
            local searchParams = self.searchRequest:getParams()
            local columnValueHashMap = searchParams:get()
            local file = StaticPagesEntity.new():getFile(storeFront:getName(), Replace.new("-", CommonSeps.getInstance().SPACE):all(columnValueHashMap:get(self.basicItemData.KEYWORDS)))
            if StringValidationUtil.getInstance():isEmpty(file) then
                do return "__jreturn", nil end
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
                do return "__jreturn", filePath end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "searchSingleStaticPage", e)
            end
            error(require("java.lang.Exception").new("Failed retrieve Single Product Page Static"), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function InventorySearch:searchSingleDynamicPage()
        local try_ok, try_error, try_value = pcall(function()
            local str = self:search()
            do return "__jreturn", str[require("allbinary_java").number_value(self.searchRequest:getParams():getStartPageInt(), "intValue") + 1] end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "searchSingleDynamicPage", e)
            end
            error(require("java.lang.Exception").new("Failed retrieve Single Product Page Dynamically"), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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


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

local InventorySearchUtil = {}
package.loaded["views.generic.inventory.InventorySearchUtil"] = InventorySearchUtil

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
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local InventoryData = java_lazy("org.allbinary.business.user.commerce.inventory.InventoryData")
local BasketData = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemView = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local InventoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SearchData = java_lazy("org.allbinary.logic.control.search.SearchData")
local SearchParams = java_lazy("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local StoreTransformer = java_lazy("org.allbinary.logic.visual.transform.StoreTransformer")
local TransformDocumentInterface = java_lazy("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformStoreDocumentFactory = java_lazy("org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory")
local TransformInfoHttpSearch = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local InventoryColumnUtil = java_lazy("views.generic.inventory.InventoryColumnUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table InventorySearchUtil is declared before the requires
InventorySearchUtil.__index = InventorySearchUtil
InventorySearchUtil.className = "InventorySearchUtil"
InventorySearchUtil.javaClassName = "views.generic.inventory.InventorySearchUtil"

function InventorySearchUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonPhoneStrings = CommonPhoneStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
end

function InventorySearchUtil._jinit(self)
    InventorySearchUtil._init_fields(self)
    return self
end

function InventorySearchUtil.new()
    return InventorySearchUtil._jinit(setmetatable({}, InventorySearchUtil))
end


function InventorySearchUtil.getInstance()
        return InventorySearchUtil.instance_f
end


-- throws Exception
function InventorySearchUtil:getBasicItemIdColumn(searchRequest)
        local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
        local storeFrontInterface = searchRequest:getStoreFront()
        local inventorySearchUtil = InventoryColumnUtil.getInstance()
        local column = inventorySearchUtil:getColumnWhereLike(inventoryEntityInterface, storeFrontInterface:getCategoryPath(), self.basicItemData.ID)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("Number Of Items Found: ") .. require("allbinary_java").to_string(column:size()), self, "search")
        end
        local subStoreVector = storeFrontInterface:getSubStores()
        local size = subStoreVector:size()
        for index = 0, size - 1 do
            local subStore = subStoreVector:get(index)
            local substoreIdColumn = inventorySearchUtil:getColumnWhereLike(inventoryEntityInterface, subStore, self.basicItemData.ID)
            column:addAllList(substoreIdColumn)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("Number Of Items Found Including SubStores: ") .. require("allbinary_java").to_string(column:size()), self, "search")
        end
        return column
end


-- throws Exception
function InventorySearchUtil:getNoResults(viewDocumentInterface, inventoryNode)
        inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.TOTAL_NUMBER_PAGES, self.commonPhoneStrings.ZERO))
        inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.TOTAL_NUMBER_ITEMS, self.commonPhoneStrings.ZERO))
        local success = XmlDocumentHelper.toString(viewDocumentInterface:getDoc())
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("No Results Xml: ") .. require("allbinary_java").to_string(success), self, "search")
        end
        return success
end


function InventorySearchUtil:search(abeClientInformation, searchRequest, column)
        local try_ok, try_error, try_value = pcall(function()
            local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local searchParams = searchRequest:getParams()
            local startPage = math.tointeger(searchParams:getStartPageInt() // 1)
            local endPage = math.tointeger(searchParams:getEndPageInt() // 1)
            local pageLength = math.tointeger(searchParams:getLengthInt() // 1)
            local savedPagesInRange = 0
            local columnValueHashMap = searchParams:get()
            local keyword = Replace.new("-", CommonSeps.getInstance().SPACE):all(columnValueHashMap:get(self.basicItemData.KEYWORDS))
            if StringValidationUtil.getInstance():isEmpty(keyword) then
                do return "__jreturn", nil end
            end
            local stringBuffer = StringMaker.new()
            if startPage >= 0 then
                if rawequal(pageLength, 0) then
                    pageLength = SearchData.DEFAULT_PAGE_LENGTH
                end
                local MAXPAGES = 100
                local productListingPages = java_new_array(nil, MAXPAGES)
                local documents = java_new_array(nil, MAXPAGES)
                local inventoryNodes = java_new_array(nil, MAXPAGES)
                keyword = string.upper(keyword)
                local lastPage = -1
                local numberOfResultsOnCurrentPage = 0
                local numberOfResults = 0
                local viewDocumentInterface = TransformStoreDocumentFactory.getInstance(searchRequest)
                local inventoryNode = viewDocumentInterface:getDoc():createElement(InventoryData.INVENTORY)
                viewDocumentInterface:getBaseNode():appendChild(inventoryNode)
                inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.PAGE, tostring(startPage)))
                if not rawequal(searchRequest:getFileBaseName(), nil) then
                    inventoryNode:appendChild(searchRequest:getFileBaseNameNode(viewDocumentInterface:getDoc()))
                end
                local currentPage = -1
                local size = column:size()
                for index = 0, size - 1 do
                    local product = tostring(column:get(index))
                    local itemInterface = inventoryEntityInterface:getItem(product)
                    local keywords = itemInterface:getKeywords()
                    keywords = string.upper(keywords)
                    if not rawequal(((string.find(keywords, keyword, 1, true) or 0) - 1), -1) then
                        if currentPage + 1 >= startPage and currentPage + 1 <= endPage then
                            local itemNode = BasicItemView.new(itemInterface, BasicArrayListD.new()):toXmlNode(viewDocumentInterface:getDoc())
                            itemNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), BasketData.ITEMTOTALINBASKET, self.commonPhoneStrings.ONE))
                            inventoryNode:appendChild(itemNode:cloneNode(true))
                        end
                        currentPage = (java_idiv((numberOfResults + 1), pageLength)) - 1
                        numberOfResultsOnCurrentPage = numberOfResultsOnCurrentPage + 1
                        if lastPage < currentPage then
                            if currentPage >= startPage and currentPage <= endPage then
                                inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.TOTAL_NUMBER_ITEMS_ON_THIS_PAGE, tostring(numberOfResultsOnCurrentPage)))
                                documents[currentPage + 1] = viewDocumentInterface:getDoc()
                                inventoryNodes[currentPage + 1] = inventoryNode
                                savedPagesInRange = savedPagesInRange + 1
                                viewDocumentInterface = TransformStoreDocumentFactory.getInstance(searchRequest)
                                inventoryNode = viewDocumentInterface:getDoc():createElement(InventoryData.INVENTORY)
                                viewDocumentInterface:getBaseNode():appendChild(inventoryNode)
                                inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.PAGE, tostring(currentPage + 1)))
                                if not rawequal(searchRequest:getFileBaseName(), nil) then
                                    inventoryNode:appendChild(searchRequest:getFileBaseNameNode(viewDocumentInterface:getDoc()))
                                end
                            end
                            lastPage = currentPage
                            numberOfResultsOnCurrentPage = 0
                        end
                        numberOfResults = numberOfResults + 1
                        if lastPage >= MAXPAGES - 1 then
                            break
                        end
                    end
                end
                if numberOfResultsOnCurrentPage > 0 and (currentPage + 1 >= startPage and currentPage + 1 <= endPage) then
                    inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.TOTAL_NUMBER_ITEMS_ON_THIS_PAGE, tostring(numberOfResultsOnCurrentPage - 1)))
                    documents[lastPage + 1 + 1] = viewDocumentInterface:getDoc()
                    inventoryNodes[lastPage + 1 + 1] = inventoryNode
                    savedPagesInRange = savedPagesInRange + 1
                end
                if numberOfResultsOnCurrentPage > 0 then
                    lastPage = lastPage + 1
                end
                if endPage > MAXPAGES - 1 then
                    endPage = MAXPAGES - 1
                end
                for index = startPage, endPage do
                    if index <= lastPage then
                        local tempDocument = documents[index + 1]
                        inventoryNodes[index + 1]:appendChild(ModDomHelper.createNameValueNodes(tempDocument, SearchData.TOTAL_NUMBER_PAGES, tostring(lastPage + 1)))
                        inventoryNodes[index + 1]:appendChild(ModDomHelper.createNameValueNodes(tempDocument, SearchData.TOTAL_NUMBER_ITEMS, tostring(numberOfResults)))
                        for pageIndex = 0, lastPage do
                            stringBuffer:delete(0, stringBuffer:length())
                            stringBuffer:append(searchRequest:getFileBaseName())
                            if stringBuffer:length() > 0 then
                                if not rawequal(pageIndex, 0) then
                                    stringBuffer:append(tostring(pageIndex))
                                end
                                inventoryNodes[index + 1]:appendChild(ModDomHelper.createNameValueNodes(tempDocument, SearchData.PAGE_INFO, tostring(pageIndex), tostring(stringBuffer)))
                            else
                                inventoryNodes[index + 1]:appendChild(ModDomHelper.createNameValueNodes(tempDocument, SearchData.PAGE_INFO, tostring(pageIndex), SearchData.SEARCH))
                            end
                        end
                        local success = XmlDocumentHelper.toString(tempDocument)
                        productListingPages[index + 1] = StoreTransformer.new(abeClientInformation, TransformInfoHttpSearch.new(searchRequest)):translate(success)
                    end
                end
                if rawequal(savedPagesInRange, 0) then
                    local result = self:getNoResults(viewDocumentInterface, inventoryNode)
                    productListingPages[1] = StoreTransformer.new(abeClientInformation, TransformInfoHttpSearch.new(searchRequest)):translate(result)
                end
                do return "__jreturn", productListingPages end
            else
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "search", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

InventorySearchUtil.instance_f = InventorySearchUtil.new()

return InventorySearchUtil


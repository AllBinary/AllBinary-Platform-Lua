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
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local InventoryData = require("org.allbinary.business.user.commerce.inventory.InventoryData")
local BasketData = require("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local BasicItemView = require("org.allbinary.business.user.commerce.inventory.item.BasicItemView")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchData = require("org.allbinary.logic.control.search.SearchData")
local SearchParams = require("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local StoreTransformer = require("org.allbinary.logic.visual.transform.StoreTransformer")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformStoreDocumentFactory = require("org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory")
local TransformInfoHttpSearch = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local InventorySearchUtil = {}
InventorySearchUtil.__index = InventorySearchUtil
InventorySearchUtil.className = "InventorySearchUtil"

function InventorySearchUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonPhoneStrings = CommonPhoneStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
end

function InventorySearchUtil.new()
    local self = setmetatable({}, InventorySearchUtil)
    self:_init_fields()
    return self
end


function InventorySearchUtil.getInstance()
        return InventorySearchUtil.instance
end


-- throws Exception
function InventorySearchUtil:getBasicItemIdColumn(searchRequest)
        local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
        local storeFrontInterface = searchRequest:getStoreFront()
        local inventorySearchUtil = InventoryColumnUtil.getInstance()
        local column = inventorySearchUtil:getColumnWhereLike(inventoryEntityInterface, storeFrontInterface:getCategoryPath(), self.basicItemData.ID)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF("Number Of Items Found: " .. tostring(column:size()), self, "search")
        end
        local subStoreVector = storeFrontInterface:getSubStores()
        local size = subStoreVector:size()
        for index = 0, size - 1 do
            local subStore = subStoreVector:get(index)
            local substoreIdColumn = inventorySearchUtil:getColumnWhereLike(inventoryEntityInterface, subStore, self.basicItemData.ID)
            column:addAllList(substoreIdColumn)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF("Number Of Items Found Including SubStores: " .. tostring(column:size()), self, "search")
        end
        return column
end


-- throws Exception
function InventorySearchUtil:getNoResults(viewDocumentInterface, inventoryNode)
        inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.TOTAL_NUMBER_PAGES, self.commonPhoneStrings.ZERO))
        inventoryNode:appendChild(ModDomHelper.createNameValueNodes(viewDocumentInterface:getDoc(), SearchData.TOTAL_NUMBER_ITEMS, self.commonPhoneStrings.ZERO))
        local success = XmlDocumentHelper.toString(viewDocumentInterface:getDoc())
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF("No Results Xml: " .. success, self, "search")
        end
        return success
end


function InventorySearchUtil:search(abeClientInformation, searchRequest, column)
        local try_ok, try_error = pcall(function()
            local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local searchParams = searchRequest:getParams()
            local startPage = math.tointeger(searchParams:getStartPageInt() // 1)
            local endPage = math.tointeger(searchParams:getEndPageInt() // 1)
            local pageLength = math.tointeger(searchParams:getLengthInt() // 1)
            local savedPagesInRange = 0
            local columnValueHashMap = searchParams:get()
            local keyword = Replace.new("-", CommonSeps.getInstance().SPACE):all(columnValueHashMap:get(self.basicItemData.KEYWORDS))
            if StringValidationUtil.getInstance():isEmpty(keyword) then
                return nil
            end
            local stringBuffer = StringMaker.new()
            if startPage >= 0 then
                if pageLength == 0 then
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
                if searchRequest:getFileBaseName() ~= nil then
                    inventoryNode:appendChild(searchRequest:getFileBaseNameNode(viewDocumentInterface:getDoc()))
                end
                local currentPage = -1
                local size = column:size()
                for index = 0, size - 1 do
                    local product = tostring(column:get(index))
                    local itemInterface = inventoryEntityInterface:getItem(product)
                    local keywords = itemInterface:getKeywords()
                    keywords = string.upper(keywords)
                    if ((string.find(keywords, keyword, 1, true) or 0) - 1) ~= -1 then
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
                                if searchRequest:getFileBaseName() ~= nil then
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
                                if pageIndex ~= 0 then
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
                if savedPagesInRange == 0 then
                    local result = self:getNoResults(viewDocumentInterface, inventoryNode)
                    productListingPages[1] = StoreTransformer.new(abeClientInformation, TransformInfoHttpSearch.new(searchRequest)):translate(result)
                end
                return productListingPages
            else
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "search", e)
            end
            return nil
        end
end

InventorySearchUtil.instance = InventorySearchUtil.new()

return InventorySearchUtil


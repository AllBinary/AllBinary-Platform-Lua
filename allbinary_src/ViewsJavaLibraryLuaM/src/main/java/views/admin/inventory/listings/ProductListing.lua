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
-- package views.admin.inventory.listings

-- local HashMap = require("java.util.HashMap")
-- local HashSet = require("java.util.HashSet")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local StoreFrontsEntity = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity")
local StaticPagesEntity = require("org.allbinary.data.tables.staticpages.StaticPagesEntity")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchParams = require("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local SpecialCharacterUtil = require("org.allbinary.logic.string.SpecialCharacterUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local UniqueTokens = require("org.allbinary.logic.string.tokens.UniqueTokens")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local InventoryColumnUtil = require("views.generic.inventory.InventoryColumnUtil")
local InventorySearchUtil = require("views.generic.inventory.InventorySearchUtil")
local ProductListingInterface = require("views.admin.inventory.listings.ProductListingInterface")

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

local ProductListing = {}
ProductListing.__index = ProductListing
ProductListing.className = "ProductListing"

function ProductListing:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.directory = Directory.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.storeFronts = nil
    self.staticPages = nil
    self.inventory = nil
    self.searchRequest = nil
    self.INVENTORY = ".InventoryView"
end


function ProductListing.new(searchRequest)
    local self = setmetatable({}, ProductListing)
    self:_init_fields()
        self.searchRequest = searchRequest
        self.storeFronts = StoreFrontsEntity.new()
        self.staticPages = StaticPagesEntity.new()
        self.inventory = InventoryEntity.new()
    return self
end


-- throws Exception
function ProductListing:getHashSet(storeFront)
        local inventoryColumnUtil = InventoryColumnUtil.getInstance()
        local keywords = inventoryColumnUtil:getColumnWhereLike(self.inventory, storeFront:getCategoryPath(), self.basicItemData.KEYWORDS)
        local subStoreVector = storeFront:getSubStores()
        local size = subStoreVector:size()
        for index = 0, size - 1 do
            local subStore = subStoreVector:get(index)
            local substoreKeywords = inventoryColumnUtil:getColumnWhereLike(self.inventory, tostring(AbPathData.getInstance().SEPARATOR) .. subStore, self.basicItemData.CATEGORY)
            keywords:addAllList(substoreKeywords)
        end
        local uniqueTokens = UniqueTokens.new()
        local keywordHashSet = uniqueTokens:getWhithoutDashesAndSkipNumberOnlyTokens(keywords)
        return keywordHashSet
end


-- throws Exception
function ProductListing:savePage(file, data)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STATICPAGEGENERATIONLOGGING) then
            self.logUtil:putF("Creating File: " .. file, self, "generateAll()")
        end
        local newFile = AbFile.createAbFile(file)
        if newFile:exists() then
            newFile:delete()
        end
        newFile:createNewFile()
        if newFile:exists() then
            local idOutData = DataOutputStreamFactory.getInstance():getInstanceForAbFile(newFile)
            idOutData:writeBytes(data)
            idOutData:flush()
            StreamUtil.getInstance():close(idOutData)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STATICPAGEGENERATIONLOGGING) then
                self.logUtil:putF("Wrote Total Bytes: " .. tostring(newFile:length()), self, "generateAll()")
            end
        else
            error(java_exception("Exception", "Could Not Create: " .. file), 0)
        end
end


-- throws Exception
function ProductListing:create(keywordData, keywordFilenameHashMap, vector, staticPath)
        local stringBuffer = StringMaker.new()
        local hashMap = SpecialCharacterUtil.getHashMap()
        hashMap:put(CommonSeps.getInstance().SPACE, StringUtil.getInstance().EMPTY_STRING)
        local pageName = Replace.new(hashMap):all(keywordData)
        local searchParams = self.searchRequest:getParams()
        searchParams:add(self.basicItemData.KEYWORDS, keywordData)
        searchParams:setStartPage(CommonPhoneStrings.getInstance().ZERO)
        self.searchRequest:setParams(searchParams)
        self.searchRequest:setFileBaseName(pageName)
        local abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
        local inventorySearchUtil = InventorySearchUtil.getInstance()
        local productListingPages = inventorySearchUtil:search(abeClientInformation, self.searchRequest, vector)
        for index = 0, (productListingPages.n or #productListingPages) - 1 do
            if productListingPages[index + 1] == nil then
                break
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STATICPAGEGENERATIONLOGGING) then
                self.logUtil:putF("Saving Listing: " .. tostring(index), self, "generateAll()")
            end
            local indexStr = StringUtil.getInstance().EMPTY_STRING
            if index > 0 then
                indexStr = tostring(index)
            end
            keywordFilenameHashMap:put(keywordData, pageName .. indexStr)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(tostring(staticPath))
            stringBuffer:append(pageName)
            stringBuffer:append(indexStr)
            stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
            stringBuffer:append(InputOutputTypeData.getInstance().DEFAULT)
            local file = tostring(stringBuffer)
            if not self.directory:create(staticPath) then
                error(java_exception("Exception", "Could Not Create Directory: " .. tostring(staticPath)), 0)
            end
            self:savePage(file, productListingPages[index + 1])
        end
end


function ProductListing:addStaticPageInfoToDatabase(storeFront, keywordFilenameHashMap)
        local keywordHashSet = keywordFilenameHashMap:keySet()
        local keywordArray = keywordHashSet:toArray()
        local size = (keywordArray.n or #keywordArray)
        for index = 0, size - 1 do
            local insertVector = BasicArrayListD.new()
            local keywordData = keywordArray[index + 1]
            local fileName = keywordFilenameHashMap:get(keywordData)
            insertVector:add(storeFront:getName())
            insertVector:add(keywordData)
            insertVector:add(fileName)
            self.staticPages:insert(insertVector)
        end
end


-- throws Exception
function ProductListing:generateAll()
        local try_ok, try_error = pcall(function()
            local storeFront = self.searchRequest:getStoreFront()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            stringBuffer:append(storeFront:getName())
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            stringBuffer:append(storeFront:getStaticPath())
            local staticPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().STATICPAGEGENERATIONLOGGING) then
                self.logUtil:putF("Store Static Pages Path: " .. tostring(staticPath), self, "generateAll()")
            end
            local keywordHashSet = self:getHashSet(storeFront)
            local keywordArray = keywordHashSet:toArray()
            local size = (keywordArray.n or #keywordArray)
            local keywordFilenameHashMap = StdUtil.getInstance():createHashMap()
            if size == 0 then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Products For ")
                stringBuffer:append(storeFront:getName())
                stringBuffer:append(" Store Not Found")
                return tostring(stringBuffer)
            end
            local inventorySearchUtil = InventorySearchUtil.getInstance()
            local vector = inventorySearchUtil:getBasicItemIdColumn(self.searchRequest)
            for index = 0, size - 1 do
                local keywordData = keywordArray[index + 1]
                if #keywordData > 1 then
                    self:create(keywordData, keywordFilenameHashMap, vector, staticPath)
                end
            end
            self:addStaticPageInfoToDatabase(storeFront, keywordFilenameHashMap)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("Static Files Generated Successfully For ")
            stringBuffer:append(storeFront:getName())
            stringBuffer:append(" it used packages ")
            stringBuffer:append(storeFront:getPackageLocation())
            stringBuffer:append(self.INVENTORY)
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ProductListing:generateAll(storeName)
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if storeName ~= nil then
                if ((storeName < self.GLOBALS2.GENERATEALLSTORES and -1) or (storeName > self.GLOBALS2.GENERATEALLSTORES and 1) or 0) ~= 0 then
                    self.searchRequest:setStoreFront(self.storeFronts:getStoreFrontInterface(storeName))
                    stringBuffer:append(self:generateAll())
                    stringBuffer:append("<br />")
                else
                    local storeFrontVector = self.storeFronts:getStoreFrontNames()
                    local size = storeFrontVector:size()
                    for index = 0, size - 1 do
                        storeName = storeFrontVector:get(index)
                        self.searchRequest:setStoreFront(self.storeFronts:getStoreFrontInterface(storeName))
                        stringBuffer:append(self:generateAll())
                        stringBuffer:append("<br />")
                    end
                end
            else
                return "Generation Failed No Store Specified<br/>"
            end
            stringBuffer:append("All Static Pages Generated<br/>")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

return ProductListing


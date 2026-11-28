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

local ProductListing = {}
package.loaded["views.admin.inventory.listings.ProductListing"] = ProductListing

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
local HashSet = java_lazy("java.util.HashSet")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local StoreFrontsEntity = java_lazy("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity")
local StaticPagesEntity = java_lazy("org.allbinary.data.tables.staticpages.StaticPagesEntity")
local InventoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SearchParams = java_lazy("org.allbinary.logic.control.search.SearchParams")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local DataOutputStreamFactory = java_lazy("org.allbinary.logic.io.DataOutputStreamFactory")
local InputOutputTypeData = java_lazy("org.allbinary.logic.io.InputOutputTypeData")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local SpecialCharacterUtil = java_lazy("org.allbinary.logic.string.SpecialCharacterUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local UniqueTokens = java_lazy("org.allbinary.logic.string.tokens.UniqueTokens")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local InventoryColumnUtil = java_lazy("views.generic.inventory.InventoryColumnUtil")
local InventorySearchUtil = java_lazy("views.generic.inventory.InventorySearchUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table ProductListing is declared before the requires
ProductListing.__index = ProductListing
ProductListing.className = "ProductListing"
ProductListing.javaClassName = "views.admin.inventory.listings.ProductListing"
ProductListing.java_implements = " ProductListingInterface "
ProductListing.java_interfaces = function() return {ProductListingInterface} end

function ProductListing:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.directory = Directory.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.storeFronts == nil then self.storeFronts = nil end
    if self.staticPages == nil then self.staticPages = nil end
    if self.inventory == nil then self.inventory = nil end
    if self.searchRequest == nil then self.searchRequest = nil end
    self.INVENTORY = ".InventoryView"
end


function ProductListing._jinit(self, searchRequest)
    ProductListing._init_fields(self)
        self.searchRequest = searchRequest
        self.storeFronts = StoreFrontsEntity.new()
        self.staticPages = StaticPagesEntity.new()
        self.inventory = InventoryEntity.new()
    return self
end

function ProductListing.new(...)
    local self = setmetatable({}, ProductListing)
    ProductListing._jinit(self, ...)
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
            local substoreKeywords = inventoryColumnUtil:getColumnWhereLike(self.inventory, require("allbinary_java").to_string(AbPathData.getInstance().SEPARATOR) .. require("allbinary_java").to_string(subStore), self.basicItemData.CATEGORY)
            keywords:addAllList(substoreKeywords)
        end
        local uniqueTokens = UniqueTokens.new()
        local keywordHashSet = uniqueTokens:getWhithoutDashesAndSkipNumberOnlyTokens(keywords)
        return keywordHashSet
end


-- throws Exception
function ProductListing:savePage(file, data)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("Creating File: ") .. require("allbinary_java").to_string(file), self, "generateAll()")
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string("Wrote Total Bytes: ") .. require("allbinary_java").to_string(newFile:length()), self, "generateAll()")
            end
        else
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("Could Not Create: ") .. require("allbinary_java").to_string(file)), 0)
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
            if rawequal(productListingPages[index + 1], nil) then
                break
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string("Saving Listing: ") .. require("allbinary_java").to_string(index), self, "generateAll()")
            end
            local indexStr = StringUtil.getInstance().EMPTY_STRING
            if index > 0 then
                indexStr = tostring(index)
            end
            keywordFilenameHashMap:put(keywordData, require("allbinary_java").to_string(pageName) .. require("allbinary_java").to_string(indexStr))
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(tostring(staticPath))
            stringBuffer:append(pageName)
            stringBuffer:append(indexStr)
            stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
            stringBuffer:append(InputOutputTypeData.getInstance().DEFAULT)
            local file = tostring(stringBuffer)
            if not (self.directory:create(staticPath)) then
                error(require("java.lang.Exception").new(require("allbinary_java").to_string("Could Not Create Directory: ") .. require("allbinary_java").to_string(staticPath)), 0)
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
function ProductListing:generateAll_j0()
        local try_ok, try_error, try_value = pcall(function()
            local storeFront = self.searchRequest:getStoreFront()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getWebappPath())
            stringBuffer:append(storeFront:getName())
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            stringBuffer:append(storeFront:getStaticPath())
            local staticPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING) then
                self.logUtil:putF(require("allbinary_java").to_string("Store Static Pages Path: ") .. require("allbinary_java").to_string(staticPath), self, "generateAll()")
            end
            local keywordHashSet = self:getHashSet(storeFront)
            local keywordArray = keywordHashSet:toArray()
            local size = (keywordArray.n or #keywordArray)
            local keywordFilenameHashMap = StdUtil.getInstance():createHashMap()
            if rawequal(size, 0) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Products For ")
                stringBuffer:append(storeFront:getName())
                stringBuffer:append(" Store Not Found")
                do return "__jreturn", tostring(stringBuffer) end
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
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function ProductListing:generateAll_j1(storeName)
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            if not rawequal(storeName, nil) then
                if not rawequal(((storeName < GLOBALS2.GENERATEALLSTORES and -1) or (storeName > GLOBALS2.GENERATEALLSTORES and 1) or 0), 0) then
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
                do return "__jreturn", "Generation Failed No Store Specified<br/>" end
            end
            stringBuffer:append("All Static Pages Generated<br/>")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function ProductListing:generateAll(...)
    local count = select("#", ...)
    if count == 0 then return self:generateAll_j0(...) end
    if count == 1 then return self:generateAll_j1(...) end
    error("No method generateAll takes " .. count .. " arguments")
end
ProductListing.generateAll__jdispatcher = ProductListing.generateAll

return ProductListing


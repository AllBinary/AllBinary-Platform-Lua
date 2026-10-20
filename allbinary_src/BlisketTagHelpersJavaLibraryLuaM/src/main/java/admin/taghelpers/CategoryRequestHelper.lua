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
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local CategoryComponent = require("org.allbinary.business.category.CategoryComponent")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local StoreCategoryFactory = require("org.allbinary.business.category.store.StoreCategoryFactory")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local CategoryLoaderFactory = require("org.allbinary.data.tree.category.CategoryLoaderFactory")
local CategoryLoaderInterface = require("org.allbinary.data.tree.category.CategoryLoaderInterface")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoBasic = require("org.allbinary.logic.visual.transform.info.TransformInfoBasic")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ModifyTable = require("admin.taghelpers.ModifyTable")

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

local CategoryRequestHelper = {}
CategoryRequestHelper.__index = CategoryRequestHelper
CategoryRequestHelper.className = "CategoryRequestHelper"
setmetatable(CategoryRequestHelper, {__index = ModifyTable})

function CategoryRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.pageContext = nil
    self.hashMap = nil
    self.request = nil
    self.categoryLoaderInterface = nil
    self.categoryInterface = nil
    self.childCategoryInterface = nil
    self.transformInfoInterface = nil
end


function CategoryRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), CategoryRequestHelper)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.request = pageContext:getRequest()
            self.pageContext = pageContext
            self.hashMap = hashMap
            self:getXmlData()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "CategoryRequestHelper()", e)
            end
        end
    return self
end


function CategoryRequestHelper:getXmlData()
        local try_ok, try_error = pcall(function()
            local map = self.request:getParameterMap()
            local categoryData = CategoryData.getInstance()
            local keys = map:keySet()
            local keyArray = keys:toArray()
            local size = (keyArray.n or #keyArray)
            if size > 0 then
                local xmlRequest = keyArray[1]
                local index = 1
                while index < size and not (string.sub(xmlRequest, 1, #CategoryRequestHelper.categoryRequest) == CategoryRequestHelper.categoryRequest) do
                    xmlRequest = keyArray[index + 1]
                    if (string.sub(xmlRequest, 1, #CategoryRequestHelper.categoryRequest) == CategoryRequestHelper.categoryRequest) then
                        break
                    end
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.logUtil:putF(xmlRequest, self, "getXmlData()")
                end
                local document = DomDocumentHelper.create(xmlRequest)
                local requestNode = DomSearchHelper.getNode(categoryData.REQUEST, document:getChildNodes())
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.logUtil:putF(XmlDocumentHelper.toString(document), self, "getXmlData()")
                end
                self:setCategoryLoader(requestNode)
                local parentCategoryNode = DomSearchHelper.getNode(categoryData.PARENT, requestNode:getChildNodes())
                local categoryNode = DomSearchHelper.getNode(categoryData.NAME, parentCategoryNode:getChildNodes())
                self.categoryInterface = StoreCategoryFactory.new(self.transformInfoInterface):getRootInstanceFromNode(categoryNode)
                self.categoryInterface = self.categoryLoaderInterface:get(self.categoryInterface)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                    self.categoryInterface:log()
                    self.logUtil:putF("Loaded Parent Category", self, "getXmlData()")
                end
                local childCategoryNode = DomSearchHelper.getNodeNoThrow(categoryData.NAME, requestNode:getChildNodes())
                if childCategoryNode ~= nil then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                        self.logUtil:putF("Loading Child Category", self, "getXmlData()")
                    end
                    self.childCategoryInterface = StoreCategoryFactory.new(self.transformInfoInterface):getInstance(childCategoryNode)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                        self.childCategoryInterface:log()
                        self.logUtil:putF("Loaded Child Category", self, "getXmlData()")
                    end
                else
                    self.childCategoryInterface = self.categoryInterface
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getXmlData()", e)
            end
        end
end


-- throws Exception
function CategoryRequestHelper:setCategoryLoader(requestNode)
        local storeNameNode = DomSearchHelper.getNode(StoreFrontData.getInstance().NAME, requestNode:getChildNodes())
        if storeNameNode ~= nil then
            local storeName = DomNodeHelper.getTextNodeValue(storeNameNode)
            if storeName ~= nil then
                local storeFrontInterface = StoreFrontFactory.getInstance(storeName)
                self.transformInfoInterface = TransformInfoBasic.new(storeFrontInterface, self.hashMap, self.pageContext)
                if self.transformInfoInterface == nil then
                    error(java_exception("Exception", "TransformInfo null"), 0)
                end
                local storeCategoryFactory = StoreCategoryFactory.new(self.transformInfoInterface)
                self.categoryLoaderInterface = CategoryLoaderFactory.getInstance(storeCategoryFactory)
            else
                error(java_exception("Exception", "Store Name Error: " .. storeName), 0)
            end
        end
end


function CategoryRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Added the following to the Category table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("inserting", self, "insert()")
            end
            self.categoryLoaderInterface:insert(self.categoryInterface, self.childCategoryInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add item to Category"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
end


function CategoryRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            local success = "Successfully Removed " .. tostring(CategoryData.getInstance().NAME) .. "=" .. tostring(self.childCategoryInterface:getPath())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Deleting", self, "delete()")
            end
            self.categoryLoaderInterface:delete(self.categoryInterface, self.childCategoryInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local try_ok, try_error = pcall(function()
                local error = "Failed to remove category: " .. tostring(self.childCategoryInterface:getPath())
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
                end
                return error
            end)
            if not try_ok then
                local e2 = try_error
                local error = "Failed to remove category and show the path of the failed category"
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e2)
                end
                return error
            end
        end
end


function CategoryRequestHelper:viewCategory()
        local try_ok, try_error = pcall(function()
            local document = CategoryComponent.new(self.childCategoryInterface):toXmlDoc()
            local xmlString = XmlDocumentHelper.toString(document)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(xmlString, self, "viewCategory()")
            end
            return xmlString
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to get Category"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "viewCategory()", e)
            end
            return error
        end
end


function CategoryRequestHelper:viewCategories()
        local try_ok, try_error = pcall(function()
            local success = StringUtil.getInstance().EMPTY_STRING
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "viewCategories()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view Categories table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "viewCategories()", e)
            end
            return error
        end
end


function CategoryRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "New Item Successfully added"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add Item"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end

CategoryRequestHelper.categoryRequest = tostring(StringMaker.new():append("<"):append(CategoryData.getInstance().REQUEST):append(">"))

return CategoryRequestHelper


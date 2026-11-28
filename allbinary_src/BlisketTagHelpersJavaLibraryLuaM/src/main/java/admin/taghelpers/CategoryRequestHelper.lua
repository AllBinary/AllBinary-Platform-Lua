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

local CategoryRequestHelper = {}
package.loaded["admin.taghelpers.CategoryRequestHelper"] = CategoryRequestHelper

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
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local CategoryComponent = java_lazy("org.allbinary.business.category.CategoryComponent")
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local StoreCategoryFactory = java_lazy("org.allbinary.business.category.store.StoreCategoryFactory")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local CategoryLoaderFactory = java_lazy("org.allbinary.data.tree.category.CategoryLoaderFactory")
local CategoryLoaderInterface = java_lazy("org.allbinary.data.tree.category.CategoryLoaderInterface")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local TransformInfoBasic = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoBasic")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table CategoryRequestHelper is declared before the requires
CategoryRequestHelper.__index = CategoryRequestHelper
CategoryRequestHelper.className = "CategoryRequestHelper"
CategoryRequestHelper.javaClassName = "admin.taghelpers.CategoryRequestHelper"
setmetatable(CategoryRequestHelper, {__index = ModifyTable})

function CategoryRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.pageContext == nil then self.pageContext = nil end
    if self.hashMap == nil then self.hashMap = nil end
    if self.request == nil then self.request = nil end
    if self.categoryLoaderInterface == nil then self.categoryLoaderInterface = nil end
    if self.categoryInterface == nil then self.categoryInterface = nil end
    if self.childCategoryInterface == nil then self.childCategoryInterface = nil end
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
end


function CategoryRequestHelper._jinit(self, hashMap, pageContext)
    java_super_init(ModifyTable, self)
    CategoryRequestHelper._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.request = pageContext:getRequest()
            self.pageContext = pageContext
            self.hashMap = hashMap
            self:getXmlData()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "CategoryRequestHelper()", e)
            end
        end
    return self
end

function CategoryRequestHelper.new(...)
    local self = setmetatable({}, CategoryRequestHelper)
    CategoryRequestHelper._jinit(self, ...)
    return self
end


function CategoryRequestHelper:getXmlData()
        local try_ok, try_error, try_value = pcall(function()
            local map = self.request:getParameterMap()
            local categoryData = CategoryData.getInstance()
            local keys = map:keySet()
            local keyArray = keys:toArray()
            local size = (keyArray.n or #keyArray)
            if size > 0 then
                local xmlRequest = keyArray[1]
                local index = 1
                while index < size and not ((string.sub(xmlRequest, 1, #CategoryRequestHelper.categoryRequest) == CategoryRequestHelper.categoryRequest)) do
                    xmlRequest = keyArray[index + 1]
                    if (string.sub(xmlRequest, 1, #CategoryRequestHelper.categoryRequest) == CategoryRequestHelper.categoryRequest) then
                        break
                    end
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.logUtil:putF(xmlRequest, self, "getXmlData()")
                end
                local document = DomDocumentHelper.create(xmlRequest)
                local requestNode = DomSearchHelper.getNode(categoryData.REQUEST, document:getChildNodes())
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.logUtil:putF(XmlDocumentHelper.toString(document), self, "getXmlData()")
                end
                self:setCategoryLoader(requestNode)
                local parentCategoryNode = DomSearchHelper.getNode(categoryData.PARENT, requestNode:getChildNodes())
                local categoryNode = DomSearchHelper.getNode(categoryData.NAME, parentCategoryNode:getChildNodes())
                self.categoryInterface = StoreCategoryFactory.new(self.transformInfoInterface):getRootInstanceFromNode(categoryNode)
                self.categoryInterface = self.categoryLoaderInterface:get(self.categoryInterface)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                    self.categoryInterface:log()
                    self.logUtil:putF("Loaded Parent Category", self, "getXmlData()")
                end
                local childCategoryNode = DomSearchHelper.getNodeNoThrow(categoryData.NAME, requestNode:getChildNodes())
                if not rawequal(childCategoryNode, nil) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                        self.logUtil:putF("Loading Child Category", self, "getXmlData()")
                    end
                    self.childCategoryInterface = StoreCategoryFactory.new(self.transformInfoInterface):getInstance(childCategoryNode)
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getXmlData()", e)
            end
        end
end
java_overload(CategoryRequestHelper, "getXmlData", 0)


-- throws Exception
function CategoryRequestHelper:setCategoryLoader(requestNode)
        local storeNameNode = DomSearchHelper.getNode(StoreFrontData.getInstance().NAME, requestNode:getChildNodes())
        if not rawequal(storeNameNode, nil) then
            local storeName = DomNodeHelper.getTextNodeValue(storeNameNode)
            if not rawequal(storeName, nil) then
                local storeFrontInterface = StoreFrontFactory.getInstance(storeName)
                self.transformInfoInterface = TransformInfoBasic.new(storeFrontInterface, self.hashMap, self.pageContext)
                if rawequal(self.transformInfoInterface, nil) then
                    error(require("java.lang.Exception").new("TransformInfo null"), 0)
                end
                local storeCategoryFactory = StoreCategoryFactory.new(self.transformInfoInterface)
                self.categoryLoaderInterface = CategoryLoaderFactory.getInstance(storeCategoryFactory)
            else
                error(require("java.lang.Exception").new(require("allbinary_java").to_string("Store Name Error: ") .. require("allbinary_java").to_string(storeName)), 0)
            end
        end
end
java_overload(CategoryRequestHelper, "setCategoryLoader", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Node")) end)


function CategoryRequestHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Successfully Added the following to the Category table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF("inserting", self, "insert()")
            end
            self.categoryLoaderInterface:insert(self.categoryInterface, self.childCategoryInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add item to Category"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryRequestHelper, "insert", 0)


function CategoryRequestHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            local success = require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Successfully Removed ") .. require("allbinary_java").to_string(CategoryData.getInstance().NAME)) .. require("allbinary_java").to_string("=")) .. require("allbinary_java").to_string(self.childCategoryInterface:getPath())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF("Deleting", self, "delete()")
            end
            self.categoryLoaderInterface:delete(self.categoryInterface, self.childCategoryInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local try_ok, try_error, try_value = pcall(function()
                local error = require("allbinary_java").to_string("Failed to remove category: ") .. require("allbinary_java").to_string(self.childCategoryInterface:getPath())
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
                end
                do return "__jreturn", error end
            end)
            if not try_ok then
                local e2 = try_error
                if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                local error = "Failed to remove category and show the path of the failed category"
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e2)
                end
                return error
            end
            if try_ok and try_error == "__jreturn" then return try_value end
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryRequestHelper, "delete", 0)


function CategoryRequestHelper:viewCategory()
        local try_ok, try_error, try_value = pcall(function()
            local document = CategoryComponent.new(self.childCategoryInterface):toXmlDoc()
            local xmlString = XmlDocumentHelper.toString(document)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(xmlString, self, "viewCategory()")
            end
            do return "__jreturn", xmlString end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to get Category"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "viewCategory()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryRequestHelper, "viewCategory", 0)


function CategoryRequestHelper:viewCategories()
        local try_ok, try_error, try_value = pcall(function()
            local success = StringUtil.getInstance().EMPTY_STRING
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "viewCategories()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to view Categories table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "viewCategories()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryRequestHelper, "viewCategories", 0)


function CategoryRequestHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "New Item Successfully added"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add Item"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CategoryRequestHelper, "update", 0)

CategoryRequestHelper.categoryRequest = tostring(StringMaker.new():append("<"):append(CategoryData.getInstance().REQUEST):append(">"))

return CategoryRequestHelper


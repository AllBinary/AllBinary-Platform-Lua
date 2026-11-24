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
-- package org.allbinary.business.category

local Category = {}
package.loaded["org.allbinary.business.category.Category"] = Category

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
local CategoryHierarchy = java_lazy("org.allbinary.business.category.hierarchy.CategoryHierarchy")
local CategoryHierarchyInterface = java_lazy("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local CategoryPropertiesFactoryInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local CategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local RootCategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")

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

-- class table Category is declared before the requires
Category.__index = Category
Category.className = "Category"
Category.javaClassName = "org.allbinary.business.category.Category"
Category.java_implements = " CategoryInterface "
Category.java_interfaces = function() return {CategoryInterface} end

function Category:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.categoryHierarchyInterface == nil then self.categoryHierarchyInterface = nil end
    if self.categoryPropertiesInterface == nil then self.categoryPropertiesInterface = nil end
    self.childCategoryVector = BasicArrayListD.new()
    self.typeVector = BasicArrayListD.new()
    self.PROPERTIES = 1
    self.CATEGORY = 0
end

function Category._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Category._new1(self, ...)
    elseif count == 2 then return Category._new2(self, ...)
    elseif count == 3 then return Category._new3(self, ...)
    end
    error("No constructor of Category takes " .. count .. " arguments")
end

function Category.new(...)
    local self = setmetatable({}, Category)
    Category._jinit(self, ...)
    return self
end


function Category._new1(self, categoryPropertiesFactoryInterface)
    Category._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "Category(CategoryPropertiesFactoryInterface)")
        end
        self.categoryPropertiesInterface = categoryPropertiesFactoryInterface:getInstance()
        self.categoryHierarchyInterface = CategoryHierarchy.new(self, self)
        self:log()
    return self
end


function Category._new2(self, categoryPropertiesFactoryInterface, level)
    Category._init_fields(self)
        self.categoryPropertiesInterface = categoryPropertiesFactoryInterface:getInstance()
        self.categoryHierarchyInterface = CategoryHierarchy.new(self, self, level)
        self:log()
    return self
end


function Category._new3(self, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    Category._init_fields(self)
        self.categoryPropertiesInterface = categoryPropertiesFactoryInterface:getInstance()
        self.categoryHierarchyInterface = CategoryHierarchy.new(rootCategoryInterface, parentCategoryInterface)
        self:log()
    return self
end


-- throws Exception
function Category:getKey()
        return self.categoryPropertiesInterface:getKey()
end


-- throws Exception
function Category:getRootFilePath()
        local rootAbPath = AbPath.new(Category.NOT_ROOT, StringUtil.getInstance().EMPTY_STRING)
        local categoryInterface = self.categoryHierarchyInterface:getRoot()
        if categoryInterface:getProperties():isRoot() then
            local rootCategoryPropertiesInterface = categoryInterface:getProperties()
            rootAbPath = rootCategoryPropertiesInterface:getRootFilePath()
        end
        return rootAbPath
end


-- throws Exception
function Category:getFilePath()
        return AbPath.new(tostring(self:getRootFilePath()) .. tostring(self:getProperties():getPath(self:getHierarchy())), self:getProperties():getFileName())
end


-- throws Exception
function Category:getWebAppPath()
        local categoryInterface = self.categoryHierarchyInterface:getRoot()
        return categoryInterface:getProperties():getWebAppPath()
end


-- throws Exception
function Category:getPath()
        return self.categoryPropertiesInterface:getPath(self.categoryHierarchyInterface)
end


function Category:addChildProperty(categoryPropertiesInterface)
        self.typeVector:add(self.PROPERTIES)
        return self.childCategoryVector:add(categoryPropertiesInterface)
end


function Category:addChild(categoryInterface)
        self:removeDuplicateChild(categoryInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF("adding", self, "addChild")
        end
        local childCategoryHierarchyInterface = categoryInterface:getHierarchy()
        childCategoryHierarchyInterface:setParent(self)
        childCategoryHierarchyInterface:setRoot(self:getHierarchy():getRoot())
        categoryInterface:setHierarchy(childCategoryHierarchyInterface)
        self.typeVector:add(self.CATEGORY)
        return self.childCategoryVector:add(categoryInterface)
end


function Category:getChildNodes()
        return self.childCategoryVector
end


function Category:removeChild(categoryInterface)
        local removalVector = BasicArrayListD.new()
        local bool_return = false
        local size = self.childCategoryVector:size()
        for index = 0, size - 1 do
            if self.CATEGORY == self.typeVector:get(index) then
                local anyType = self.childCategoryVector:get(index)
                local currentCategoryInterface = anyType
                if currentCategoryInterface:getProperties():getValue():compareTo(categoryInterface:getProperties():getValue()) == 0 then
                    removalVector:add(currentCategoryInterface)
                    bool_return = true
                end
            end
        end
        self:removal(removalVector)
        return bool_return
end


function Category:removal(removalVector)
        local removalSize = removalVector:size()
        for index = 0, removalSize - 1 do
            local anyType = removalVector:get(index)
            local objectIndex = self.childCategoryVector:indexOf(anyType)
            self.typeVector:remove(objectIndex)
            self.childCategoryVector:remove(objectIndex)
        end
end


function Category:removeDuplicateChild(categoryInterface)
        local removalVector = BasicArrayListD.new()
        local bool_return = false
        local size = self.childCategoryVector:size()
        for index = 0, size - 1 do
            local anyType = self.childCategoryVector:get(index)
            if self.PROPERTIES == self.typeVector:get(index) then
                local categoryPropertiesInterface = anyType
                if categoryInterface:getProperties():getValue():compareTo(categoryPropertiesInterface:getValue()) == 0 then
                    removalVector:add(categoryPropertiesInterface)
                    bool_return = true
                    break
                end
            elseif self.CATEGORY == self.typeVector:get(index) then
                local existingCategoryInterface = anyType
                local categoryPropertiesInterface = existingCategoryInterface:getProperties()
                if categoryInterface:getProperties():getValue():compareTo(categoryPropertiesInterface:getValue()) == 0 then
                    removalVector:add(existingCategoryInterface)
                    bool_return = true
                    break
                end
            end
        end
        self:removal(removalVector)
        return bool_return
end


-- throws Exception
function Category:isLeaf()
        if self.childCategoryVector == nil then
            error(require("java.lang.Exception").new("Category Error"), 0)
        end
        if self.childCategoryVector:size() == 0 then
            return true
        else
            return false
        end
end


function Category:getProperties()
        return self.categoryPropertiesInterface
end


function Category:setProperties(categoryPropertiesInterface)
        self.categoryPropertiesInterface = categoryPropertiesInterface
end


function Category:getHierarchy()
        return self.categoryHierarchyInterface
end


function Category:setHierarchy(categoryHierarchyInterface)
        self.categoryHierarchyInterface = categoryHierarchyInterface
end


-- throws Exception
function Category:isValid()
        if not self.categoryPropertiesInterface:isValid() then
            return false
        end
        local size = self.childCategoryVector:size()
        for index = 0, size - 1 do
            local anyType = self.childCategoryVector:get(index)
            if self.PROPERTIES == self.typeVector:get(index) then
                local categoryPropertiesInterface = anyType
                if not categoryPropertiesInterface:isValid() then
                    return false
                end
            elseif self.CATEGORY == self.typeVector:get(index) then
                local categoryInterface = anyType
                if not categoryInterface:isValid() then
                    return false
                end
            end
        end
        return true
end


-- throws Exception
function Category:toValidationInfoDoc()
        return nil
end


-- throws Exception
function Category:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function Category:validationInfo()
        return nil
end


-- throws Exception
function Category:toHashMap()
        local categoryHashMap = self.categoryPropertiesInterface:toHashMap()
        return categoryHashMap
end


-- throws Exception
function Category:toVector()
        local categoryVector = self.categoryPropertiesInterface:toVector()
        categoryVector:add(self.childCategoryVector)
        return categoryVector
end


-- throws Exception
function Category:log()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Category Name: ")
            stringBuffer:append(self.categoryPropertiesInterface:getValue())
            stringBuffer:append("\nPath = ")
            stringBuffer:append(tostring(self:getPath()))
            stringBuffer:append("\nFile Path: ")
            stringBuffer:append(tostring(self:getFilePath()))
            self.logUtil:putF(tostring(stringBuffer), self, "log()")
        end
end

Category.NOT_ROOT = "This is not the root so it has no file path."

return Category


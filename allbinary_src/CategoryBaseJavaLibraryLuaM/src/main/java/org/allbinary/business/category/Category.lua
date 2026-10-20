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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CategoryHierarchy = require("org.allbinary.business.category.hierarchy.CategoryHierarchy")
local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local RootCategoryPropertiesInterface = require("org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Category = {}
Category.__index = Category
Category.className = "Category"

function Category:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.categoryHierarchyInterface = nil
    self.categoryPropertiesInterface = nil
    self.childCategoryVector = BasicArrayListD.new()
    self.typeVector = BasicArrayListD.new()
    self.PROPERTIES = 1
    self.CATEGORY = 0
end

function Category.new(...)
    local count = select("#", ...)
    if count == 1 then return Category._new1(...)
    elseif count == 2 then return Category._new2(...)
    elseif count == 3 then return Category._new3(...)
    end
end


function Category._new1(categoryPropertiesFactoryInterface)
    local self = setmetatable({}, Category)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "Category(CategoryPropertiesFactoryInterface)")
        end
        self.categoryPropertiesInterface = categoryPropertiesFactoryInterface:getInstance()
        self.categoryHierarchyInterface = CategoryHierarchy.new(self, self)
        self:log()
    return self
end


function Category._new2(categoryPropertiesFactoryInterface, level)
    local self = setmetatable({}, Category)
    self:_init_fields()
        self.categoryPropertiesInterface = categoryPropertiesFactoryInterface:getInstance()
        self.categoryHierarchyInterface = CategoryHierarchy.new(self, self, level)
        self:log()
    return self
end


function Category._new3(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    local self = setmetatable({}, Category)
    self:_init_fields()
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
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
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
            error(java_exception("Exception", "Category Error"), 0)
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
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
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


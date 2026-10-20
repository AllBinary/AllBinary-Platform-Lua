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
-- package org.allbinary.data.tree.category

local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local CategoryProperties = require("org.allbinary.business.category.properties.CategoryProperties")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local CategoryModifierTree = require("org.allbinary.data.tree.category.CategoryModifierTree")
local CategoryLoaderInterface = require("org.allbinary.data.tree.category.CategoryLoaderInterface")

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

local CategoryLoader = {}
CategoryLoader.__index = CategoryLoader
CategoryLoader.className = "CategoryLoader"
setmetatable(CategoryLoader, {__index = CategoryModifierTree})

function CategoryLoader:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CategoryLoader.new(categoryFactoryInterface)
    local self = setmetatable(CategoryModifierTree.new(categoryFactoryInterface), CategoryLoader)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.START, self, "CategoryLoader(CategoryFactoryInterface categoryFactoryInterface)")
        end
    return self
end


function CategoryLoader:getDoc(categoryInterface)
        local try_ok, try_error = pcall(function()
            if categoryInterface:getProperties():getPath(categoryInterface:getHierarchy()) ~= nil then
                if categoryInterface:getHierarchy():getLevel() == 1 then
                    local rootAbFile = AbFile.createAbFileFromAbPath(categoryInterface:getRootFilePath())
                    if not rootAbFile:isDirectory() then
                        rootAbFile:mkdirs()
                        if not rootAbFile:isDirectory() then
                            error(java_exception("Exception", "Could Not Create Directory"), 0)
                        end
                        self:save(categoryInterface)
                    end
                end
                local fileAbPath = categoryInterface:getFilePath()
                local cryptFileReader = CryptFileReader.new(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION)
                local document = DomDocumentHelper.create(cryptFileReader:get(fileAbPath))
                return document
            else
                error(java_exception("Exception", "Null Category"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                local try_ok, try_error = pcall(function()
                    categoryInterface:log()
                end)
                if not try_ok then
                    local e2 = try_error
                    self.logUtil:put("Could Not Log Category", self, "getDoc", e)
                end
                self.logUtil:put(self.commonStrings.FAILURE, self, "getDoc", e)
            end
            return nil
        end
end


function CategoryLoader:get(categoryInterface)
        local try_ok, try_error = pcall(function()
            local document = self:getDoc(categoryInterface)
            local categoryNode = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document:getChildNodes())
            return self:addProperties(categoryInterface, categoryNode:getChildNodes())
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function CategoryLoader:get(document)
        local try_ok, try_error = pcall(function()
            local categoryNode = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document:getChildNodes())
            local loadedCategoryInterface = self.categoryFactoryInterface:getRootInstanceFromNode(categoryNode)
            return self:addProperties(loadedCategoryInterface, categoryNode:getChildNodes())
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


function CategoryLoader:getAll(categoryInterface)
        local try_ok, try_error = pcall(function()
            local document = self:getDoc(categoryInterface)
            return self:getAll(document)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function CategoryLoader:getAll(document)
        local try_ok, try_error = pcall(function()
            local categoryNode = DomSearchHelper.getNode(CategoryData.getInstance().NAME, document:getChildNodes())
            local loadedCategoryInterface = self.categoryFactoryInterface:getRootInstanceFromNode(categoryNode)
            return self:addProperties(loadedCategoryInterface, categoryNode:getChildNodes())
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function CategoryLoader:getAll(parentCategoryInterface, categoryNodeList)
        local try_ok, try_error = pcall(function()
            if categoryNodeList ~= nil then
                for index = 0, categoryNodeList:getLength() - 1 do
                    local categoryNode = categoryNodeList:item(index)
                    if categoryNode ~= nil and categoryNode:getNodeName():compareTo(CategoryData.getInstance().NAME) == 0 then
                        local categoryInterface = self.categoryFactoryInterface:getInstance(parentCategoryInterface:getHierarchy():getRoot(), parentCategoryInterface, categoryNode)
                        parentCategoryInterface:addChild(categoryInterface)
                    end
                end
            end
            return parentCategoryInterface
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end


function CategoryLoader:addProperties(loadedCategoryInterface, categoryNodeList)
        local try_ok, try_error = pcall(function()
            if categoryNodeList ~= nil then
                for index = 0, categoryNodeList:getLength() - 1 do
                    local categoryNode = categoryNodeList:item(index)
                    if categoryNode ~= nil and categoryNode:getNodeName():compareTo(CategoryData.getInstance().NAME) == 0 then
                        local categoryPropertiesInterface = CategoryProperties.new(categoryNode)
                        loadedCategoryInterface:addChildProperty(categoryPropertiesInterface)
                    end
                end
            end
            return loadedCategoryInterface
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.GET, e)
            end
            return nil
        end
end

return CategoryLoader


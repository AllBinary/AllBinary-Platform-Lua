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
-- package org.allbinary.business.category.store.theme

-- local HashMap = require("java.util.HashMap")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local CategoryUtil = require("org.allbinary.business.category.CategoryUtil")
local CategoryPropertiesFactory = require("org.allbinary.business.category.properties.CategoryPropertiesFactory")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local RootStoreThemeCategoryPropertiesFactory = require("org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryPropertiesFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreThemeCategoryFactory = {}
StoreThemeCategoryFactory.__index = StoreThemeCategoryFactory
StoreThemeCategoryFactory.className = "StoreThemeCategoryFactory"

function StoreThemeCategoryFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.transformInfoInterface = nil
end


function StoreThemeCategoryFactory.new(transformInfoInterface)
    local self = setmetatable({}, StoreThemeCategoryFactory)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.START, self, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)")
        end
        self.transformInfoInterface = transformInfoInterface
    return self
end


function StoreThemeCategoryFactory:getRootInstance()
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = RootStoreThemeCategoryPropertiesFactory.new(self.transformInfoInterface)
            return StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, 0)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getRootInstance()", e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StoreThemeCategoryFactory:getRootInstance(categoryAbPath)
        local try_ok, try_error = pcall(function()
            local level = CategoryUtil.getPathLevel(categoryAbPath)
            local categoryPropertiesFactoryInterface = RootStoreThemeCategoryPropertiesFactory.new(self.transformInfoInterface, categoryAbPath)
            return StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getRootInstance(String)", e)
            end
            return nil
        end
end


function StoreThemeCategoryFactory:getRootInstanceFromNode(node)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = RootStoreThemeCategoryPropertiesFactory.new(self.transformInfoInterface, node)
            local categoryPath = AbPath.new(CategoryUtil.getNameFromNode(node), StringUtil.getInstance().EMPTY_STRING)
            local level = CategoryUtil.getPathLevel(categoryPath)
            return StoreThemeCategory.new(self.transformInfoInterface, node, categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getRootInstance(node)", e)
            end
            return nil
        end
end


function StoreThemeCategoryFactory:getInstance(categoryPath, level)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPath)
            return StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(String, int)", e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StoreThemeCategoryFactory:getInstance(rootCategoryInterface, parentCategoryInterface, categoryPath)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPath)
            return StoreThemeCategory.new(self.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface , String, int)", e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StoreThemeCategoryFactory:getInstance(node, level)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(node)
            return StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(Node, int)", e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StoreThemeCategoryFactory:getInstance(rootCategoryInterface, parentCategoryInterface, node)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(node)
            return StoreThemeCategory.new(self.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface, Node, int)", e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StoreThemeCategoryFactory:getInstance(categoryPropertiesHashMap, level)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPropertiesHashMap)
            return StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(HashMap)", e)
            end
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function StoreThemeCategoryFactory:getInstance(rootCategoryInterface, parentCategoryInterface, categoryPropertiesHashMap)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPropertiesHashMap)
            return StoreThemeCategory.new(self.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface, HashMap)", e)
            end
            return nil
        end
end

return StoreThemeCategoryFactory


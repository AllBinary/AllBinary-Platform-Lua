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
-- package org.allbinary.business.category.store

local Category = require("org.allbinary.business.category.Category")
local CategoryAbstractFactory = require("org.allbinary.business.category.CategoryAbstractFactory")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local CategoryUtil = require("org.allbinary.business.category.CategoryUtil")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local RootStoreCategoryPropertiesFactory = require("org.allbinary.business.category.properties.root.store.RootStoreCategoryPropertiesFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
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

local StoreCategoryFactory = {}
StoreCategoryFactory.__index = StoreCategoryFactory
StoreCategoryFactory.className = "StoreCategoryFactory"
setmetatable(StoreCategoryFactory, {__index = CategoryAbstractFactory})

function StoreCategoryFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.transformInfoInterface = nil
end


function StoreCategoryFactory.new(transformInfoInterface)
    local self = setmetatable(CategoryAbstractFactory.new(), StoreCategoryFactory)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.START, self, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)")
        end
        self.transformInfoInterface = transformInfoInterface
    return self
end


function StoreCategoryFactory:getRootInstance()
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = RootStoreCategoryPropertiesFactory.new(self.transformInfoInterface)
            return Category.new(categoryPropertiesFactoryInterface)
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
function StoreCategoryFactory:getRootInstance(categoryPath)
        local try_ok, try_error = pcall(function()
            local level = CategoryUtil.getPathLevel(categoryPath)
            local categoryPropertiesFactoryInterface = RootStoreCategoryPropertiesFactory.new(self.transformInfoInterface, categoryPath)
            return Category.new(categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(String, int)", e)
            end
            return nil
        end
end


function StoreCategoryFactory:getRootInstanceFromNode(node)
        local try_ok, try_error = pcall(function()
            local categoryPropertiesFactoryInterface = RootStoreCategoryPropertiesFactory.new(self.transformInfoInterface, node)
            local categoryPath = AbPath.new(CategoryUtil.getNameFromNode(node), StringUtil.getInstance().EMPTY_STRING)
            local level = CategoryUtil.getPathLevel(categoryPath)
            return Category.new(categoryPropertiesFactoryInterface, level)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(String, int)", e)
            end
            return nil
        end
end

return StoreCategoryFactory


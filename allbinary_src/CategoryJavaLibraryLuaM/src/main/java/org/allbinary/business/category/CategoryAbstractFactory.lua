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
local CategoryPropertiesFactory = require("org.allbinary.business.category.properties.CategoryPropertiesFactory")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Node = require("org.w3c.dom.Node")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")

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

local CategoryAbstractFactory = {}
CategoryAbstractFactory.__index = CategoryAbstractFactory
CategoryAbstractFactory.className = "CategoryAbstractFactory"

function CategoryAbstractFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function CategoryAbstractFactory.new()
    local self = setmetatable({}, CategoryAbstractFactory)
    self:_init_fields()
    return self
end


function CategoryAbstractFactory:getRootInstance()
        error(java_exception("RuntimeException"), 0)
end


-- Java overloaded method: Lua keeps the last definition
function CategoryAbstractFactory:getRootInstance(categoryAbPath)
        error(java_exception("RuntimeException"), 0)
end


function CategoryAbstractFactory:getRootInstanceFromNode(node)
        error(java_exception("RuntimeException"), 0)
end


function CategoryAbstractFactory:getInstance(categoryName)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                self.logUtil:putF(self.commonStrings.START, self, "getInstance(String)")
            end
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryName)
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
function CategoryAbstractFactory:getInstance(rootCategoryInterface, parentCategoryInterface, categoryName)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                self.logUtil:putF(self.commonStrings.START, self, "getInstance(CategoryInterface, CategoryInterface, String)")
            end
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryName)
            return Category.new(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
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
function CategoryAbstractFactory:getInstance(node)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                self.logUtil:putF(self.commonStrings.START, self, "getInstance(Node)")
            end
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(node)
            return Category.new(categoryPropertiesFactoryInterface)
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
function CategoryAbstractFactory:getInstance(rootCategoryInterface, parentCategoryInterface, node)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                self.logUtil:putF(self.commonStrings.START, self, "getInstance(CategoryInterface, CategoryInterface, Node)")
            end
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(node)
            return Category.new(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
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
function CategoryAbstractFactory:getInstance(rootCategoryInterface, parentCategoryInterface, categoryPropertiesHashMap)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                self.logUtil:putF(self.commonStrings.START, self, "getInstance(CategoryInterface, CategoryInterface, HashMap)")
            end
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPropertiesHashMap)
            return Category.new(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface, HashMap)", e)
            end
            return nil
        end
end

return CategoryAbstractFactory


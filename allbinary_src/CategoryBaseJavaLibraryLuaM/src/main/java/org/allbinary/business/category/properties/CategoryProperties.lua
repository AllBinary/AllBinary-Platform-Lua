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
-- package org.allbinary.business.category.properties

-- local HashMap = require("java.util.HashMap")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local CategoryUtil = require("org.allbinary.business.category.CategoryUtil")
local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = require("org.allbinary.logic.communication.sql.AbSqlData")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")

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

local CategoryProperties = {}
CategoryProperties.__index = CategoryProperties
CategoryProperties.className = "CategoryProperties"

function CategoryProperties:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.category = nil
end

function CategoryProperties.new(...)
    local count = select("#", ...)
    if count == 1 then return CategoryProperties._new1(...)
    elseif count == 1 then return CategoryProperties._new1(...)
    elseif count == 1 then return CategoryProperties._new1(...)
    end
end


function CategoryProperties._new1(name)
    local self = setmetatable({}, CategoryProperties)
    self:_init_fields()
        self.category = name
    return self
end


function CategoryProperties._new1(node)
    local self = setmetatable({}, CategoryProperties)
    self:_init_fields()
        self.category = CategoryUtil.getNameFromNode(node)
    return self
end


function CategoryProperties._new1(categoryPropertiesHashMap)
    local self = setmetatable({}, CategoryProperties)
    self:_init_fields()
        self.category = tostring(categoryPropertiesHashMap:get(CategoryData.getInstance().NAME))
    return self
end


function CategoryProperties:isRealRoot()
        return false
end


function CategoryProperties:isRoot()
        return false
end


function CategoryProperties:getKey()
        return self:getValue()
end


function CategoryProperties:getValue()
        return self.category
end


-- throws Exception
function CategoryProperties:getPath(categoryHierarchyInterface)
        local abPathData = AbPathData.getInstance()
        local pathStringBuffer = StringMaker.new()
        local list = BasicArrayListD.new()
        local nextParentCategoryInterface = categoryHierarchyInterface:getParent()
        if self ~= nextParentCategoryInterface:getProperties() then
            local depthIndex = 0
            while nextParentCategoryInterface ~= nil do
                if nextParentCategoryInterface:getProperties():isRealRoot() then
                    break
                end
                if nextParentCategoryInterface:getProperties():isRoot() then
                    list:addAt(0, tostring(nextParentCategoryInterface:getPath()))
                else
                    pathStringBuffer:delete(0, pathStringBuffer:length())
                    list:addAt(0, tostring(pathStringBuffer:append(abPathData.SEPARATOR):append(nextParentCategoryInterface:getProperties():getValue())))
                end
                if nextParentCategoryInterface == nextParentCategoryInterface:getHierarchy():getParent() then
                    break
                end
                nextParentCategoryInterface = nextParentCategoryInterface:getHierarchy():getParent()
                depthIndex = depthIndex + 1
                if depthIndex > CategoryProperties.MAXDEPTH then
                    error(java_exception("Exception", "Probably Major Error"), 0)
                end
            end
        end
        pathStringBuffer:delete(0, pathStringBuffer:length())
        pathStringBuffer:append(abPathData.SEPARATOR):append(self:getValue())
        local size = list:size()
        for index = 0, size - 1 do
            pathStringBuffer:append(list:get(index))
        end
        pathStringBuffer:append(abPathData.SEPARATOR)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF("path = " .. tostring(pathStringBuffer), self, "getPath")
        end
        return AbPath.new(tostring(pathStringBuffer), StringUtil.getInstance().EMPTY_STRING)
end


function CategoryProperties:getFileName()
        return self:getValue() + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION
end


-- throws Exception
function CategoryProperties:getWebAppPath()
        error(java_exception("Exception", "Not Root"), 0)
end


function CategoryProperties:setValue(value)
        self.category = value
end


function CategoryProperties:isValid()
        local returnBoolean = false
        if StringValidationUtil.getInstance():isValidRequired(self.category, 1, AbSqlData.MAXSTRING) then
            returnBoolean = true
        end
        return returnBoolean
end


function CategoryProperties:toHashMap()
        local categoryHashMap = StdUtil.getInstance():createHashMap()
        categoryHashMap:put(CategoryData.getInstance().NAME, self.category)
        return categoryHashMap
end


function CategoryProperties:toVector()
        local categoryVector = BasicArrayListD.new()
        categoryVector:add(self.category)
        return categoryVector
end


-- throws Exception
function CategoryProperties:toValidationInfoDoc()
        return nil
end


-- throws Exception
function CategoryProperties:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function CategoryProperties:validationInfo()
        return nil
end

CategoryProperties.MAXDEPTH = 100

return CategoryProperties


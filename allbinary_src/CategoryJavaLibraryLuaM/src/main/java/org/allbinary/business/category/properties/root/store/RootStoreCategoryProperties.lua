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
-- package org.allbinary.business.category.properties.root.store

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryUtil = require("org.allbinary.business.category.CategoryUtil")
local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local RootCategoryPropertiesInterface = require("org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
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

local RootStoreCategoryProperties = {}
RootStoreCategoryProperties.__index = RootStoreCategoryProperties
RootStoreCategoryProperties.className = "RootStoreCategoryProperties"

function RootStoreCategoryProperties:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.pathData = AbPathData.getInstance()
    self.fileAbPath = nil
    self.abPath = nil
    self.category = nil
    self.isRealRoot = nil
    self.webAppAbPath = nil
    self.transformInfoInterface = nil
end

function RootStoreCategoryProperties.new(...)
    local count = select("#", ...)
    if count == 1 then return RootStoreCategoryProperties._new1(...)
    elseif count == 2 then return RootStoreCategoryProperties._new2(...)
    elseif count == 2 then return RootStoreCategoryProperties._new2(...)
    elseif count == 2 then return RootStoreCategoryProperties._new2(...)
    end
end


function RootStoreCategoryProperties._new1(transformInfoInterface)
    local self = setmetatable({}, RootStoreCategoryProperties)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        self.abPath = AbPath.createAbPath()
        self.category = CategoryData.getInstance().ROOTCATEGORY
        self.isRealRoot = true
        self:initPath()
        self:log()
    return self
end


function RootStoreCategoryProperties._new2(transformInfoInterface, categoryAbPath)
    local self = setmetatable({}, RootStoreCategoryProperties)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        self.abPath = categoryAbPath
        self.category = self.pathData:getNameFromPath(tostring(categoryAbPath))
        if StringValidationUtil.getInstance():isEmpty(self.category) then
            self.isRealRoot = true
            self.category = CategoryData.getInstance().ROOTCATEGORY
        end
        self:initPath()
        self:log()
    return self
end


function RootStoreCategoryProperties._new2(transformInfoInterface, node)
    local self = setmetatable({}, RootStoreCategoryProperties)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        local categoryPath = CategoryUtil.getNameFromNode(node)
        self.abPath = AbPath.new(categoryPath, StringUtil.getInstance().EMPTY_STRING)
        self.category = self.pathData:getNameFromPath(categoryPath)
        if StringValidationUtil.getInstance():isEmpty(self.category) then
            self.isRealRoot = true
            self.category = CategoryData.getInstance().ROOTCATEGORY
        end
        self:initPath()
        self:log()
    return self
end


function RootStoreCategoryProperties._new2(transformInfoInterface, categoryPropertiesHashMap)
    local self = setmetatable({}, RootStoreCategoryProperties)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        local categoryPath = tostring(categoryPropertiesHashMap:get(CategoryData.getInstance().NAME))
        self.abPath = AbPath.new(categoryPath, StringUtil.getInstance().EMPTY_STRING)
        self.category = self.pathData:getNameFromPath(categoryPath)
        if StringValidationUtil.getInstance():isEmpty(self.category) then
            self.isRealRoot = true
            self.category = CategoryData.getInstance().ROOTCATEGORY
        end
        self:initPath()
        self:log()
    return self
end


-- throws Exception
function RootStoreCategoryProperties:initPath()
        local transformInfoHttpStoreInterface = self.transformInfoInterface
        local storeFrontInterface = StoreFrontFactory.getInstance(transformInfoHttpStoreInterface:getStoreName())
        local postPath = storeFrontInterface:getCurrentHostNamePath() + storeFrontInterface:getCategoryPath()
        local httpServletRequest = transformInfoHttpStoreInterface:getPageContext():getRequest()
        self.webAppAbPath = AbPath.new(tostring(httpServletRequest:getContextPath()) .. postPath, StringUtil.getInstance().EMPTY_STRING)
        self:setRootFilePath(AbPath.new(tostring(self.URLGLOBALS:getMainPath()) .. postPath, StringUtil.getInstance().EMPTY_STRING))
end


function RootStoreCategoryProperties:isRealRoot()
        return self.isRealRoot
end


function RootStoreCategoryProperties:isRoot()
        return true
end


function RootStoreCategoryProperties:getKey()
        return self:getValue()
end


function RootStoreCategoryProperties:setPath(path)
        self.abPath = path
end


function RootStoreCategoryProperties:setRootFilePath(value)
        self.fileAbPath = value
end


function RootStoreCategoryProperties:getRootFilePath()
        return self.fileAbPath
end


function RootStoreCategoryProperties:getValue()
        return self.category
end


-- throws Exception
function RootStoreCategoryProperties:getWebAppPath()
        return self.webAppAbPath
end


function RootStoreCategoryProperties:getPath(categoryHierarchyInterface)
        return self.abPath
end


function RootStoreCategoryProperties:getFileName()
        return self:getValue() + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION
end


function RootStoreCategoryProperties:setValue(value)
        self.category = value
end


function RootStoreCategoryProperties:isValid()
        return true
end


function RootStoreCategoryProperties:toHashMap()
        local categoryHashMap = StdUtil.getInstance():createHashMap()
        categoryHashMap:put(CategoryData.getInstance().NAME, self:getValue())
        return categoryHashMap
end


function RootStoreCategoryProperties:toVector()
        local categoryVector = BasicArrayListD.new()
        categoryVector:add(self:getValue())
        return categoryVector
end


-- throws Exception
function RootStoreCategoryProperties:toValidationInfoDoc()
        return nil
end


-- throws Exception
function RootStoreCategoryProperties:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function RootStoreCategoryProperties:validationInfo()
        return nil
end


function RootStoreCategoryProperties:log()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF(tostring(StringMaker.new():append("filePath = "):append(tostring(self.fileAbPath)):append("\npath = "):append(tostring(self.abPath)):append("\ncategory = "):append(self.category)), self, "log()")
        end
end

return RootStoreCategoryProperties


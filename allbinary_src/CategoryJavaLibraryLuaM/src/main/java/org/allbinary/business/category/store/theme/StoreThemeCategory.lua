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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Category = require("org.allbinary.business.category.Category")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ThemeData = require("org.allbinary.logic.visual.theme.ThemeData")
local ThemeValidation = require("org.allbinary.logic.visual.theme.ThemeValidation")
local ThemesData = require("org.allbinary.logic.visual.theme.ThemesData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local StoreThemeCategoryInterface = require("org.allbinary.business.category.store.theme.StoreThemeCategoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreThemeCategory = {}
StoreThemeCategory.__index = StoreThemeCategory
StoreThemeCategory.className = "StoreThemeCategory"
setmetatable(StoreThemeCategory, {__index = Category})

function StoreThemeCategory:_init_fields()
    self.transformInfoInterface = nil
    self.themeVector = nil
end

function StoreThemeCategory.new(...)
    local count = select("#", ...)
    if count == 3 then return StoreThemeCategory._new3(...)
    elseif count == 4 then return StoreThemeCategory._new4(...)
    elseif count == 4 then return StoreThemeCategory._new4(...)
    elseif count == 5 then return StoreThemeCategory._new5(...)
    end
end


function StoreThemeCategory._new3(transformInfoInterface, categoryPropertiesFactoryInterface, level)
    local self = setmetatable(Category.new(categoryPropertiesFactoryInterface, level), StoreThemeCategory)
    self:_init_fields()
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
    return self
end


function StoreThemeCategory._new4(transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    local self = setmetatable(Category.new(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface), StoreThemeCategory)
    self:_init_fields()
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
    return self
end


function StoreThemeCategory._new4(transformInfoInterface, node, categoryPropertiesFactoryInterface, level)
    local self = setmetatable(Category.new(categoryPropertiesFactoryInterface, level), StoreThemeCategory)
    self:_init_fields()
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
        self:addThemes(node)
    return self
end


function StoreThemeCategory._new5(transformInfoInterface, node, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    local self = setmetatable(Category.new(rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface), StoreThemeCategory)
    self:_init_fields()
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
        self:addThemes(node)
    return self
end


function StoreThemeCategory:getTransformInfoInterface()
        return self.transformInfoInterface
end


-- throws Exception
function StoreThemeCategory:addThemes(node)
        local themesNode = DomSearchHelper.getNode(ThemesData.getInstance().NAME, node:getChildNodes())
        local nodeList = themesNode:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local themeNode = nodeList:item(index)
            if themeNode:getNodeName():compareTo(ThemeData.getInstance().NAME) == 0 then
                self.themeVector:add(ThemeValidation.new(self, themeNode))
            end
        end
end


function StoreThemeCategory:addTheme(themeValidation)
        self.themeVector:add(themeValidation)
end


function StoreThemeCategory:getThemes()
        return self.themeVector
end


-- throws Exception
function StoreThemeCategory:isValid()
        if not Category.isValid(self) then
            return false
        end
        return true
end


-- throws Exception
function StoreThemeCategory:toHashMap()
        local categoryHashMap = Category.toHashMap(self)
        categoryHashMap:put(ThemesData.getInstance().NAME, self.themeVector)
        return categoryHashMap
end


-- throws Exception
function StoreThemeCategory:toVector()
        local categoryVector = Category.toVector(self)
        return categoryVector
end

return StoreThemeCategory


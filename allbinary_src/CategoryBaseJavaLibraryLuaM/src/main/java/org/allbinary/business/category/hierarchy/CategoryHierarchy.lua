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
-- package org.allbinary.business.category.hierarchy

-- local HashMap = require("java.util.HashMap")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryHierarchy = {}
CategoryHierarchy.__index = CategoryHierarchy
CategoryHierarchy.className = "CategoryHierarchy"

function CategoryHierarchy:_init_fields()
    self.rootCategoryInterface = nil
    self.parentCategoryInterface = nil
    self.level = nil
end

function CategoryHierarchy.new(...)
    local count = select("#", ...)
    if count == 2 then return CategoryHierarchy._new2(...)
    elseif count == 3 then return CategoryHierarchy._new3(...)
    elseif count == 3 then return CategoryHierarchy._new3(...)
    end
end


function CategoryHierarchy._new2(rootCategoryInterface, parentCategoryInterface)
    local self = setmetatable({}, CategoryHierarchy)
    self:_init_fields()
        self.level = 0
        self:setRoot(rootCategoryInterface)
        self:setParent(parentCategoryInterface)
    return self
end


function CategoryHierarchy._new3(rootCategoryInterface, parentCategoryInterface, level)
    local self = setmetatable({}, CategoryHierarchy)
    self:_init_fields()
        self.level = level
        self:setRoot(rootCategoryInterface)
        self:setParent(parentCategoryInterface)
    return self
end


function CategoryHierarchy._new3(rootCategoryInterface, parentCategoryInterface, categoryPropertiesHashMap)
    local self = setmetatable({}, CategoryHierarchy)
    self:_init_fields()
        local levelString = StringUtil.getInstance():getNonNull(categoryPropertiesHashMap:get(CategoryData.getInstance().LEVEL))
        self.level = math.tointeger(tostring(levelString) // 1)
        self:setRoot(rootCategoryInterface)
        self:setParent(parentCategoryInterface)
    return self
end


function CategoryHierarchy:getLevel()
        return self.level
end


function CategoryHierarchy:getLevelString()
        return tostring(self.level)
end


function CategoryHierarchy:setLevel(level)
        self.level = level
end


function CategoryHierarchy:setParent(categoryInterface)
        self.parentCategoryInterface = categoryInterface
end


function CategoryHierarchy:setRoot(categoryInterface)
        self.rootCategoryInterface = categoryInterface
end


function CategoryHierarchy:getRoot()
        return self.rootCategoryInterface
end


function CategoryHierarchy:getParent()
        return self.parentCategoryInterface
end

return CategoryHierarchy


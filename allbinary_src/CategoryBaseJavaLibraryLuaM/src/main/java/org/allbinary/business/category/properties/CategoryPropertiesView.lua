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

local CategoryData = require("org.allbinary.business.category.CategoryData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local Document = require("org.w3c.dom.Document")
local Element = require("org.w3c.dom.Element")
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

local CategoryPropertiesView = {}
CategoryPropertiesView.__index = CategoryPropertiesView
CategoryPropertiesView.className = "CategoryPropertiesView"

function CategoryPropertiesView:_init_fields()
    self.categoryPropertiesInterface = nil
end


function CategoryPropertiesView.new(categoryPropertiesInterface)
    local self = setmetatable({}, CategoryPropertiesView)
    self:_init_fields()
        self.categoryPropertiesInterface = categoryPropertiesInterface
    return self
end


-- throws Exception
function CategoryPropertiesView:toXmlNode(document)
        local categoryNode = document:createElement(CategoryData.getInstance().NAME)
        local newCategoryNode = categoryNode
        newCategoryNode:setAttribute(CategoryData.getInstance().LABEL, self.categoryPropertiesInterface:getValue())
        return categoryNode
end

return CategoryPropertiesView


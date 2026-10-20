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

local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
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

local StoreThemeCategoriesView = {}
StoreThemeCategoriesView.__index = StoreThemeCategoriesView
StoreThemeCategoriesView.className = "StoreThemeCategoriesView"

function StoreThemeCategoriesView:_init_fields()
    self.categoryInterface = nil
end


function StoreThemeCategoriesView.new(categoryInterface)
    local self = setmetatable({}, StoreThemeCategoriesView)
    self:_init_fields()
        self.categoryInterface = categoryInterface
    return self
end


-- throws Exception
function StoreThemeCategoriesView:toXmlNode(document)
        local node = StoreThemeCategoryView.new(self.categoryInterface):toXmlNode(document)
        local childArray = self.categoryInterface:getChildNodes():toArray()
        local size = (childArray.n or #childArray)
        for i = 0, size - 1 do
            local childCategoryInterface = childArray[i + 1]
            local childCategoryNode = StoreThemeCategoriesView.new(childCategoryInterface):toXmlNode(document)
            node:appendChild(childCategoryNode)
        end
        return node
end

return StoreThemeCategoriesView


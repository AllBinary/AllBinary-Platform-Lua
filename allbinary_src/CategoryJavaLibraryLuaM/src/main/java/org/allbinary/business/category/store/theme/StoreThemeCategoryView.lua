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

-- local Arrays = require("java.util.Arrays")
local CategoryView = require("org.allbinary.business.category.CategoryView")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ThemeValidation = require("org.allbinary.logic.visual.theme.ThemeValidation")
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

local StoreThemeCategoryView = {}
StoreThemeCategoryView.__index = StoreThemeCategoryView
StoreThemeCategoryView.className = "StoreThemeCategoryView"
setmetatable(StoreThemeCategoryView, {__index = CategoryView})


function StoreThemeCategoryView.new(categoryInterface)
    local self = setmetatable(CategoryView.new(categoryInterface), StoreThemeCategoryView)
        -- super(...) made self above
    return self
end


-- throws Exception
function StoreThemeCategoryView:toXmlNode(document)
        local node = CategoryView.toXmlNode(self, document)
        local storeThemeCategoryInterface = self:getCategoryInterface()
        local themeValidationArray = storeThemeCategoryInterface:getThemes():toArray()
        Arrays.sort(themeValidationArray, ThemeComparator.new())
        local size = (themeValidationArray.n or #themeValidationArray)
        for index = 0, size - 1 do
            local themeValidation = themeValidationArray[index + 1]
            node:appendChild(themeValidation:toXmlNode(document))
        end
        return node
end

return StoreThemeCategoryView


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

local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local CategoryView = require("org.allbinary.business.category.CategoryView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryComponent = {}
CategoryComponent.__index = CategoryComponent
CategoryComponent.className = "CategoryComponent"
setmetatable(CategoryComponent, {__index = CategoryView})

function CategoryComponent:_init_fields()
    self.NO_TYPE = 0
end


function CategoryComponent.new(categoryInterface)
    local self = setmetatable(CategoryView.new(categoryInterface), CategoryComponent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CategoryComponent:getTypeId()
        return self.NO_TYPE
end


function CategoryComponent:getTransformDocumentInterface()
        return nil
end


-- throws Exception
function CategoryComponent:getTransformInfoInterface()
        return nil
end


function CategoryComponent:setTransformDocumentInterface(viewDocumentInterface)
end


-- throws Exception
function CategoryComponent:toXmlDoc()
        local document = DomDocumentHelper.create()
        document:appendChild(CategoryView.new(self:getCategoryInterface()):toXmlNode(document))
        return document
end


-- throws Exception
function CategoryComponent:view()
        return nil
end

return CategoryComponent


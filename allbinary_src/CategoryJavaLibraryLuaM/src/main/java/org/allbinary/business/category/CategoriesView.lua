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

local CategoriesView = {}
package.loaded["org.allbinary.business.category.CategoriesView"] = CategoriesView

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CategoriesView is declared before the requires
CategoriesView.__index = CategoriesView
CategoriesView.className = "CategoriesView"
CategoriesView.javaClassName = "org.allbinary.business.category.CategoriesView"
CategoriesView.java_implements = " DomNodeInterface "
CategoriesView.java_interfaces = function() return {DomNodeInterface} end

function CategoriesView:_init_fields()
    if self.categoryInterface == nil then self.categoryInterface = nil end
end


function CategoriesView._jinit(self, categoryInterface)
    CategoriesView._init_fields(self)
        self.categoryInterface = categoryInterface
    return self
end

function CategoriesView.new(...)
    local self = setmetatable({}, CategoriesView)
    CategoriesView._jinit(self, ...)
    return self
end


-- throws Exception
function CategoriesView:toXmlNode(document)
        local node = CategoryView.new(self.categoryInterface):toXmlNode(document)
        local childArray = self.categoryInterface:getChildNodes():toArray()
        local size = (childArray.n or #childArray)
        for i = 0, size - 1 do
            local childCategoryInterface = childArray[i + 1]
            local childCategoryNode = CategoriesView.new(childCategoryInterface):toXmlNode(document)
            node:appendChild(childCategoryNode)
        end
        return node
end

return CategoriesView


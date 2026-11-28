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

local CategoryUtil = {}
package.loaded["org.allbinary.business.category.CategoryUtil"] = CategoryUtil

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

local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringUtils = java_lazy("org.apache.commons.lang3.StringUtils")
local Attr = java_lazy("org.w3c.dom.Attr")
local NamedNodeMap = java_lazy("org.w3c.dom.NamedNodeMap")
local Node = java_lazy("org.w3c.dom.Node")
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")

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

-- class table CategoryUtil is declared before the requires
CategoryUtil.__index = CategoryUtil
CategoryUtil.className = "CategoryUtil"
CategoryUtil.javaClassName = "org.allbinary.business.category.CategoryUtil"


function CategoryUtil._jinit(self)
    return self
end

function CategoryUtil.new(...)
    local self = setmetatable({}, CategoryUtil)
    CategoryUtil._jinit(self, ...)
    return self
end


function CategoryUtil.getPathLevel(categoryPath)
        local count = StringUtils.countMatches(tostring(categoryPath), AbPathData.getInstance().SEPARATOR)
        return count
end


function CategoryUtil.getNameFromNode(node)
        local attributes = node:getAttributes()
        local attrNode = attributes:getNamedItem(CategoryData.getInstance().LABEL)
        if not rawequal(attrNode, nil) then
            return attrNode:getValue()
        else
            local labelNode = DomSearchHelper.getNodeNoThrow(CategoryData.getInstance().LABEL, node:getChildNodes())
            if not rawequal(labelNode, nil) then
                return DomNodeHelper.getTextNodeValue(labelNode)
            end
        end
        return StringUtil.getInstance().EMPTY_STRING
end

return CategoryUtil


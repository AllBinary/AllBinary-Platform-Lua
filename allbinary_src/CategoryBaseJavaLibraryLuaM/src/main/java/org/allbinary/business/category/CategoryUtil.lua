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

local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringUtils = require("org.apache.commons.lang3.StringUtils")
local Attr = require("org.w3c.dom.Attr")
local NamedNodeMap = require("org.w3c.dom.NamedNodeMap")
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

local CategoryUtil = {}
CategoryUtil.__index = CategoryUtil
CategoryUtil.className = "CategoryUtil"


function CategoryUtil.new()
    local self = setmetatable({}, CategoryUtil)
    return self
end


function CategoryUtil.getPathLevel(categoryPath)
        local count = StringUtils.countMatches(tostring(categoryPath), AbPathData.getInstance().SEPARATOR)
        return count
end


function CategoryUtil.getNameFromNode(node)
        local attributes = node:getAttributes()
        local attrNode = attributes:getNamedItem(CategoryData.getInstance().LABEL)
        if attrNode ~= nil then
            return attrNode:getValue()
        else
            local labelNode = DomSearchHelper.getNodeNoThrow(CategoryData.getInstance().LABEL, node:getChildNodes())
            if labelNode ~= nil then
                return DomNodeHelper.getTextNodeValue(labelNode)
            end
        end
        return StringUtil.getInstance().EMPTY_STRING
end

return CategoryUtil


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

-- local HashMap = require("java.util.HashMap")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
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

-- Java interface
local CategoryFactoryInterface = {}
CategoryFactoryInterface.__index = CategoryFactoryInterface
CategoryFactoryInterface.className = "CategoryFactoryInterface"


function CategoryFactoryInterface:getRootInstance()
    error("abstract method getRootInstance")
end


-- Java overloaded method: Lua keeps the last definition
function CategoryFactoryInterface:getRootInstance(categoryPath)
    error("abstract method getRootInstance")
end


function CategoryFactoryInterface:getRootInstanceFromNode(node)
    error("abstract method getRootInstanceFromNode")
end


function CategoryFactoryInterface:getInstance(rootCategoryInterface, parentCategoryInterface, name)
    error("abstract method getInstance")
end


-- Java overloaded method: Lua keeps the last definition
function CategoryFactoryInterface:getInstance(rootCategoryInterface, parentCategoryInterface, node)
    error("abstract method getInstance")
end


-- Java overloaded method: Lua keeps the last definition
function CategoryFactoryInterface:getInstance(rootCategoryInterface, parentCategoryInterface, categoryPropertiesHashMap)
    error("abstract method getInstance")
end

return CategoryFactoryInterface


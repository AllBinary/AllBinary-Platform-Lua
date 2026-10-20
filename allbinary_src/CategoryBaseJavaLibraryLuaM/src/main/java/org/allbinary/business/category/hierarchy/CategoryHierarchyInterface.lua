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

local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")

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
local CategoryHierarchyInterface = {}
CategoryHierarchyInterface.__index = CategoryHierarchyInterface
CategoryHierarchyInterface.className = "CategoryHierarchyInterface"


function CategoryHierarchyInterface:getLevel()
    error("abstract method getLevel")
end


function CategoryHierarchyInterface:getLevelString()
    error("abstract method getLevelString")
end


function CategoryHierarchyInterface:getRoot()
    error("abstract method getRoot")
end


function CategoryHierarchyInterface:getParent()
    error("abstract method getParent")
end


function CategoryHierarchyInterface:setLevel(level)
    error("abstract method setLevel")
end


function CategoryHierarchyInterface:setRoot(categoryInterface)
    error("abstract method setRoot")
end


function CategoryHierarchyInterface:setParent(categoryInterface)
    error("abstract method setParent")
end

return CategoryHierarchyInterface


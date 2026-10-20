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

local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

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
local CategoryPropertiesInterface = {}
CategoryPropertiesInterface.__index = CategoryPropertiesInterface
CategoryPropertiesInterface.className = "CategoryPropertiesInterface"
setmetatable(CategoryPropertiesInterface, {__index = TableMappingInterface})


function CategoryPropertiesInterface:setValue(value)
    error("abstract method setValue")
end


function CategoryPropertiesInterface:getValue()
    error("abstract method getValue")
end


-- throws Exception
function CategoryPropertiesInterface:getWebAppPath()
    error("abstract method getWebAppPath")
end


-- throws Exception
function CategoryPropertiesInterface:getPath(categoryHierarchyInterface)
    error("abstract method getPath")
end


-- throws Exception
function CategoryPropertiesInterface:getFileName()
    error("abstract method getFileName")
end


-- throws Exception
function CategoryPropertiesInterface:isRoot()
    error("abstract method isRoot")
end


-- throws Exception
function CategoryPropertiesInterface:isRealRoot()
    error("abstract method isRealRoot")
end

return CategoryPropertiesInterface


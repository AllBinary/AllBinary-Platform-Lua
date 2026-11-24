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

local CategoryPropertiesInterface = {}
package.loaded["org.allbinary.business.category.properties.CategoryPropertiesInterface"] = CategoryPropertiesInterface

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

local CategoryHierarchyInterface = java_lazy("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")

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

-- Java interface
-- class table CategoryPropertiesInterface is declared before the requires
CategoryPropertiesInterface.__index = CategoryPropertiesInterface
CategoryPropertiesInterface.className = "CategoryPropertiesInterface"
CategoryPropertiesInterface.javaClassName = "org.allbinary.business.category.properties.CategoryPropertiesInterface"
setmetatable(CategoryPropertiesInterface, {__index = TableMappingInterface})
CategoryPropertiesInterface.java_interfaces = function() return {TableMappingInterface, ValidationInterface} end


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


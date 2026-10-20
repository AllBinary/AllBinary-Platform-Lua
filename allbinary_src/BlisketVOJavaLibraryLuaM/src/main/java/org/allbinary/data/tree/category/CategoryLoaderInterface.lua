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
-- package org.allbinary.data.tree.category

local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local Document = require("org.w3c.dom.Document")
local CategoryModifierTreeInterface = require("org.allbinary.data.tree.category.CategoryModifierTreeInterface")

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
local CategoryLoaderInterface = {}
CategoryLoaderInterface.__index = CategoryLoaderInterface
CategoryLoaderInterface.className = "CategoryLoaderInterface"
setmetatable(CategoryLoaderInterface, {__index = CategoryModifierTreeInterface})


function CategoryLoaderInterface:getDoc(categoryInterface)
    error("abstract method getDoc")
end


function CategoryLoaderInterface:get(categoryInterface)
    error("abstract method get")
end


function CategoryLoaderInterface:getAll(categoryInterface)
    error("abstract method getAll")
end

return CategoryLoaderInterface


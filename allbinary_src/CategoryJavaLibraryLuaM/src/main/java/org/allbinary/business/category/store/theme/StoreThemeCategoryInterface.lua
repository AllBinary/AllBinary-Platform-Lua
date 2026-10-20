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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local ThemeValidation = require("org.allbinary.logic.visual.theme.ThemeValidation")
local CompositeTransformInfoInterface = require("org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface")

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
local StoreThemeCategoryInterface = {}
StoreThemeCategoryInterface.__index = StoreThemeCategoryInterface
StoreThemeCategoryInterface.className = "StoreThemeCategoryInterface"
setmetatable(StoreThemeCategoryInterface, {__index = CategoryInterface})


function StoreThemeCategoryInterface:addTheme(themeValidation)
    error("abstract method addTheme")
end


function StoreThemeCategoryInterface:getThemes()
    error("abstract method getThemes")
end

return StoreThemeCategoryInterface


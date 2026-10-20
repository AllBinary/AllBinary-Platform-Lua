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

local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local StoreThemeCategoryPathView = require("org.allbinary.business.category.store.theme.StoreThemeCategoryPathView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreThemeCategoryPathValidationView = {}
StoreThemeCategoryPathValidationView.__index = StoreThemeCategoryPathValidationView
StoreThemeCategoryPathValidationView.className = "StoreThemeCategoryPathValidationView"
setmetatable(StoreThemeCategoryPathValidationView, {__index = StoreThemeCategoryPathView})


function StoreThemeCategoryPathValidationView.new(categoryInterface)
    local self = setmetatable(StoreThemeCategoryPathView.new(categoryInterface), StoreThemeCategoryPathValidationView)
        -- super(...) made self above
    return self
end


-- throws Exception
function StoreThemeCategoryPathValidationView:isValid()
        return true
end


-- throws Exception
function StoreThemeCategoryPathValidationView:toValidationInfoDoc()
        return nil
end


-- throws Exception
function StoreThemeCategoryPathValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function StoreThemeCategoryPathValidationView:validationInfo()
        return "Error"
end

return StoreThemeCategoryPathValidationView


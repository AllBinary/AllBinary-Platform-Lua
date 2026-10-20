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
local StoreThemeCategoryView = require("org.allbinary.business.category.store.theme.StoreThemeCategoryView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreThemeCategoryValidationView = {}
StoreThemeCategoryValidationView.__index = StoreThemeCategoryValidationView
StoreThemeCategoryValidationView.className = "StoreThemeCategoryValidationView"
setmetatable(StoreThemeCategoryValidationView, {__index = StoreThemeCategoryView})


function StoreThemeCategoryValidationView.new(categoryInterface)
    local self = setmetatable(StoreThemeCategoryView.new(categoryInterface), StoreThemeCategoryValidationView)
        -- super(...) made self above
    return self
end


-- throws Exception
function StoreThemeCategoryValidationView:isValid()
        return true
end


-- throws Exception
function StoreThemeCategoryValidationView:toValidationInfoDoc()
        return nil
end


-- throws Exception
function StoreThemeCategoryValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function StoreThemeCategoryValidationView:validationInfo()
        return "Error"
end

return StoreThemeCategoryValidationView


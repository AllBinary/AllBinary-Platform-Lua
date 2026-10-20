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
-- package views.generic.inventory

local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local InventorySearch = require("views.generic.inventory.InventorySearch")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AutoSearchValidationInventoryView = {}
AutoSearchValidationInventoryView.__index = AutoSearchValidationInventoryView
AutoSearchValidationInventoryView.className = "AutoSearchValidationInventoryView"
setmetatable(AutoSearchValidationInventoryView, {__index = InventorySearch})


function AutoSearchValidationInventoryView.new(searchRequest)
    local self = setmetatable(InventorySearch.new(searchRequest), AutoSearchValidationInventoryView)
        -- super(...) made self above
    return self
end


function AutoSearchValidationInventoryView:isValid()
        return true
end


function AutoSearchValidationInventoryView:toValidationInfoDoc()
        return nil
end


function AutoSearchValidationInventoryView:toValidationInfoNode(document)
        return nil
end


function AutoSearchValidationInventoryView:validationInfo()
        return nil
end

return AutoSearchValidationInventoryView


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

local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local InventoryView = require("views.generic.inventory.InventoryView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AutoValidationInventoryView = {}
AutoValidationInventoryView.__index = AutoValidationInventoryView
AutoValidationInventoryView.className = "AutoValidationInventoryView"
setmetatable(AutoValidationInventoryView, {__index = InventoryView})


function AutoValidationInventoryView.new(transformInfoInterface)
    local self = setmetatable(InventoryView.new(transformInfoInterface), AutoValidationInventoryView)
        -- super(...) made self above
    return self
end


function AutoValidationInventoryView:isValid()
        return true
end


function AutoValidationInventoryView:toValidationInfoDoc()
        return nil
end


function AutoValidationInventoryView:toValidationInfoNode(document)
        return nil
end


function AutoValidationInventoryView:validationInfo()
        return nil
end

return AutoValidationInventoryView


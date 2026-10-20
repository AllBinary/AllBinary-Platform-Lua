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
-- package views.generic.address.billing

local MESSAGES = require("org.allbinary.globals.MESSAGES")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local BillingAddressView = require("views.generic.address.billing.BillingAddressView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectValidationView = {}
SelectValidationView.__index = SelectValidationView
SelectValidationView.className = "SelectValidationView"
setmetatable(SelectValidationView, {__index = BillingAddressView})


function SelectValidationView.new(transformInfoInterface)
    local self = setmetatable(BillingAddressView.new(transformInfoInterface), SelectValidationView)
        -- super(...) made self above
    return self
end


function SelectValidationView:isValid()
        return true
end


function SelectValidationView:validationInfo()
        return self.MESSAGES.CONTACTADMIN
end


function SelectValidationView:toValidationInfoDoc()
        return nil
end


function SelectValidationView:toValidationInfoNode(document)
        return nil
end

return SelectValidationView


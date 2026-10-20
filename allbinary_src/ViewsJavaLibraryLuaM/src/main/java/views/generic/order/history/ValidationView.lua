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
-- package views.generic.order.history

local MESSAGES = require("org.allbinary.globals.MESSAGES")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local OrderHistoryView = require("views.generic.order.history.OrderHistoryView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ValidationView = {}
ValidationView.__index = ValidationView
ValidationView.className = "ValidationView"
setmetatable(ValidationView, {__index = OrderHistoryView})


function ValidationView.new(transformInfoInterface)
    local self = setmetatable(OrderHistoryView.new(transformInfoInterface), ValidationView)
        -- super(...) made self above
    return self
end


function ValidationView:isValid()
        return true
end


function ValidationView:toValidationInfoDoc()
        return nil
end


function ValidationView:toValidationInfoNode(document)
        return nil
end


function ValidationView:validationInfo()
        return self.MESSAGES.CONTACTADMIN
end

return ValidationView


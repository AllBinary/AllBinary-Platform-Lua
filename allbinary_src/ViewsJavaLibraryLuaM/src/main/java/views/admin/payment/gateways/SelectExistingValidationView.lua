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
-- package views.admin.payment.gateways

local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectExistingValidationView = {}
SelectExistingValidationView.__index = SelectExistingValidationView
SelectExistingValidationView.className = "SelectExistingValidationView"
setmetatable(SelectExistingValidationView, {__index = HttpStoreComponentView})


function SelectExistingValidationView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), SelectExistingValidationView)
        -- super(...) made self above
    return self
end


function SelectExistingValidationView:isValid()
        return true
end


function SelectExistingValidationView:toValidationInfoDoc()
        return nil
end


function SelectExistingValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function SelectExistingValidationView:validationInfo()
        error(java_exception("Exception", "validationInfo"), 0)
end


function SelectExistingValidationView:toXmlDoc()
        return nil
end


function SelectExistingValidationView:toXmlNode(document)
        return nil
end


-- throws Exception
function SelectExistingValidationView:view()
        return SelectExistingView.new(self:getTransformInfoInterface()):view()
end

return SelectExistingValidationView


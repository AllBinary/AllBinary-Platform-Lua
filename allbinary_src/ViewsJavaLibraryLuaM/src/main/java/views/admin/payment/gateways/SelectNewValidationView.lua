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

local SelectNewValidationView = {}
SelectNewValidationView.__index = SelectNewValidationView
SelectNewValidationView.className = "SelectNewValidationView"
setmetatable(SelectNewValidationView, {__index = HttpStoreComponentView})


function SelectNewValidationView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), SelectNewValidationView)
        -- super(...) made self above
    return self
end


function SelectNewValidationView:isValid()
        return true
end


function SelectNewValidationView:toValidationInfoDoc()
        return nil
end


function SelectNewValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function SelectNewValidationView:validationInfo()
        error(java_exception("Exception", "validationInfo"), 0)
end


function SelectNewValidationView:toXmlDoc()
        return nil
end


function SelectNewValidationView:toXmlNode(document)
        return nil
end


-- throws Exception
function SelectNewValidationView:view()
        return SelectNewView.new(self:getTransformInfoInterface()):view()
end

return SelectNewValidationView


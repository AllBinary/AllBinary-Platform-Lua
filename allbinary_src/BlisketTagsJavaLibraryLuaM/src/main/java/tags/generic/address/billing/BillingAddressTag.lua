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
-- package tags.generic.address.billing

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local BillingAddressData = require("org.allbinary.business.user.address.BillingAddressData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local StoreValidationTransformTag = require("tags.StoreValidationTransformTag")

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

local BillingAddressTag = {}
BillingAddressTag.__index = BillingAddressTag
BillingAddressTag.className = "BillingAddressTag"
setmetatable(BillingAddressTag, {__index = StoreValidationTransformTag})


function BillingAddressTag.new()
    local self = setmetatable(StoreValidationTransformTag.new(), BillingAddressTag)
    return self
end


-- throws JspTagException
function BillingAddressTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:getCommand() ~= nil then
                if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.ValidationView")
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.EDIT) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.EditValidationView")
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.NEW) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.NewValidationView")
                elseif self:getCommand():compareTo(self.commonStrings.INSERT) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.AddValidationView")
                elseif self:getCommand():compareTo(self.commonStrings.DELETE) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.DeleteValidationView")
                elseif self:getCommand():compareTo(BillingAddressData.SELECT) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.SelectValidationView")
                elseif self:getCommand():compareTo(BillingAddressData.SETTOSHIPPINGADDRESS) == 0 then
                    self:setName("Basic Billing Address View")
                    self:setObjectFile("views.generic.address.billing.SetValidationView")
                else
                    error(java_exception("Exception", "No Such View Command: " .. tostring(self:getCommand())), 0)
                end
                return StoreValidationTransformTag.doStartTag(self)
            end
            error(java_exception("Exception", "Command Null"), 0)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return BillingAddressTag


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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")
local StatesView = require("views.generic.address.StatesView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BillingAddressView = {}
BillingAddressView.__index = BillingAddressView
BillingAddressView.className = "BillingAddressView"
setmetatable(BillingAddressView, {__index = HttpStoreComponentView})

function BillingAddressView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
    self.streetAddress = nil
end


function BillingAddressView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), BillingAddressView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
    return self
end


function BillingAddressView:getRequest()
        return self.request
end


-- throws Exception
function BillingAddressView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local formNode = document:createElement(StreetAddressData.FORM)
            formNode:appendChild(self.streetAddress:toXmlNode(document))
            return formNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function BillingAddressView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
        self:addDomNodeInterface(StatesView.new())
end


-- throws Exception
function BillingAddressView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return BillingAddressView


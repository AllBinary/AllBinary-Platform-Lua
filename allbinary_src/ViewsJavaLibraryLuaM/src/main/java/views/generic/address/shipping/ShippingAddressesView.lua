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
-- package views.generic.address.shipping

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShippingAddressesView = {}
ShippingAddressesView.__index = ShippingAddressesView
ShippingAddressesView.className = "ShippingAddressesView"
setmetatable(ShippingAddressesView, {__index = HttpStoreComponentView})

function ShippingAddressesView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
    self.streetAddressList = nil
end


function ShippingAddressesView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), ShippingAddressesView)
    self:_init_fields()
        -- super(...) made self above
        local httpTransformInfoInterface = self:getTransformInfoInterface()
        self.request = httpTransformInfoInterface:getPageContext():getRequest()
    return self
end


function ShippingAddressesView:getRequest()
        return self.request
end


-- throws Exception
function ShippingAddressesView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local billingAddressesNode = document:createElement(ShippingAddressData.MULTIPLE)
            local size = self.streetAddressList:size()
            for index = 0, size - 1 do
                local streetAddress = self.streetAddressList:get(index)
                billingAddressesNode:appendChild(streetAddress:toXmlNode(document))
            end
            billingAddressesNode:appendChild(ModDomHelper.createNameValueNodes(document, StreetAddressData.NUMBEROFADDRESSES, tostring(self.streetAddressList:size())))
            return billingAddressesNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function ShippingAddressesView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function ShippingAddressesView:view()
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

return ShippingAddressesView


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
-- package org.allbinary.business.user.commerce.shipping.modules

local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Node = require("org.w3c.dom.Node")
local PickUpShippingModule = require("org.allbinary.business.user.commerce.shipping.modules.PickUpShippingModule")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PickUpShippingModuleView = {}
PickUpShippingModuleView.__index = PickUpShippingModuleView
PickUpShippingModuleView.className = "PickUpShippingModuleView"
setmetatable(PickUpShippingModuleView, {__index = PickUpShippingModule})

function PickUpShippingModuleView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PickUpShippingModuleView.new()
    local self = setmetatable(PickUpShippingModule.new(), PickUpShippingModuleView)
    self:_init_fields()
    return self
end


function PickUpShippingModuleView:isValid()
        return nil
end


function PickUpShippingModuleView:toValidationInfoDoc()
        return nil
end


function PickUpShippingModuleView:toValidationInfoNode(document)
        return nil
end


function PickUpShippingModuleView:toXmlDoc()
        return nil
end


function PickUpShippingModuleView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local shippingMethodNode = document:createElement(ShippingMethodData.NAME)
            shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodData.NAME, self:getName()))
            shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodData.DESCRIPTION, self:getDescription()))
            return shippingMethodNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode", e)
            end
            return nil
        end
end


function PickUpShippingModuleView:validationInfo()
        return nil
end


function PickUpShippingModuleView:view()
        return nil
end

return PickUpShippingModuleView


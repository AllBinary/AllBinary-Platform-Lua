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
-- package org.allbinary.business.user.commerce.money.payment.gateway

local PaymentGatewayView = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayView"] = PaymentGatewayView

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local PaymentGatewayMapping = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayMapping")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PaymentGatewayView is declared before the requires
PaymentGatewayView.__index = PaymentGatewayView
PaymentGatewayView.className = "PaymentGatewayView"
PaymentGatewayView.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayView"
PaymentGatewayView.java_implements = " DomNodeInterface "
PaymentGatewayView.java_interfaces = function() return {DomNodeInterface} end

function PaymentGatewayView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.paymentGatewayInterface == nil then self.paymentGatewayInterface = nil end
end


function PaymentGatewayView._jinit(self, paymentGatewayInterface)
    PaymentGatewayView._init_fields(self)
        self.paymentGatewayInterface = paymentGatewayInterface
    return self
end

function PaymentGatewayView.new(...)
    local self = setmetatable({}, PaymentGatewayView)
    PaymentGatewayView._jinit(self, ...)
    return self
end


function PaymentGatewayView:getPaymentGatewayInterface()
        return self.paymentGatewayInterface
end


-- throws Exception
function PaymentGatewayView:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        return hashMap
end


-- throws Exception
function PaymentGatewayView:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, "toXmlNode")
            end
            local hashMap = PaymentGatewayMapping.new(self.paymentGatewayInterface):toHashMap()
            hashMap:putAll(self:toHashMap())
            local paymentGatewayNode = ModDomHelper.createNodeWithValueNodes(document, tostring(PaymentGatewayData.NAME), hashMap)
            do return "__jreturn", paymentGatewayNode end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return PaymentGatewayView


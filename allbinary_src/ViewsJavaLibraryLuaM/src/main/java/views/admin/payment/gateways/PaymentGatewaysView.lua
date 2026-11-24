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

local PaymentGatewaysView = {}
package.loaded["views.admin.payment.gateways.PaymentGatewaysView"] = PaymentGatewaysView

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewaysData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData")
local BasicPaymentType = java_lazy("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local PaymentTypeUtil = java_lazy("org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
end

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

-- class table PaymentGatewaysView is declared before the requires
PaymentGatewaysView.__index = PaymentGatewaysView
PaymentGatewaysView.className = "PaymentGatewaysView"
PaymentGatewaysView.javaClassName = "views.admin.payment.gateways.PaymentGatewaysView"
setmetatable(PaymentGatewaysView, {__index = HttpStoreComponentView})
PaymentGatewaysView.java_implements = " DomNodeInterface "
PaymentGatewaysView.java_interfaces = function() return {DomNodeInterface} end

function PaymentGatewaysView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.paymentGatewayVector == nil then self.paymentGatewayVector = nil end
end


function PaymentGatewaysView._jinit(self, transformInfoInterface, gatewayVector)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    PaymentGatewaysView._init_fields(self)
        -- super(...) made self above
        self.paymentGatewayVector = gatewayVector
    return self
end

function PaymentGatewaysView.new(...)
    local self = setmetatable({}, PaymentGatewaysView)
    PaymentGatewaysView._jinit(self, ...)
    return self
end


-- throws Exception
function PaymentGatewaysView:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local storeName = self:getTransformInfoInterface():getStoreName()
            local paymentGatewaysNode = document:createElement(PaymentGatewaysData.NAME)
            local size = self.paymentGatewayVector:size()
            for index = 0, size - 1 do
                local paymentType = self.paymentGatewayVector:get(index)
                local hashMap = paymentType:toHashMap()
                hashMap:put(EntryData.getInstance().DEFAULT, PaymentTypeUtil.getInstance():getDefault(storeName):getBasicPaymentType():getName())
                local paymentGatewayNode = ModDomHelper.createNodeWithValueNodes(document, tostring(PaymentGatewayData.NAME), hashMap)
                paymentGatewaysNode:appendChild(paymentGatewayNode)
            end
            do return "__jreturn", paymentGatewaysNode end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewaysView, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function PaymentGatewaysView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end
java_overload(PaymentGatewaysView, "addDomNodeInterfaces", 0)


function PaymentGatewaysView:view()
        local try_ok, try_error, try_value = pcall(function()
            self:addDomNodeInterfaces()
            do return "__jreturn", java_super(HttpStoreComponentView, "view", 0)(self) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to view payment gateways"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PaymentGatewaysView, "view", 0)

return PaymentGatewaysView


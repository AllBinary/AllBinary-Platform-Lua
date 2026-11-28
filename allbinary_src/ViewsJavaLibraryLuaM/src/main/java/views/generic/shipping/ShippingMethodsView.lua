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
-- package views.generic.shipping

local ShippingMethodsView = {}
package.loaded["views.generic.shipping.ShippingMethodsView"] = ShippingMethodsView

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local BasketInterface = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local OrderInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local TaxFactory = java_lazy("org.allbinary.business.user.commerce.money.tax.TaxFactory")
local ShippingMethods = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethods")
local ShippingMethodsData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodsData")
local ShippingInterface = java_lazy("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local StreetAddressesEntityInterface = java_lazy("org.allbinary.data.tables.user.address.StreetAddressesEntityInterface")
local ShippingAddressesEntityFactory = java_lazy("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory")
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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table ShippingMethodsView is declared before the requires
ShippingMethodsView.__index = ShippingMethodsView
ShippingMethodsView.className = "ShippingMethodsView"
ShippingMethodsView.javaClassName = "views.generic.shipping.ShippingMethodsView"
setmetatable(ShippingMethodsView, {__index = HttpStoreComponentView})
ShippingMethodsView.java_implements = " DomNodeInterface "
ShippingMethodsView.java_interfaces = function() return {DomNodeInterface} end

function ShippingMethodsView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.shippingMethods == nil then self.shippingMethods = nil end
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
end


function ShippingMethodsView._jinit(self, transformInfoInterface)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    ShippingMethodsView._init_fields(self)
        -- super(...) made self above
        self.storeFrontInterface = StoreFrontFactory.getInstance(self:getTransformInfoInterface():getStoreName())
        self.shippingMethods = ShippingMethods.new(self.abeClientInformation, self.storeFrontInterface)
    return self
end

function ShippingMethodsView.new(...)
    local self = setmetatable({}, ShippingMethodsView)
    ShippingMethodsView._jinit(self, ...)
    return self
end


-- throws Exception
function ShippingMethodsView:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local shippingMethodsNode = document:createElement(ShippingMethodsData.SHIPPINGMETHODSORDERSUMMARIES)
            local order = self:getWeblisketSession():getOrder()
            local basket = self:getWeblisketSession():getOrder():getBasket()
            local shippingAddressesEntityInterface = ShippingAddressesEntityFactory.getInstance():getInstance(self:getWeblisketSession():getUserName())
            local streetAddress = shippingAddressesEntityInterface:getDefault()
            local shippingVector = self.shippingMethods:get()
            local size = shippingVector:size()
            for index = 0, size - 1 do
                local shippingMethodNode = document:createElement(ShippingMethodsData.SHIPPINGMETHODORDERSUMMARY)
                local shipping = shippingVector:get(index)
                local shippingView = shipping
                shippingMethodNode:appendChild(shippingView:toXmlNode(document))
                local shippingCost = shipping:getCost(order)
                local subTotal = basket:getSubTotal()
                local taxRate = TaxFactory.getInstance():getInstance(self.abeClientInformation, self.storeFrontInterface):getTaxRate(streetAddress, self.storeFrontInterface)
                local tax = Money.new()
                local total = Money.new()
                total:add(tostring(shippingCost))
                total:add(tostring(subTotal))
                tax:add(tostring(total))
                tax:multiply(taxRate)
                total:add(tostring(tax))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.SHIPPINGCOST, tostring(shippingCost)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TAXRATE, tostring(taxRate)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.SUBTOTAL, tostring(subTotal)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TAX, tostring(tax)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TOTAL, tostring(total)))
                shippingMethodNode:appendChild(ModDomHelper.createNameValueNodes(document, EntryData.getInstance().DEFAULT, self.shippingMethods:getDefault():getName()))
                shippingMethodsNode:appendChild(shippingMethodNode)
            end
            do return "__jreturn", shippingMethodsNode end
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
java_overload(ShippingMethodsView, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function ShippingMethodsView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end
java_overload(ShippingMethodsView, "addDomNodeInterfaces", 0)


function ShippingMethodsView:view()
        local try_ok, try_error, try_value = pcall(function()
            self:addDomNodeInterfaces()
            do return "__jreturn", java_super(HttpStoreComponentView, "view", 0)(self) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to view ShippingMethods"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ShippingMethodsView, "view", 0)

return ShippingMethodsView


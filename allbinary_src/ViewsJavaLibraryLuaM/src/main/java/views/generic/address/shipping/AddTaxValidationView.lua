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

local AddTaxValidationView = {}
package.loaded["views.generic.address.shipping.AddTaxValidationView"] = AddTaxValidationView

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
local ShippingAddressData = java_lazy("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local TaxFactory = java_lazy("org.allbinary.business.user.commerce.money.tax.TaxFactory")
local TaxModuleInterface = java_lazy("org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface")
local ShippingAddressesEntity = java_lazy("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ShippingAddressView = require("views.generic.address.shipping.ShippingAddressView")

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

-- class table AddTaxValidationView is declared before the requires
AddTaxValidationView.__index = AddTaxValidationView
AddTaxValidationView.className = "AddTaxValidationView"
AddTaxValidationView.javaClassName = "views.generic.address.shipping.AddTaxValidationView"
setmetatable(AddTaxValidationView, {__index = ShippingAddressView})
AddTaxValidationView.java_implements = " ValidationComponentInterface "
AddTaxValidationView.java_interfaces = function() return {ValidationComponentInterface} end

function AddTaxValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AddTaxValidationView._jinit(self, transformInfoInterface)
    java_super_init(ShippingAddressView, self, transformInfoInterface)
    AddTaxValidationView._init_fields(self)
        -- super(...) made self above
    return self
end

function AddTaxValidationView.new(...)
    local self = setmetatable({}, AddTaxValidationView)
    AddTaxValidationView._jinit(self, ...)
    return self
end


-- throws Exception
function AddTaxValidationView:isValid()
        local try_ok, try_error, try_value = pcall(function()
            self.streetAddress = StreetAddress.new(self:getRequest())
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getTransformInfoInterface():getStoreName())
            local taxInterface = TaxFactory.getInstance():getInstance(self.abeClientInformation, storeFrontInterface)
            if rawequal(taxInterface, nil) then
                do return "__jreturn", false end
            end
            if rawequal(taxInterface:isValid(self.streetAddress, storeFrontInterface), false) then
                do return "__jreturn", false end
            end
            local billingAddressesEntity = ShippingAddressesEntity.new(self:getWeblisketSession():getUserName())
            local streetAddressList = billingAddressesEntity:get()
            if rawequal(streetAddressList, nil) then
                do return "__jreturn", false end
            end
            local size = streetAddressList:size()
            for index = 0, size - 1 do
                local aStreetAddress = streetAddressList:get(index)
                if rawequal(aStreetAddress:getName():compareTo(ShippingAddressData.TAX), 0) then
                    do return "__jreturn", false end
                end
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AddTaxValidationView, "isValid", 0)


-- throws Exception
function AddTaxValidationView:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            local storeFrontInterface = StoreFrontFactory.getInstance(self:getTransformInfoInterface():getStoreName())
            local taxInterface = TaxFactory.getInstance():getInstance(self.abeClientInformation, storeFrontInterface)
            if rawequal(taxInterface, nil) then
                stringBuffer:append("Unable to Load Tax Component<br/>")
            else
                if rawequal(taxInterface:isValid(self.streetAddress, storeFrontInterface), false) then
                    stringBuffer:append("Unable to validate address with Tax Component<br/>")
                end
            end
            local billingAddressesEntity = ShippingAddressesEntity.new(self:getWeblisketSession():getUserName())
            local streetAddressList = billingAddressesEntity:get()
            local size = streetAddressList:size()
            for index = 0, size - 1 do
                local aStreetAddress = streetAddressList:get(index)
                if rawequal(aStreetAddress:getName():compareTo(ShippingAddressData.TAX), 0) then
                    stringBuffer:append("Not a valid tax location<br/>")
                end
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to create validateInfo", self, "validationInfo()", e)
            end
            return "Error Creating ValidationInfo"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AddTaxValidationView, "validationInfo", 0)


function AddTaxValidationView:toValidationInfoDoc()
        return nil
end
java_overload(AddTaxValidationView, "toValidationInfoDoc", 0)


function AddTaxValidationView:toValidationInfoNode(document)
        return nil
end
java_overload(AddTaxValidationView, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function AddTaxValidationView:getTransformInfoInterface()
        return java_super(ShippingAddressView, "getTransformInfoInterface", 0)(self)
end
java_overload(AddTaxValidationView, "getTransformInfoInterface", 0)

return AddTaxValidationView


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
-- package admin.taghelpers

local UpdateOrderHelper = {}
package.loaded["admin.taghelpers.UpdateOrderHelper"] = UpdateOrderHelper

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local BillingAddressData = java_lazy("org.allbinary.business.user.address.BillingAddressData")
local ShippingAddressData = java_lazy("org.allbinary.business.user.address.ShippingAddressData")
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderHistoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TagHelper = require("admin.taghelpers.TagHelper")

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

-- class table UpdateOrderHelper is declared before the requires
UpdateOrderHelper.__index = UpdateOrderHelper
UpdateOrderHelper.className = "UpdateOrderHelper"
UpdateOrderHelper.javaClassName = "admin.taghelpers.UpdateOrderHelper"
setmetatable(UpdateOrderHelper, {__index = TagHelper})

function UpdateOrderHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.request == nil then self.request = nil end
    if self.entryId == nil then self.entryId = nil end
    if self.orderId == nil then self.orderId = nil end
    if self.userName == nil then self.userName = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.shipDate == nil then self.shipDate = nil end
    if self.orderDate == nil then self.orderDate = nil end
    if self.transDate == nil then self.transDate = nil end
    if self.cancelDate == nil then self.cancelDate = nil end
    if self.status == nil then self.status = nil end
    if self.paymentMethod == nil then self.paymentMethod = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.type == nil then self.type = nil end
    if self.expiration == nil then self.expiration = nil end
    if self.number == nil then self.number = nil end
    if self.encryption == nil then self.encryption = nil end
    if self.billingName == nil then self.billingName = nil end
    if self.billingStreet == nil then self.billingStreet = nil end
    if self.billingCity == nil then self.billingCity = nil end
    if self.billingState == nil then self.billingState = nil end
    if self.billingCode == nil then self.billingCode = nil end
    if self.billingCountry == nil then self.billingCountry = nil end
    if self.shippingName == nil then self.shippingName = nil end
    if self.shippingStreet == nil then self.shippingStreet = nil end
    if self.shippingCity == nil then self.shippingCity = nil end
    if self.shippingState == nil then self.shippingState = nil end
    if self.shippingCode == nil then self.shippingCode = nil end
    if self.shippingCountry == nil then self.shippingCountry = nil end
    if self.shippingMethodName == nil then self.shippingMethodName = nil end
    if self.subTotal == nil then self.subTotal = nil end
    if self.shippingCost == nil then self.shippingCost = nil end
    if self.tax == nil then self.tax = nil end
    if self.total == nil then self.total = nil end
    if self.special == nil then self.special = nil end
    if self.userComment == nil then self.userComment = nil end
    if self.userCancelComment == nil then self.userCancelComment = nil end
    if self.storeComment == nil then self.storeComment = nil end
    if self.storeCancelComment == nil then self.storeCancelComment = nil end
end


function UpdateOrderHelper._jinit(self, hashMap, pageContext)
    java_super_init(TagHelper, self)
    UpdateOrderHelper._init_fields(self)
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end

function UpdateOrderHelper.new(...)
    local self = setmetatable({}, UpdateOrderHelper)
    UpdateOrderHelper._jinit(self, ...)
    return self
end


function UpdateOrderHelper:getFormData()
        self.entryId = self.request:getParameter(EntryData.getInstance().ID)
        self.orderId = self.request:getParameter(OrderData.ID)
        self.userName = self.request:getParameter(UserData.USERNAME)
        self.storeName = self.request:getParameter(StoreFrontData.getInstance().NAME)
        self.shipDate = self.request:getParameter(OrderHistoryData.SHIPPEDDATE)
        self.orderDate = self.request:getParameter(OrderHistoryData.ORDERDATE)
        self.transDate = self.request:getParameter(OrderHistoryData.TRANSDATE)
        self.cancelDate = self.request:getParameter(OrderHistoryData.CANCELDATE)
        self.status = self.request:getParameter(OrderHistoryData.STATUS)
        self.paymentMethod = self.request:getParameter(PaymentData.METHOD)
        self.name_f = self.request:getParameter(PaymentData.NAME)
        self.type = self.request:getParameter(PaymentData.TYPE)
        self.expiration = self.request:getParameter(PaymentData.EXPIRATION)
        self.number = self.request:getParameter(PaymentData.NUMBER)
        self.encryption = self.request:getParameter(EntryData.getInstance().ENCRYPTION)
        self.billingName = self.request:getParameter(BillingAddressData.NAME)
        self.billingStreet = self.request:getParameter(BillingAddressData.STREET)
        self.billingCity = self.request:getParameter(BillingAddressData.CITY)
        self.billingState = self.request:getParameter(BillingAddressData.STATE)
        self.billingCode = self.request:getParameter(BillingAddressData.CODE)
        self.billingCountry = self.request:getParameter(BillingAddressData.COUNTRY)
        self.shippingName = self.request:getParameter(ShippingAddressData.NAME)
        self.shippingStreet = self.request:getParameter(ShippingAddressData.STREET)
        self.shippingCity = self.request:getParameter(ShippingAddressData.CITY)
        self.shippingState = self.request:getParameter(ShippingAddressData.STATE)
        self.shippingCode = self.request:getParameter(ShippingAddressData.CODE)
        self.shippingCountry = self.request:getParameter(ShippingAddressData.COUNTRY)
        self.shippingMethodName = self.request:getParameter(ShippingMethodData.NAME)
        self.subTotal = self.request:getParameter(OrderHistoryData.SUBTOTAL)
        self.shippingCost = self.request:getParameter(OrderHistoryData.SHIPPINGCOST)
        self.tax = self.request:getParameter(OrderHistoryData.TAX)
        self.total = self.request:getParameter(OrderHistoryData.TOTAL)
        self.special = self.request:getParameter(EntryData.getInstance().SPECIAL)
        self.userComment = self.request:getParameter(OrderData.CUSTOMERCOMMENT)
        self.userCancelComment = self.request:getParameter(OrderData.CUSTOMERCANCELCOMMENT)
        self.storeComment = self.request:getParameter(OrderData.STORECOMMENT)
        self.storeCancelComment = self.request:getParameter(OrderData.STORECANCELCOMMENT)
end
java_overload(UpdateOrderHelper, "getFormData", 0)


function UpdateOrderHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Successful update"
            local orderHashMap = StdUtil.getInstance():createHashMap()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            orderHashMap:put(EntryData.getInstance().ID, self.entryId)
            orderHashMap:put(OrderData.ID, self.orderId)
            orderHashMap:put(UserData.USERNAME, self.userName)
            orderHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
            orderHashMap:put(OrderHistoryData.SHIPPEDDATE, self.shipDate)
            orderHashMap:put(OrderHistoryData.ORDERDATE, self.orderDate)
            orderHashMap:put(OrderHistoryData.TRANSDATE, self.transDate)
            orderHashMap:put(OrderHistoryData.CANCELDATE, self.cancelDate)
            orderHashMap:put(OrderHistoryData.STATUS, self.status)
            orderHashMap:put(PaymentData.METHOD, self.paymentMethod)
            orderHashMap:put(PaymentData.NAME, self.name_f)
            orderHashMap:put(PaymentData.TYPE, self.type)
            orderHashMap:put(PaymentData.EXPIRATION, self.expiration)
            orderHashMap:put(BillingAddressData.NAME, self.billingName)
            orderHashMap:put(BillingAddressData.STREET, self.billingStreet)
            orderHashMap:put(BillingAddressData.CITY, self.billingCity)
            orderHashMap:put(BillingAddressData.STATE, self.billingState)
            orderHashMap:put(BillingAddressData.CODE, self.billingCode)
            orderHashMap:put(BillingAddressData.COUNTRY, self.billingCountry)
            orderHashMap:put(ShippingAddressData.NAME, self.shippingName)
            orderHashMap:put(ShippingAddressData.STREET, self.shippingStreet)
            orderHashMap:put(ShippingAddressData.CITY, self.shippingCity)
            orderHashMap:put(ShippingAddressData.STATE, self.shippingState)
            orderHashMap:put(ShippingAddressData.CODE, self.shippingCode)
            orderHashMap:put(ShippingAddressData.COUNTRY, self.shippingCountry)
            orderHashMap:put(ShippingMethodData.NAME, self.shippingMethodName)
            orderHashMap:put(OrderHistoryData.SUBTOTAL, self.subTotal)
            orderHashMap:put(OrderHistoryData.SHIPPINGCOST, self.shippingCost)
            orderHashMap:put(OrderHistoryData.TAX, self.tax)
            orderHashMap:put(OrderHistoryData.TOTAL, self.total)
            orderHashMap:put(EntryData.getInstance().SPECIAL, self.special)
            orderHashMap:put(OrderData.CUSTOMERCOMMENT, self.userComment)
            orderHashMap:put(OrderData.CUSTOMERCANCELCOMMENT, self.userCancelComment)
            orderHashMap:put(OrderData.STORECOMMENT, self.storeComment)
            orderHashMap:put(OrderData.STORECANCELCOMMENT, self.storeCancelComment)
            whereHashMap:put(OrderData.ID, self.orderId)
            OrderHistoryEntityFactory.getInstance():update(whereHashMap, orderHashMap)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to update order table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(UpdateOrderHelper, "update", 0)

return UpdateOrderHelper


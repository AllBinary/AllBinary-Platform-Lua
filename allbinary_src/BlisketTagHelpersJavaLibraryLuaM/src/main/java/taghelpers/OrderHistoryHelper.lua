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
-- package taghelpers

local OrderHistoryHelper = {}
package.loaded["taghelpers.OrderHistoryHelper"] = OrderHistoryHelper

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
local TagHelper = require("admin.taghelpers.TagHelper")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderHistoryFactory = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory")
local OrderHistoryInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderHistoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderHistoryEntityInterface = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
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

-- class table OrderHistoryHelper is declared before the requires
OrderHistoryHelper.__index = OrderHistoryHelper
OrderHistoryHelper.className = "OrderHistoryHelper"
OrderHistoryHelper.javaClassName = "taghelpers.OrderHistoryHelper"
setmetatable(OrderHistoryHelper, {__index = TagHelper})

function OrderHistoryHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
    if self.pageContext == nil then self.pageContext = nil end
    if self.request == nil then self.request = nil end
    if self.streetAddress == nil then self.streetAddress = nil end
    if self.id == nil then self.id = nil end
    if self.groupId == nil then self.groupId = nil end
    if self.status == nil then self.status = nil end
    if self.newStatus == nil then self.newStatus = nil end
end


function OrderHistoryHelper._jinit(self, propertiesHashMap, pageContext)
    java_super_init(TagHelper, self)
    OrderHistoryHelper._init_fields(self)
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        local storeName = propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        self.newStatus = propertiesHashMap:get(OrderHistoryData.STATUS)
        if not rawequal(storeName, nil) then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        end
        self:getFormData()
    return self
end

function OrderHistoryHelper.new(...)
    local self = setmetatable({}, OrderHistoryHelper)
    OrderHistoryHelper._jinit(self, ...)
    return self
end


function OrderHistoryHelper:getFormData()
        self.id = self.request:getParameter(OrderData.ID)
        self.groupId = self.request:getParameter(ShippingMethodData.GROUP)
        if rawequal(self.newStatus, nil) then
            self.newStatus = self.request:getParameter(OrderHistoryData.STATUS)
        end
end
java_overload(OrderHistoryHelper, "getFormData", 0)


function OrderHistoryHelper:setOrderStatus()
        local try_ok, try_error, try_value = pcall(function()
            local success = require("allbinary_java").to_string("Status successfully set to: ") .. require("allbinary_java").to_string(self.status)
            local orderReviewInterface = OrderHistoryFactory.getInstance(self.id)
            local status = orderReviewInterface:getStatus()
            if rawequal(((status < OrderHistoryData.CANCELLED and -1) or (status > OrderHistoryData.CANCELLED and 1) or 0), 0) then
                do return "__jreturn", require("allbinary_java").to_string(require("allbinary_java").to_string("Order ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" Already Cancelled<br/>") end
            elseif rawequal(((status < OrderHistoryData.SHIPPED and -1) or (status > OrderHistoryData.SHIPPED and 1) or 0), 0) then
                do return "__jreturn", require("allbinary_java").to_string(require("allbinary_java").to_string("Order ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" Already Shipped. You can't cancel a shipped order.<br/>") end
            elseif rawequal(((status < OrderHistoryData.PREPROCESSING and -1) or (status > OrderHistoryData.PREPROCESSING and 1) or 0), 0) then
                do return "__jreturn", require("allbinary_java").to_string(require("allbinary_java").to_string("Order ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" has been cancelled.<br/>") end
            elseif rawequal(((status < OrderHistoryData.PARTIALLYSHIPPED and -1) or (status > OrderHistoryData.PARTIALLYSHIPPED and 1) or 0), 0) then
                do return "__jreturn", require("allbinary_java").to_string(require("allbinary_java").to_string("Order ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" Partially Shipped. You can cancel unshipped items, but not the whole order.<br/>") end
            elseif rawequal(((status < OrderHistoryData.PROCESSING and -1) or (status > OrderHistoryData.PROCESSING and 1) or 0), 0) then
                local orderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance()
                orderHistoryEntityInterface:setStatus(self.id, self.newStatus)
                do return "__jreturn", require("allbinary_java").to_string(require("allbinary_java").to_string("Order ") .. require("allbinary_java").to_string(self.id)) .. require("allbinary_java").to_string(" has been cancelled.<br/>") end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "setOrderStatus()")
            end
            do return "__jreturn", "Error Setting Order Status" end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to set order status"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setOrderStatus()", e)
            end
            return require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(error) .. require("allbinary_java").to_string("<br/>")) .. require("allbinary_java").to_string("Exception: ")) .. require("allbinary_java").to_string(e)) .. require("allbinary_java").to_string("<br/>")
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(OrderHistoryHelper, "setOrderStatus", 0)

return OrderHistoryHelper


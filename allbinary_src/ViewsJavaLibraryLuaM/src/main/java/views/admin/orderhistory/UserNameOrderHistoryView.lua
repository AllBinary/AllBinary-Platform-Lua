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
-- package views.admin.orderhistory

local UserNameOrderHistoryView = {}
package.loaded["views.admin.orderhistory.UserNameOrderHistoryView"] = UserNameOrderHistoryView

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local UserName = java_lazy("org.allbinary.business.user.username.UserName")
local OrderHistoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
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

-- class table UserNameOrderHistoryView is declared before the requires
UserNameOrderHistoryView.__index = UserNameOrderHistoryView
UserNameOrderHistoryView.className = "UserNameOrderHistoryView"
UserNameOrderHistoryView.javaClassName = "views.admin.orderhistory.UserNameOrderHistoryView"
setmetatable(UserNameOrderHistoryView, {__index = HttpStoreComponentView})
UserNameOrderHistoryView.java_implements = " ValidationComponentInterface DomNodeInterface "
UserNameOrderHistoryView.java_interfaces = function() return {ValidationComponentInterface, DomNodeInterface} end

function UserNameOrderHistoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.request == nil then self.request = nil end
    if self.userName == nil then self.userName = nil end
    if self.shipped == nil then self.shipped = nil end
    if self.partiallyShipped == nil then self.partiallyShipped = nil end
    if self.processing == nil then self.processing = nil end
    if self.preprocessing == nil then self.preprocessing = nil end
    if self.cancelled == nil then self.cancelled = nil end
    self.ON = "on"
end


function UserNameOrderHistoryView._jinit(self, transformInfoInterface)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    UserNameOrderHistoryView._init_fields(self)
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self.userName = self.request:getParameter(UserData.USERNAME)
        self.preprocessing = self.request:getParameter(OrderHistoryData.PREPROCESSINGNAME)
        self.shipped = self.request:getParameter(OrderHistoryData.SHIPPEDNAME)
        self.partiallyShipped = self.request:getParameter(OrderHistoryData.PARTIALLYSHIPPEDNAME)
        self.processing = self.request:getParameter(OrderHistoryData.PROCESSINGNAME)
        self.cancelled = self.request:getParameter(OrderHistoryData.CANCELLEDNAME)
    return self
end

function UserNameOrderHistoryView.new(...)
    local self = setmetatable({}, UserNameOrderHistoryView)
    UserNameOrderHistoryView._jinit(self, ...)
    return self
end


function UserNameOrderHistoryView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end
java_overload(UserNameOrderHistoryView, "addDomNodeInterfaces", 0)


-- throws Exception
function UserNameOrderHistoryView:view()
        local try_ok, try_error, try_value = pcall(function()
            self:addDomNodeInterfaces()
            do return "__jreturn", java_super(HttpStoreComponentView, "view", 0)(self) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(UserNameOrderHistoryView, "view", 0)


function UserNameOrderHistoryView:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local node = document:createElement(OrderData.ORDERS)
            local orderHistoryEntity = OrderHistoryEntity.new()
            local orderReviewVector = orderHistoryEntity:getOrders(self.userName)
            local size = orderReviewVector:size()
            for index = 0, size - 1 do
                local orderHistory = orderReviewVector:get(index)
                local orderHistoryNode = orderHistory:toXmlNode(document)
                local orderNode = document:createElement(orderHistory:getPaymentMethod())
                node:appendChild(orderHistory:toXmlNode(document))
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Attempt to View a users order history", self, "view")
            end
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PREPROCESSINGNAME, OrderHistoryData.PREPROCESSING))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PROCESSINGNAME, OrderHistoryData.PROCESSING))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.CANCELLEDNAME, OrderHistoryData.CANCELLED))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PARTIALLYSHIPPEDNAME, OrderHistoryData.PARTIALLYSHIPPED))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.SHIPPEDNAME, OrderHistoryData.SHIPPED))
            node:appendChild(ModDomHelper.createNameValueNodes(document, GLOBALS2.VIEWNAME, GLOBALS2.VIEW))
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(UserNameOrderHistoryView, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function UserNameOrderHistoryView:isValid()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Started", self, self.commonStrings.IS_VALID)
        end
        if rawequal(UserName.getInstance():isValid(self.userName), true) then
            return true
        end
        return false
end
java_overload(UserNameOrderHistoryView, "isValid", 0)


function UserNameOrderHistoryView:toValidationInfoDoc()
        return nil
end
java_overload(UserNameOrderHistoryView, "toValidationInfoDoc", 0)


function UserNameOrderHistoryView:toValidationInfoNode(document)
        return nil
end
java_overload(UserNameOrderHistoryView, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function UserNameOrderHistoryView:validationInfo()
        if rawequal(self.userName, nil) then
            return "No User Name Specified<br />"
        end
        if rawequal(UserName.getInstance():isValid(self.userName), false) then
            return "Invalid User Name<br />"
        end
        return "Unknown Error<br />"
end
java_overload(UserNameOrderHistoryView, "validationInfo", 0)


-- throws Exception
function UserNameOrderHistoryView:getTransformInfoInterface()
        return java_super(HttpStoreComponentView, "getTransformInfoInterface", 0)(self)
end
java_overload(UserNameOrderHistoryView, "getTransformInfoInterface", 0)

return UserNameOrderHistoryView


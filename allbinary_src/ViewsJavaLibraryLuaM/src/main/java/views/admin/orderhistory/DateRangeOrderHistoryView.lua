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

local DateRangeOrderHistoryView = {}
package.loaded["views.admin.orderhistory.DateRangeOrderHistoryView"] = DateRangeOrderHistoryView

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

local Calendar = java_lazy("java.util.Calendar")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderHistoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TimeUtil = java_lazy("org.allbinary.time.TimeUtil")
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

-- class table DateRangeOrderHistoryView is declared before the requires
DateRangeOrderHistoryView.__index = DateRangeOrderHistoryView
DateRangeOrderHistoryView.className = "DateRangeOrderHistoryView"
DateRangeOrderHistoryView.javaClassName = "views.admin.orderhistory.DateRangeOrderHistoryView"
setmetatable(DateRangeOrderHistoryView, {__index = HttpStoreComponentView})
DateRangeOrderHistoryView.java_implements = " ValidationComponentInterface DomNodeInterface "
DateRangeOrderHistoryView.java_interfaces = function() return {ValidationComponentInterface, DomNodeInterface} end

function DateRangeOrderHistoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.VIEWALLORDERS = "View All"
    self.VIEWORDERSINLASTHOUR = "Last Hour"
    self.VIEWORDERSINLASTDAY = "Last Day"
    self.VIEWORDERSINLASTWEEK = "Last Week"
    self.VIEWORDERSINLAST30DAYS = "30 Days"
    if self.request == nil then self.request = nil end
    if self.shipped == nil then self.shipped = nil end
    if self.partiallyShipped == nil then self.partiallyShipped = nil end
    if self.processing == nil then self.processing = nil end
    if self.preprocessing == nil then self.preprocessing = nil end
    if self.cancelled == nil then self.cancelled = nil end
    if self.dateType == nil then self.dateType = nil end
    if self.toDate == nil then self.toDate = nil end
    if self.fromDate == nil then self.fromDate = nil end
    if self.fromYear == nil then self.fromYear = nil end
    if self.fromMonth == nil then self.fromMonth = nil end
    if self.fromDay == nil then self.fromDay = nil end
    if self.fromHour == nil then self.fromHour = nil end
    if self.toYear == nil then self.toYear = nil end
    if self.toMonth == nil then self.toMonth = nil end
    if self.toDay == nil then self.toDay = nil end
    if self.toHour == nil then self.toHour = nil end
    if self.command == nil then self.command = nil end
    self.ON = "on"
    self.MAXLEN = 15
end


function DateRangeOrderHistoryView._jinit(self, transformInfoInterface)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    DateRangeOrderHistoryView._init_fields(self)
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self:getFormData()
    return self
end

function DateRangeOrderHistoryView.new(...)
    local self = setmetatable({}, DateRangeOrderHistoryView)
    DateRangeOrderHistoryView._jinit(self, ...)
    return self
end


function DateRangeOrderHistoryView:getFormData()
        self.dateType = self.request:getParameter(OrderHistoryData.DATETYPE)
        self.preprocessing = self.request:getParameter(OrderHistoryData.PREPROCESSINGNAME)
        self.shipped = self.request:getParameter(OrderHistoryData.SHIPPEDNAME)
        self.partiallyShipped = self.request:getParameter(OrderHistoryData.PARTIALLYSHIPPEDNAME)
        self.processing = self.request:getParameter(OrderHistoryData.PROCESSINGNAME)
        self.cancelled = self.request:getParameter(OrderHistoryData.CANCELLEDNAME)
        self.fromYear = self.request:getParameter(OrderHistoryData.FROMYEAR)
        self.fromMonth = self.request:getParameter(OrderHistoryData.FROMMONTH)
        self.fromDay = self.request:getParameter(OrderHistoryData.FROMDAY)
        self.fromHour = self.request:getParameter(OrderHistoryData.FROMHOUR)
        self.toYear = self.request:getParameter(OrderHistoryData.TOYEAR)
        self.toMonth = self.request:getParameter(OrderHistoryData.TOMONTH)
        self.toDay = self.request:getParameter(OrderHistoryData.TODAY)
        self.toHour = self.request:getParameter(OrderHistoryData.TOHOUR)
        self.command = self.request:getParameter(GLOBALS2.ADMINCOMMAND)
end
java_overload(DateRangeOrderHistoryView, "getFormData", 0)


function DateRangeOrderHistoryView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end
java_overload(DateRangeOrderHistoryView, "addDomNodeInterfaces", 0)


-- throws Exception
function DateRangeOrderHistoryView:view()
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
java_overload(DateRangeOrderHistoryView, "view", 0)


function DateRangeOrderHistoryView:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Attempt to View orders in (fromDate=")
                stringBuffer:append(self.fromDate)
                stringBuffer:append(",toDate=")
                stringBuffer:append(self.toDate)
                stringBuffer:append(") and status")
                self.logUtil:putF(tostring(stringBuffer), self, "view")
            end
            local node = document:createElement(OrderData.ORDERS)
            if not rawequal(self.preprocessing, nil) and rawequal(((self.preprocessing < self.ON and -1) or (self.preprocessing > self.ON and 1) or 0), 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Adding Preprocessing Orders", self, "toXmlNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.PREPROCESSING, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if not rawequal(self.shipped, nil) and rawequal(((self.shipped < self.ON and -1) or (self.shipped > self.ON and 1) or 0), 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Adding Shipped Orders", self, "toXmlNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.SHIPPED, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if not rawequal(self.partiallyShipped, nil) and rawequal(((self.partiallyShipped < self.ON and -1) or (self.partiallyShipped > self.ON and 1) or 0), 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Adding Partially Shipped Orders", self, "toDomNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.PARTIALLYSHIPPED, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if not rawequal(self.processing, nil) and rawequal(((self.processing < self.ON and -1) or (self.processing > self.ON and 1) or 0), 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Adding Processing Orders", self, "toXmlNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.PROCESSING, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if not rawequal(self.cancelled, nil) and rawequal(((self.cancelled < self.ON and -1) or (self.cancelled > self.ON and 1) or 0), 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("Adding Cancelled Orders", self, "view")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.CANCELLED, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
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
java_overload(DateRangeOrderHistoryView, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function DateRangeOrderHistoryView:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local isValid = true
            if rawequal(self.dateType, nil) or (not rawequal(((self.dateType < OrderHistoryData.TYPELONG and -1) or (self.dateType > OrderHistoryData.TYPELONG and 1) or 0), 0) and not rawequal(((self.dateType < OrderHistoryData.TYPECAESAR and -1) or (self.dateType > OrderHistoryData.TYPECAESAR and 1) or 0), 0)) then
                isValid = false
            end
            if not rawequal(self.dateType, nil) then
                if rawequal(((self.dateType < OrderHistoryData.TYPELONG and -1) or (self.dateType > OrderHistoryData.TYPELONG and 1) or 0), 0) then
                    local calendar = Calendar.getInstance()
                    local currentTime = calendar:getTimeInMillis()
                    local rangeDate = StringUtil.getInstance().EMPTY_STRING
                    if rawequal(((self.command < self.VIEWORDERSINLASTHOUR and -1) or (self.command > self.VIEWORDERSINLASTHOUR and 1) or 0), 0) then
                        local oneHour = 60 * 60 * 1000
                        rangeDate = tostring(oneHour)
                    elseif rawequal(((self.command < self.VIEWORDERSINLASTDAY and -1) or (self.command > self.VIEWORDERSINLASTDAY and 1) or 0), 0) then
                        local oneDay = 24 * 60 * 60 * 1000
                        rangeDate = tostring(oneDay)
                    elseif rawequal(((self.command < self.VIEWORDERSINLASTWEEK and -1) or (self.command > self.VIEWORDERSINLASTWEEK and 1) or 0), 0) then
                        local oneWeek = 7 * 24 * 60 * 60 * 1000
                        rangeDate = tostring(oneWeek)
                    elseif rawequal(((self.command < self.VIEWORDERSINLAST30DAYS and -1) or (self.command > self.VIEWORDERSINLAST30DAYS and 1) or 0), 0) then
                        local thirtyDays = 30 * 24 * 60 * 60 * 1000
                        rangeDate = tostring(thirtyDays)
                    elseif rawequal(((self.command < self.VIEWALLORDERS and -1) or (self.command > self.VIEWALLORDERS and 1) or 0), 0) then
                        rangeDate = tostring(currentTime)
                    end
                    local rangeDateLong = require("allbinary_java").number_value(rangeDate, "longValue")
                    self.fromDate = tostring(currentTime - rangeDateLong)
                    local time = tostring(tostring(currentTime))
                    self.toDate = time
                elseif rawequal(((self.dateType < OrderHistoryData.TYPECAESAR and -1) or (self.dateType > OrderHistoryData.TYPECAESAR and 1) or 0), 0) then
                    local calendar = Calendar.getInstance()
                    TimeUtil.getInstance():setCalendar(calendar, self.fromYear, self.fromMonth, self.fromDay, self.fromHour)
                    self.fromDate = tostring(calendar:getTimeInMillis())
                    TimeUtil.getInstance():setCalendar(calendar, self.toYear, self.toMonth, self.toDay, self.toHour)
                    self.toDate = tostring(calendar:getTimeInMillis())
                end
                if StringValidationUtil.getInstance():isEmpty(self.toDate) or #self.toDate > self.MAXLEN then
                    isValid = false
                end
                if StringValidationUtil.getInstance():isEmpty(self.fromDate) or #self.fromDate > self.MAXLEN then
                    isValid = false
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Attempt to View orders in (fromDate=")
                stringBuffer:append(self.fromDate)
                stringBuffer:append(",toDate=")
                stringBuffer:append(self.toDate)
                stringBuffer:append(")")
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            end
            do return "__jreturn", isValid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:put("Exception in validation", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DateRangeOrderHistoryView, "isValid", 0)


function DateRangeOrderHistoryView:toValidationInfoDoc()
        return nil
end
java_overload(DateRangeOrderHistoryView, "toValidationInfoDoc", 0)


function DateRangeOrderHistoryView:toValidationInfoNode(document)
        return nil
end
java_overload(DateRangeOrderHistoryView, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function DateRangeOrderHistoryView:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local result = StringMaker.new()
            if rawequal(self.dateType, nil) or (not rawequal(((self.dateType < OrderHistoryData.TYPELONG and -1) or (self.dateType > OrderHistoryData.TYPELONG and 1) or 0), 0) and not rawequal(((self.dateType < OrderHistoryData.TYPECAESAR and -1) or (self.dateType > OrderHistoryData.TYPECAESAR and 1) or 0), 0)) then
                result:append("DATETYPE not recognized")
            end
            if StringValidationUtil.getInstance():isEmpty(self.toDate) or #self.toDate > self.MAXLEN then
                result:append("Invalid To Date")
            end
            if StringValidationUtil.getInstance():isEmpty(self.fromDate) or #self.fromDate > self.MAXLEN then
                result:append("Invalid From Date")
            end
            do return "__jreturn", tostring(result) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DateRangeOrderHistoryView, "validationInfo", 0)


-- throws Exception
function DateRangeOrderHistoryView:getTransformInfoInterface()
        return java_super(HttpStoreComponentView, "getTransformInfoInterface", 0)(self)
end
java_overload(DateRangeOrderHistoryView, "getTransformInfoInterface", 0)

return DateRangeOrderHistoryView


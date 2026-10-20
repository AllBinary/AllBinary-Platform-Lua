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

-- local Calendar = require("java.util.Calendar")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TimeUtil = require("org.allbinary.time.TimeUtil")
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

local DateRangeOrderHistoryView = {}
DateRangeOrderHistoryView.__index = DateRangeOrderHistoryView
DateRangeOrderHistoryView.className = "DateRangeOrderHistoryView"
setmetatable(DateRangeOrderHistoryView, {__index = HttpStoreComponentView})

function DateRangeOrderHistoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.VIEWALLORDERS = "View All"
    self.VIEWORDERSINLASTHOUR = "Last Hour"
    self.VIEWORDERSINLASTDAY = "Last Day"
    self.VIEWORDERSINLASTWEEK = "Last Week"
    self.VIEWORDERSINLAST30DAYS = "30 Days"
    self.request = nil
    self.shipped = nil
    self.partiallyShipped = nil
    self.processing = nil
    self.preprocessing = nil
    self.cancelled = nil
    self.dateType = nil
    self.toDate = nil
    self.fromDate = nil
    self.fromYear = nil
    self.fromMonth = nil
    self.fromDay = nil
    self.fromHour = nil
    self.toYear = nil
    self.toMonth = nil
    self.toDay = nil
    self.toHour = nil
    self.command = nil
    self.ON = "on"
    self.MAXLEN = 15
end


function DateRangeOrderHistoryView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), DateRangeOrderHistoryView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self:getFormData()
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
        self.command = self.request:getParameter(self.GLOBALS2.ADMINCOMMAND)
end


function DateRangeOrderHistoryView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function DateRangeOrderHistoryView:view()
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


function DateRangeOrderHistoryView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Attempt to View orders in (fromDate=")
                stringBuffer:append(self.fromDate)
                stringBuffer:append(",toDate=")
                stringBuffer:append(self.toDate)
                stringBuffer:append(") and status")
                self.logUtil:putF(tostring(stringBuffer), self, "view")
            end
            local node = document:createElement(OrderData.ORDERS)
            if self.preprocessing ~= nil and ((self.preprocessing < self.ON and -1) or (self.preprocessing > self.ON and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Adding Preprocessing Orders", self, "toXmlNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.PREPROCESSING, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if self.shipped ~= nil and ((self.shipped < self.ON and -1) or (self.shipped > self.ON and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Adding Shipped Orders", self, "toXmlNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.SHIPPED, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if self.partiallyShipped ~= nil and ((self.partiallyShipped < self.ON and -1) or (self.partiallyShipped > self.ON and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Adding Partially Shipped Orders", self, "toDomNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.PARTIALLYSHIPPED, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if self.processing ~= nil and ((self.processing < self.ON and -1) or (self.processing > self.ON and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Adding Processing Orders", self, "toXmlNode")
                end
                local orderHistoryVector = OrderHistoryEntityFactory.getInstance():getOrders(OrderHistoryData.PROCESSING, self.fromDate, self.toDate)
                local size = orderHistoryVector:size()
                for index = 0, size - 1 do
                    local orderHistory = orderHistoryVector:get(index)
                    node:appendChild(orderHistory:toXmlNode(document))
                end
            end
            if self.cancelled ~= nil and ((self.cancelled < self.ON and -1) or (self.cancelled > self.ON and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
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
            node:appendChild(ModDomHelper.createNameValueNodes(document, self.GLOBALS2.VIEWNAME, self.GLOBALS2.VIEW))
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            return nil
        end
end


function DateRangeOrderHistoryView:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if self.dateType == nil or (((self.dateType < OrderHistoryData.TYPELONG and -1) or (self.dateType > OrderHistoryData.TYPELONG and 1) or 0) ~= 0 and ((self.dateType < OrderHistoryData.TYPECAESAR and -1) or (self.dateType > OrderHistoryData.TYPECAESAR and 1) or 0) ~= 0) then
                isValid = false
            end
            if self.dateType ~= nil then
                if ((self.dateType < OrderHistoryData.TYPELONG and -1) or (self.dateType > OrderHistoryData.TYPELONG and 1) or 0) == 0 then
                    local calendar = Calendar.getInstance()
                    local currentTime = calendar:getTimeInMillis()
                    local rangeDate = StringUtil.getInstance().EMPTY_STRING
                    if ((self.command < self.VIEWORDERSINLASTHOUR and -1) or (self.command > self.VIEWORDERSINLASTHOUR and 1) or 0) == 0 then
                        local oneHour = 60 * 60 * 1000
                        rangeDate = tostring(oneHour)
                    elseif ((self.command < self.VIEWORDERSINLASTDAY and -1) or (self.command > self.VIEWORDERSINLASTDAY and 1) or 0) == 0 then
                        local oneDay = 24 * 60 * 60 * 1000
                        rangeDate = tostring(oneDay)
                    elseif ((self.command < self.VIEWORDERSINLASTWEEK and -1) or (self.command > self.VIEWORDERSINLASTWEEK and 1) or 0) == 0 then
                        local oneWeek = 7 * 24 * 60 * 60 * 1000
                        rangeDate = tostring(oneWeek)
                    elseif ((self.command < self.VIEWORDERSINLAST30DAYS and -1) or (self.command > self.VIEWORDERSINLAST30DAYS and 1) or 0) == 0 then
                        local thirtyDays = 30 * 24 * 60 * 60 * 1000
                        rangeDate = tostring(thirtyDays)
                    elseif ((self.command < self.VIEWALLORDERS and -1) or (self.command > self.VIEWALLORDERS and 1) or 0) == 0 then
                        rangeDate = tostring(currentTime)
                    end
                    local rangeDateLong = math.tointeger(rangeDate // 1)
                    self.fromDate = tostring(currentTime - rangeDateLong)
                    local time = tostring(tostring(currentTime))
                    self.toDate = time
                elseif ((self.dateType < OrderHistoryData.TYPECAESAR and -1) or (self.dateType > OrderHistoryData.TYPECAESAR and 1) or 0) == 0 then
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
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Attempt to View orders in (fromDate=")
                stringBuffer:append(self.fromDate)
                stringBuffer:append(",toDate=")
                stringBuffer:append(self.toDate)
                stringBuffer:append(")")
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
            end
            return isValid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:put("Exception in validation", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function DateRangeOrderHistoryView:toValidationInfoDoc()
        return nil
end


function DateRangeOrderHistoryView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function DateRangeOrderHistoryView:validationInfo()
        local try_ok, try_error = pcall(function()
            local result = StringMaker.new()
            if self.dateType == nil or (((self.dateType < OrderHistoryData.TYPELONG and -1) or (self.dateType > OrderHistoryData.TYPELONG and 1) or 0) ~= 0 and ((self.dateType < OrderHistoryData.TYPECAESAR and -1) or (self.dateType > OrderHistoryData.TYPECAESAR and 1) or 0) ~= 0) then
                result:append("DATETYPE not recognized")
            end
            if StringValidationUtil.getInstance():isEmpty(self.toDate) or #self.toDate > self.MAXLEN then
                result:append("Invalid To Date")
            end
            if StringValidationUtil.getInstance():isEmpty(self.fromDate) or #self.fromDate > self.MAXLEN then
                result:append("Invalid From Date")
            end
            return tostring(result)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end

return DateRangeOrderHistoryView


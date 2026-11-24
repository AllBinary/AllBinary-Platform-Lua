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
-- package org.allbinary.business.user.commerce.inventory.order

local OrderHistoryData = {}
package.loaded["org.allbinary.business.user.commerce.inventory.order.OrderHistoryData"] = OrderHistoryData

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

-- class table OrderHistoryData is declared before the requires
OrderHistoryData.__index = OrderHistoryData
OrderHistoryData.className = "OrderHistoryData"
OrderHistoryData.javaClassName = "org.allbinary.business.user.commerce.inventory.order.OrderHistoryData"

function OrderHistoryData._jinit(self)
    return self
end

function OrderHistoryData.new()
    return OrderHistoryData._jinit(setmetatable({}, OrderHistoryData))
end

OrderHistoryData.MAXIDLEN = 19
OrderHistoryData.DATEDELTA = "DATE_DELTA"
OrderHistoryData.DATETYPE = "DATE_TYPE"
OrderHistoryData.TYPELONG = "TYPE_LONG"
OrderHistoryData.TYPECAESAR = "TYPE_CAESAR"
OrderHistoryData.TODATE = "TO_DATE"
OrderHistoryData.FROMHOUR = "FROM_HOUR"
OrderHistoryData.FROMDAY = "FROM_DAY"
OrderHistoryData.FROMMONTH = "FROM_MONTH"
OrderHistoryData.FROMYEAR = "FROM_YEAR"
OrderHistoryData.TOHOUR = "TO_HOUR"
OrderHistoryData.TODAY = "TO_DAY"
OrderHistoryData.TOMONTH = "TO_MONTH"
OrderHistoryData.TOYEAR = "TO_YEAR"
OrderHistoryData.ORDERHISTORY = "ORDERHISTORY"
OrderHistoryData.SHIPPEDDATE = "ORDERHISTORY_SHIPPED_DATE"
OrderHistoryData.ORDERDATE = "ORDERHISTORY_ORDER_DATE"
OrderHistoryData.TRANSDATE = "ORDERHISTORY_TRANS_DATE"
OrderHistoryData.CANCELDATE = "ORDERHISTORY_CANCEL_DATE"
OrderHistoryData.SHIPPEDDATEFORMATTED = "ORDERHISTORY_SHIPPED_DATE_FORMATTED"
OrderHistoryData.ORDERDATEFORMATTED = "ORDERHISTORY_ORDER_DATE_FORMATTED"
OrderHistoryData.TRANSDATEFORMATTED = "ORDERHISTORY_TRANS_DATE_FORMATTED"
OrderHistoryData.CANCELDATEFORMATTED = "ORDERHISTORY_CANCEL_DATE_FORMATTED"
OrderHistoryData.SUBTOTAL = "ORDERHISTORY_SUB_TOTAL"
OrderHistoryData.SHIPPINGCOST = "ORDERHISTORY_SHIPPING_COST"
OrderHistoryData.TAX = "ORDERHISTORY_TAX"
OrderHistoryData.TOTAL = "ORDERHISTORY_TOTAL"
OrderHistoryData.CANCELINFO = "ORDERHISTORY_CANCEL_INFO"
OrderHistoryData.CANCELTYPE = "ORDERHISTORY_CANCEL_TYPE"
OrderHistoryData.STATUS = "ORDERHISTORY_STATUS"
OrderHistoryData.PREPROCESSINGNAME = "PREPROCESSING"
OrderHistoryData.PROCESSINGNAME = "PROCESSING"
OrderHistoryData.CANCELLEDNAME = "CANCELLED"
OrderHistoryData.PARTIALLYSHIPPEDNAME = "PARTIALLYSHIPPED"
OrderHistoryData.SHIPPEDNAME = "SHIPPED"
OrderHistoryData.PREPROCESSING = "Order Preprocessing"
OrderHistoryData.PROCESSING = "Order Processing"
OrderHistoryData.CANCELLED = "Order Cancelled"
OrderHistoryData.PARTIALLYSHIPPED = "Order Partially Shipped"
OrderHistoryData.SHIPPED = "Order Shipped"
OrderHistoryData.SETSTATUS = "Set Status"

return OrderHistoryData


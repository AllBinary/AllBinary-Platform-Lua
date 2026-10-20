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

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderItemsRequestHelperFactory = {}
OrderItemsRequestHelperFactory.__index = OrderItemsRequestHelperFactory
OrderItemsRequestHelperFactory.className = "OrderItemsRequestHelperFactory"


function OrderItemsRequestHelperFactory.new()
    local self = setmetatable({}, OrderItemsRequestHelperFactory)
    return self
end


-- throws LicensingException
function OrderItemsRequestHelperFactory:getInstance(hashMap, pageContext)
        return HelperFactory.getInstance(OrderItemsRequestHelperFactory.FACTORYNAME, OrderItemsRequestHelperFactory.CLASSNAME, hashMap, pageContext)
end

OrderItemsRequestHelperFactory.CLASSNAME = "admin.taghelpers.OrderItemsRequestHelper"
OrderItemsRequestHelperFactory.FACTORYNAME = "OrderItemsRequestHelperFactory"

return OrderItemsRequestHelperFactory

